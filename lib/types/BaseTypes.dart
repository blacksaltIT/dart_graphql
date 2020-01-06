// Copyright (c) 2019, the Black Salt authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of 'generator.dart';

class BaseTypes {
  final GraphqlSchema _schema;

  BaseTypes(this._schema);

  TypedReference findScalarType(String graphqlType) {
    switch (graphqlType) {
      case "Int":
        return TypedReference(refer("int", "dart:core"), GraphType.scalar);
      case "ID":
        return TypedReference(refer("String", "dart:core"), GraphType.scalar);
      case "String":
      case "UUID":
        return TypedReference(refer("String", "dart:core"), GraphType.scalar);
      case "Float":
        return TypedReference(refer("double", "dart:core"), GraphType.scalar);
      case "Boolean":
        return TypedReference(refer("bool", "dart:core"), GraphType.scalar);
      case "Enum":
        return TypedReference(refer("String", "dart:core"), GraphType.scalar);
      default:
        var serializer = scalarSerializers[graphqlType];
        if (serializer != null) {
          return TypedReference(
              refer(serializer.dartName, serializer.dartPackage),
              GraphType.other,
              scalaTypeName: graphqlType);
        }
        return TypedReference(refer("dynamic", "dart:core"), GraphType.scalar);
    }
  }

  final Reference baseClass =
      refer("MapObject", "package:dart_graphql/dart_graphql.dart");

  String upperCaseFirst(String s) => s[0].toUpperCase() + s.substring(1);
  String lowerCaseFirst(String s) => s[0].toLowerCase() + s.substring(1);
  String wrapStringCode(String code) =>
      '"""${code.replaceAll("\$", "\\\$")}"""';

  String generateEnumForType(LibraryBuilder b, dynamic typeSchema) {
    String className = typeSchema.name as String;
    if (_schema.isRegistered(className)) return className;
    _schema.registerType(className);

    b.body.add(Code(
        'enum $className { ${typeSchema.enumValues.map((dynamic e) => e.name).join(',')} }\n'));
    List<dynamic> mapBody = typeSchema.enumValues
        .map((dynamic e) => '"${e.name.toLowerCase()}": $className.${e.name}')
        .toList() as List<dynamic>;
    b.body.add(Code('''
        Map<String, $className> _mapNamesFor$className = { ${mapBody.join(",")} };
        $className parse$className(String value) => value != null && value != "" ? _mapNamesFor$className[value.toLowerCase()] : null;
        String to${className}String($className value) => value?.toString()?.split(".")?.last;
        '''));

    return className;
  }

  void generateClass(
      ClassBuilder cb, String className, Map<String, TypedReference> fields) {
    cb
      ..name = className
      ..extend = baseClass;

    for (var name in fields.keys) {
      TypedReference type = fields[name];

      cb.methods.add(generateGetter(name, type));
      cb.methods.add(generateSetter(name, type));
    }

    generateFromMapConstructor(cb, className);
    generateClone(cb, className);
  }

  void generateUnion(ClassBuilder cb, String className,
      Map<String, TypedReference> fields, List<TypedReference> possibleTypes) {
    cb
      ..name = className
      ..extend = baseClass;

    if (fields.containsKey("typename")) {
      var propName = "typename";
      var sourceName = "__typename";
      var type = fields["typename"];

      cb.methods.add(generateGetter(propName, type, sourceName: sourceName));
    }

    for (var pType in possibleTypes) {
      var propName = lowerCaseFirst(pType.reference.symbol);
      cb.fields.add(generateField(propName, pType));

      MethodBuilder factoryMethodBuilder = MethodBuilder()
        ..name = propName
        ..returns = pType.reference
        ..type = MethodType.getter
        ..lambda = true
        ..body = Code('_$propName ??= ${pType.reference.symbol}.fromMap(map)');

      cb.methods.add(factoryMethodBuilder.build());
    }

    generateFromMapConstructor(cb, className);
    generateClone(cb, className);
  }

  void generateFromMapConstructor(ClassBuilder cb, String className) {
    Reference jsonEncodeRef = refer("jsonEncode", 'dart:convert');
    Reference jsonDecodeRef = refer("jsonDecode", 'dart:convert');

    cb.methods.add(Method((b) => b
      ..name = "fromMap"
      ..static = true
      ..returns = refer(className)
      ..requiredParameters.add((ParameterBuilder()
            ..name = "map"
            ..type = refer("Map<String, dynamic>"))
          .build())
      ..optionalParameters.add((ParameterBuilder()
            ..name = "deepCopy"
            ..type = refer("bool", "dart:core")
            ..defaultTo = const Code('false'))
          .build())
      ..body = Code.scope((a) => '''
      if (map == null) return null;
      if (deepCopy)
        map = ${a(jsonDecodeRef)}(${a(jsonEncodeRef)}(map)) as Map<String, dynamic>;
      return $className()
        ..map = map;
      ''')));
  }

  void generateClone(ClassBuilder cb, String className) {
    cb.methods.add(Method((b) => b
      ..name = "clone"
      ..returns = refer(className)
      ..lambda = true
      ..body =
          Code('$className.fromMap(toJson() as Map<String, dynamic>, true)')));
  }

  Field generateField(String name, TypedReference type) {
    FieldBuilder field = FieldBuilder()
      ..type = type.reference
      ..name = "_$name";
    return field.build();
  }

  Method generateGetter(String name, TypedReference type, {String sourceName}) {
    MethodBuilder getter = MethodBuilder();
    getter
      ..name = name
      ..returns = type.reference
      ..type = MethodType.getter
      ..body = getterCode(getter, name, type, sourceName: sourceName);
    return getter.build();
  }

  Code getterCode(MethodBuilder getter, String name, TypedReference type,
      {String sourceName}) {
    getter.lambda = false;
    switch (type.type) {
      case GraphType.object:
      case GraphType.union:
        String propName = sourceName ?? name;
        return Code("""
            if(map['$propName'] is ${type.reference.symbol}) return map['$propName'] as ${type.reference.symbol};
            return map['$propName'] = ${type.reference.symbol}.fromMap(map['$propName'] as Map<String, dynamic>);
            """);
      case GraphType.enumeration:
        getter.lambda = true;
        return Code('parse${type.reference.symbol}(map["$name"] as String)');
      case GraphType.list:
        if (type.genericReference.type == GraphType.object ||
            type.genericReference.type == GraphType.union) {
          String propName = sourceName ?? name;
          String listType = "List<${type.genericReference.reference.symbol}>";
          return Code("""
            if(map['$propName'] == null || map['$propName'] is $listType) return map['$propName'] as $listType;

            $listType items = [];
            for (dynamic aVar in map['$propName']) 
              items.add(${type.genericReference.reference.symbol}.fromMap(aVar as Map<String, dynamic>));

            return map['$propName'] = items;
            """);
        } else if (type.genericReference.type == GraphType.enumeration) {
          String propName = sourceName ?? name;
          String listType = "List<${type.genericReference.reference.symbol}>";
          return Code("""
            if (map['$propName'] == null) return null;

            $listType items = [];
            for (dynamic aVar in map['$propName']) 
              items.add(_mapNamesFor${type.genericReference.reference.symbol}[aVar.toLowerCase()]);

            return items;
            """);
        } else if (type.genericReference.type == GraphType.scalar) {
          String propName = sourceName ?? name;
          String listType = "List<${type.genericReference.reference.symbol}>";
          return Code("""
            if(map['$propName'] == null || map['$propName'] is $listType) return map['$propName'] as $listType;

            $listType items = [];
            for (dynamic aVar in map['$propName']) 
              items.add(aVar as ${type.genericReference.reference.symbol});

            return map['$propName'] = items;
            """);
        } else {
          throw ArgumentError(
              "Unknown or not supported graphql type '${type.genericReference.type}' for LIST getter");
        }
        break;
      case GraphType.other:
        Reference r = refer(
            'scalarSerializers', 'package:dart_graphql/dart_graphql.dart');
        return Code.scope((a) =>
            'return ${a(r)}["${type.scalaTypeName}"].deserialize(map["${sourceName ?? name}"]) as ${type.reference.symbol};');
      default:
        getter.lambda = true;
        return Code('map["${sourceName ?? name}"] as ${type.reference.symbol}');
    }
  }

  Method generateSetter(String name, TypedReference type) {
    MethodBuilder getter = MethodBuilder()
      ..name = name
      ..requiredParameters.add((ParameterBuilder()
            ..name = "value"
            ..type = type.reference)
          .build())
      ..lambda = true
      ..type = MethodType.setter
      ..body = setterCode(name, type);
    return getter.build();
  }

  Code setterCode(String name, TypedReference type) {
    switch (type.type) {
      case GraphType.object:
        return Code('map["$name"] = value');
      case GraphType.list:
        if (type.genericReference.type == GraphType.object ||
            type.genericReference.type == GraphType.scalar) {
          return Code('map["$name"] = value');
        } else if (type.genericReference.type == GraphType.enumeration) {
          return Code(
              'map["$name"] = value?.map(to${type.genericReference.reference.symbol}String)?.toList()');
        } else {
          throw ArgumentError(
              "Unknown or not supported graphql type '${type.genericReference.type}' for LIST setter");
        }
        break;
      case GraphType.enumeration:
        return Code('map["$name"] = to${type.reference.symbol}String(value)');
      case GraphType.other:
        Reference r = refer(
            'scalarSerializers', 'package:dart_graphql/dart_graphql.dart');
        return Code.scope((a) =>
            'map["$name"] = ${a(r)}["${type.scalaTypeName}"].serialize(value)');
      default:
        return Code('map["$name"] = value');
    }
  }
}

enum GraphType { list, object, union, enumeration, scalar, other }

class TypedReference {
  Reference reference;
  GraphType type;
  TypedReference genericReference;
  String scalaTypeName;
  TypedReference(this.reference, this.type,
      {this.genericReference, this.scalaTypeName});

  String file;
}
