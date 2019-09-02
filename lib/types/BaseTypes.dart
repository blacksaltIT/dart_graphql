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

  final baseClass =
      refer("MapObject", "package:dart_graphql/dart_graphql.dart");

  upperCaseFirst(String s) {
    return s[0].toUpperCase() + s.substring(1);
  }

  lowerCaseFirst(String s) {
    return s[0].toLowerCase() + s.substring(1);
  }

  String wrapStringCode(String code) {
    return '"""${code.replaceAll("\$", "\\\$")}"""';
  }

  generateEnumForType(LibraryBuilder b, dynamic typeSchema) {
    String className = typeSchema.name;
    if (_schema.isRegistered(className)) return className;
    _schema.registerType(className);

    b.body.add(Code(
        'enum $className { ${typeSchema.enumValues.map((e) => e.name).join(',')} }\n'));
    var mapBody = typeSchema.enumValues
        .map((e) => '"${e.name.toLowerCase()}": ${className}.${e.name}');
    b.body.add(Code('''
        Map<String, $className> _mapNamesFor${className} = { ${mapBody.join(",")} };
        $className parse${className}(String value) => value != null && value != "" ? _mapNamesFor${className}[value.toLowerCase()] : null;
        String to${className}String($className value) => value?.toString()?.split(".")?.last;
        '''));

    return className;
  }

  generateClass(
      ClassBuilder cb, String className, Map<String, TypedReference> fields) {
    cb.name = className;
    cb.extend = baseClass;

    for (var name in fields.keys) {
      TypedReference type = fields[name];

      cb.methods.add(generateGetter(name, type));
      cb.methods.add(generateSetter(name, type));
    }

    generateFromMapConstructor(cb, className);
    generateClone(cb, className);
  }

  generateUnion(ClassBuilder cb, String className,
      Map<String, TypedReference> fields, List<TypedReference> possibleTypes) {
    cb.name = className;
    cb.extend = baseClass;

    if (fields.containsKey("typename")) {
      var propName = "typename";
      var sourceName = "__typename";
      var type = fields["typename"];

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
    generateClone(cb, className);
  }

  void generateFromMapConstructor(ClassBuilder cb, String className) {
    Reference jsonEncodeRef = refer("jsonEncode", 'dart:convert');
    Reference jsonDecodeRef = refer("jsonDecode", 'dart:convert');

    cb.methods.add(new Method((MethodBuilder b) => b
      ..name = "fromMap"
      ..static = true
      ..returns = refer(className)
      ..requiredParameters.add((new ParameterBuilder()
            ..name = "map"
            ..type = refer("Map<String, dynamic>"))
          .build())
      ..optionalParameters.add((ParameterBuilder()
            ..name = "deepCopy"
            ..defaultTo = Code('false'))
          .build())
      ..body = Code.scope((a) => '''
      if (map == null) return null;
      if (deepCopy)
        map = ${a(jsonDecodeRef)}(${a(jsonEncodeRef)}(map));
      return $className()
        ..map = map;
      ''')));
  }

  void generateClone(ClassBuilder cb, String className) {
    cb.methods.add(new Method((MethodBuilder b) => b
      ..name = "clone"
      ..returns = refer(className)
      ..lambda = true
      ..body = new Code('$className.fromMap(toJson(), true)')));
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
        String propName = sourceName ?? name;
        return new Code("""
            if(map['$propName'] is ${type.reference.symbol}) return map['$propName'];
            return map['$propName'] = ${type.reference.symbol}.fromMap(map['$propName']);
            """);
      case GraphType.ENUM:
        getter.lambda = true;
        return new Code('parse${type.reference.symbol}(map["$name"])');
      case GraphType.LIST:
        if (type.genericReference.type == GraphType.OBJECT ||
            type.genericReference.type == GraphType.UNION) {
          String propName = sourceName ?? name;
          String listType = "List<${type.genericReference.reference.symbol}>";
          return new Code("""
            if(map['$propName'] == null || map['$propName'] is $listType) return map['$propName'];

            $listType items = [];
            for (dynamic aVar in map['$propName']) 
              items.add(${type.genericReference.reference.symbol}.fromMap(aVar));

            return map['$propName'] = items;
            """);
        } else if (type.genericReference.type == GraphType.ENUM) {
          String propName = sourceName ?? name;
          String listType = "List<${type.genericReference.reference.symbol}>";
          return new Code("""
            if (map['$propName'] == null) return null;

            $listType items = [];
            for (dynamic aVar in map['$propName']) 
              items.add(_mapNamesFor${type.genericReference.reference.symbol}[aVar.toLowerCase()]);

            return items;
            """);
        } else if (type.genericReference.type == GraphType.SCALAR) {
          String propName = sourceName ?? name;
          String listType = "List<${type.genericReference.reference.symbol}>";
          return new Code("""
            if(map['$propName'] == null || map['$propName'] is $listType) return map['$propName'];

            $listType items = [];
            for (dynamic aVar in map['$propName']) 
              items.add(aVar);

            return map['$propName'] = items;
            """);
        } else {
          throw new ArgumentError(
              "Unknown or not supported graphql type '${type.genericReference.type}' for LIST getter");
        }
        break;
      case GraphType.OTHER:
        Reference r = refer(
            'scalarSerializers', 'package:dart_graphql/dart_graphql.dart');
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
        return new Code('map["$name"] = value');
      case GraphType.LIST:
        if (type.genericReference.type == GraphType.OBJECT ||
            type.genericReference.type == GraphType.SCALAR) {
          return new Code('map["$name"] = value');
        } else if (type.genericReference.type == GraphType.ENUM) {
          return new Code(
              'map["$name"] = value?.map((e) => to${type.genericReference.reference.symbol}String(e))?.toList()');
        } else {
          throw new ArgumentError(
              "Unknown or not supported graphql type '${type.genericReference.type}' for LIST setter");
        }
        break;
      case GraphType.ENUM:
        return Code('map["$name"] = to${type.reference.symbol}String(value)');
      case GraphType.OTHER:
        Reference r = refer(
            'scalarSerializers', 'package:dart_graphql/dart_graphql.dart');
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
