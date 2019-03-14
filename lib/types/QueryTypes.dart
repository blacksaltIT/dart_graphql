// Copyright (c) 2019, the Black Salt authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of 'generator.dart';

class QueryTypes extends BaseTypes {
  QueryTypes(GraphqlSchema schema) : super(schema);

  TypedReference generateFieldType(LibraryBuilder b, dynamic typeSchema) {
    switch (typeSchema.kind) {
      case "NON_NULL":
        return generateFieldType(b, typeSchema.ofType);
      case "LIST":
        TypedReference genericType = generateFieldType(b, typeSchema.ofType);
        return new TypedReference(
            refer("List<${genericType.reference.symbol}>", "dart:core"),
            GraphType.LIST,
            genericReference: genericType);
      case "UNION":
        String typeName = typeSchema.name;
        var className = generateClassForUnion(b, _schema.findObject(typeName));
        return new TypedReference(refer(className), GraphType.UNION);
      case "OBJECT":
        String typeName = typeSchema.name;
        var className = generateClassForObject(b, _schema.findObject(typeName));
        return new TypedReference(refer(className), GraphType.OBJECT);
      case "ENUM":
        return findScalarType("Enum");
      case "SCALAR":
        return findScalarType(typeSchema.name);
      default:
        return new TypedReference(
            refer("dynamic", "dart:core"), GraphType.OTHER);
    }
  }

  generateClassForObject(LibraryBuilder b, dynamic objectSchema) {
    dynamic className = objectSchema.name;
    if (_schema.isRegistered(className)) return className;
    _schema.registerType(className);

    Class clazz = new Class((ClassBuilder cb) {
      Map<String, TypedReference> fields = {};

      for (var field in objectSchema.fields ?? []) {
        TypedReference returnType = generateFieldType(b, field.type);
        fields[field.name] = returnType;
      }

      generateClass(cb, className, fields);
    });
    b.body.add(clazz);
    return className;
  }

  generateClassForUnion(LibraryBuilder b, dynamic objectSchema) {
    dynamic className = objectSchema.name;
    if (_schema.isRegistered(className)) return className;
    _schema.registerType(className);

    Class clazz = new Class((ClassBuilder cb) {
      // Possible types
      List<TypedReference> possibleTypes = [];

      for (var pTypeRef in objectSchema.possibleTypes ?? []) {
        var ptClassName =
            generateClassForObject(b, _schema.findObject(pTypeRef.name));
        possibleTypes
            .add(new TypedReference(refer(ptClassName), GraphType.OBJECT));
      }

      // Fields
      Map<String, TypedReference> fields = {};
      fields["typename"] = findScalarType("String");

      // Generate class
      generateUnion(cb, className, fields, possibleTypes);
    });

    b.body.add(clazz);
    return className;
  }
}
