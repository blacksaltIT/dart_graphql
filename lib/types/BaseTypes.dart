// Copyright (c) 2018, the Black Salt authors.  Please see the AUTHORS file
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

  findFragment(String shortName, String currentPath) {
    String fragName = "${upperCaseFirst(shortName)}Fragment";
    return findType(fragName, currentPath);
  }

  final baseClass = refer("MapObject", "../graphql/fetch.dart");

  upperCaseFirst(String s) {
    return s[0].toUpperCase() + s.substring(1);
  }

  findType(String typeName, String currentPath) {
    TypedReference t = this._schema.findType(typeName);
    if (t == null) return null;
    Reference r;
    if (t?.file == currentPath) {
      r = refer(typeName);
    } else {
      r = refer(typeName, p.relative(t?.file, from: p.dirname(currentPath)));
    }
    return new TypedReference(r, t.type);
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
      if (type.type == GraphType.OBJECT || type.type == GraphType.LIST)
        cb.fields.add(generateField(name, type));
      cb.methods.add(generateGetter(name, type));
      if (type.type != GraphType.ENUM)
        cb.methods.add(generateSetter(name, type));
    }

    cb.methods.add(new Method((MethodBuilder b) => b
      ..name = "fromMap"
      ..static = true
      ..returns = refer(className)
      ..requiredParameters.add((new ParameterBuilder()
            ..name = "map"
            ..type = refer("dynamic"))
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

  generateGetter(String name, TypedReference type) {
    MethodBuilder getter = new MethodBuilder();
    getter
      ..name = name
      ..returns = type.reference
      ..type = MethodType.getter
      ..body = getterCode(getter, name, type);
    return getter.build();
  }

  getterCode(MethodBuilder getter, String name, TypedReference type) {
    getter.lambda = false;
    switch (type.type) {
      case GraphType.OBJECT:
      case GraphType.INPUT_OBJECT:
        return new Code(
            'if(_$name == null) _$name = ${type.reference.symbol}.fromMap(map["$name"]); return _$name;');
      case GraphType.ENUM:
        return new Code(
            'return ${type.reference.symbol}.values[map["$name"]];');
      case GraphType.LIST:
        if (type.genericReference.type == GraphType.OBJECT ||
            type.genericReference.type == GraphType.INPUT_OBJECT) {
          return new Code(
              'if(_$name == null) { _$name = []; for (dynamic aVar in map["$name"]) (_$name as List).add(${type.genericReference.reference.symbol}.fromMap(aVar)); } return _$name;');
        } else {
          throw new ArgumentError(
              "Unknown or not supported graphql type '${type.type}' for getter");
        }
        break;
      case GraphType.OTHER:
        Reference r = refer('scalarSerializers', '../graphql/fetch.dart');
        return new Code.scope((a) =>
            'return ${a(r)}["${type.scalaTypeName}"].deserialize(map["$name"]);');
      default:
        getter.lambda = true;
        return new Code('map["$name"]');
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
      case GraphType.INPUT_OBJECT:
        return new Code('_$name = value');
      case GraphType.LIST:
        if (type.genericReference.type == GraphType.OBJECT ||
            type.genericReference.type == GraphType.INPUT_OBJECT) {
          return new Code('_$name = value');
        } else {
          throw new ArgumentError(
              "Unknown or not supported graphql type '${type.type}' for setter");
        }
        break;
      default:
        return new Code('map["$name"] = value');
    }
  }
}

enum GraphType { LIST, OBJECT, INPUT_OBJECT, ENUM, SCALAR, OTHER }

class TypedReference {
  Reference reference;
  GraphType type;
  TypedReference genericReference;
  String scalaTypeName;
  TypedReference(this.reference, this.type,
      {this.genericReference, this.scalaTypeName});

  String file;
}
