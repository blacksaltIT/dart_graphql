// Copyright (c) 2019, the Black Salt authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of 'generator.dart';

class BaseTypes {
  GraphqlSchema _schema;

  BaseTypes(this._schema);

  TypedReference findScalarType(String graphqlType) {
    switch (graphqlType) {
      case "Int":
        return new TypedReference(refer("int", "dart:core"), GraphType.SCALAR);
      case "ID":
        return new TypedReference(
            refer("String", "dart:core"), GraphType.SCALAR);
      case "String":
      case "UUID":
        return new TypedReference(
            refer("String", "dart:core"), GraphType.SCALAR);
      case "Float":
        return new TypedReference(
            refer("double", "dart:core"), GraphType.SCALAR);
      case "Boolean":
        return new TypedReference(refer("bool", "dart:core"), GraphType.SCALAR);
      case "Enum":
        return new TypedReference(
            refer("String", "dart:core"), GraphType.SCALAR);
      default:
        var serializer = scalarSerializers[graphqlType];
        if (serializer != null) {
          return new TypedReference(
              refer(serializer.dartName, serializer.dartPackage),
              GraphType.OTHER,
              scalaTypeName: graphqlType);
        }
        return new TypedReference(
            refer("dynamic", "dart:core"), GraphType.SCALAR);
    }
  }

  final baseClass = refer("MapObject", "../graphql/fetch.dart");

  upperCaseFirst(String s) {
    return s[0].toUpperCase() + s.substring(1);
  }

  lowerCaseFirst(String s) {
    return s[0].toLowerCase() + s.substring(1);
  }

  String wrapStringCode(String code) {
    return '"""${code.replaceAll("\$", "\\\$")}"""';
  }

  generateClass(
      ClassBuilder cb, String className, Map<String, TypedReference> fields) {
    cb.name = className;
    cb.extend = baseClass;

    for (var name in fields.keys) {
      TypedReference type = fields[name];
      if (type.type == GraphType.OBJECT ||
          type.type == GraphType.UNION ||
          type.type == GraphType.LIST) {
        cb.fields.add(generateField(name, type));
      }

      cb.methods.add(generateGetter(name, type));

      if (type.type != GraphType.ENUM)
        cb.methods.add(generateSetter(name, type));
    }

    generateFromMapConstructor(cb, className);
  }

  generateUnion(ClassBuilder cb, String className,
      Map<String, TypedReference> fields, List<TypedReference> possibleTypes) {
    cb.name = className;
    cb.extend = baseClass;

    if (fields.containsKey("typename")) {
      var propName = "typename";
      var sourceName = "__typename";
      var type = fields["typename"];

      //cb.fields.add(generateField(propName, type));
      cb.methods.add(generateGetter(propName, type, sourceName: sourceName));
    }

    for (var pType in possibleTypes) {
      var propName = lowerCaseFirst(pType.reference.symbol);
      cb.fields.add(generateField(propName, pType));

      MethodBuilder factoryMethodBuilder = new MethodBuilder()
        ..name = propName
        ..returns = pType.reference
        ..type = MethodType.getter
        ..body = new Code(
            'if(_$propName == null) _$propName = ${pType.reference.symbol}.fromMap(map); return _$propName;');

      cb.methods.add(factoryMethodBuilder.build());
    }

    generateFromMapConstructor(cb, className);
  }

  void generateFromMapConstructor(ClassBuilder cb, String className) {
    cb.methods.add(new Method((MethodBuilder b) => b
      ..name = "fromMap"
      ..static = true
      ..returns = refer(className)
      ..requiredParameters.add((new ParameterBuilder()
            ..name = "map"
            ..type = refer("Map<String, dynamic>"))
          .build())
      ..body = new Code('''return map == null ? 
        null : 
        new $className()..map.addAll(map);  
        ''')));
  }

  generateField(String name, TypedReference type) {
    FieldBuilder field = new FieldBuilder()
      ..type = type.reference
      ..name = "_$name";
    return field.build();
  }

  generateGetter(String name, TypedReference type, {String sourceName}) {
    MethodBuilder getter = new MethodBuilder();
    getter
      ..name = name
      ..returns = type.reference
      ..type = MethodType.getter
      ..body = getterCode(getter, name, type, sourceName: sourceName);
    return getter.build();
  }

  getterCode(MethodBuilder getter, String name, TypedReference type,
      {String sourceName}) {
    getter.lambda = false;
    switch (type.type) {
      case GraphType.OBJECT:
      case GraphType.UNION:
        return new Code(
            'if(_$name == null) _$name = ${type.reference.symbol}.fromMap(map["${sourceName ?? name}"]); return _$name;');
      case GraphType.ENUM:
        return new Code(
            'return ${type.reference.symbol}.values[map["$name"]];');
      case GraphType.LIST:
        if (type.genericReference.type == GraphType.OBJECT ||
            type.genericReference.type == GraphType.UNION) {
          return new Code(
              'if(_$name == null) { _$name = []; for (dynamic aVar in map["${sourceName ?? name}"]) _$name.add(${type.genericReference.reference.symbol}.fromMap(aVar)); } return _$name;');
        } else if (type.genericReference.type == GraphType.ENUM) {
          getter.lambda = true;
          return new Code('_$name');
        } else {
          throw new ArgumentError(
              "Unknown or not supported graphql type '${type.type}' for getter");
        }
        break;
      case GraphType.OTHER:
        Reference r = refer('scalarSerializers', '../graphql/fetch.dart');
        return new Code.scope((a) =>
            'return ${a(r)}["${type.scalaTypeName}"].deserialize(map["${sourceName ?? name}"]);');
      default:
        getter.lambda = true;
        return new Code('map["${sourceName ?? name}"]');
    }
  }

  generateSetter(String name, TypedReference type) {
    MethodBuilder getter = new MethodBuilder()
      ..name = name
      ..requiredParameters.add((new ParameterBuilder()
            ..name = "value"
            ..type = type.reference)
          .build())
      ..lambda = true
      ..type = MethodType.setter
      ..body = setterCode(name, type);
    return getter.build();
  }

  setterCode(String name, TypedReference type) {
    switch (type.type) {
      case GraphType.OBJECT:
        return new Code('_$name = value');
      case GraphType.LIST:
        if (type.genericReference.type == GraphType.OBJECT ||
            type.genericReference.type == GraphType.ENUM) {
          return new Code('_$name = value');
        } else {
          throw new ArgumentError(
              "Unknown or not supported graphql type '${type.type}' for setter");
        }
        break;
      case GraphType.OTHER:
        Reference r = refer('scalarSerializers', '../graphql/fetch.dart');
        return new Code.scope((a) =>
            'map["$name"] = ${a(r)}["${type.scalaTypeName}"].serialize(value)');
      default:
        return new Code('map["$name"] = value');
    }
  }
}

enum GraphType { LIST, OBJECT, UNION, ENUM, SCALAR, OTHER }

class TypedReference {
  Reference reference;
  GraphType type;
  TypedReference genericReference;
  String scalaTypeName;
  TypedReference(this.reference, this.type,
      {this.genericReference, this.scalaTypeName});

  String file;
}
