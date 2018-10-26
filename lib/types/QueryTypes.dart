// Copyright (c) 2018, the Black Salt authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of 'generator.dart';

class QueryTypes extends BaseTypes {
  String _prefix;
  String _path;
  List<Reference> depFragments = [];

  QueryTypes(GraphqlSchema schema, this._prefix, this._path) : super(schema);

  TypedReference generateFieldType(
      LibraryBuilder b, SelectionContext context, dynamic typeSchema) {
    switch (typeSchema.kind) {
      case "NON_NULL":
        return generateFieldType(b, context, typeSchema.ofType);
      case "LIST":
        TypedReference genericType =
            generateFieldType(b, context, typeSchema.ofType);
        return new TypedReference(
            refer("List<${genericType.reference.symbol}>", "dart:core"),
            GraphType.LIST,
            genericReference: genericType);
      case "OBJECT":
        String typeName = typeSchema.name;
        var className =
            generateClassForType(b, context, _schema.findObject(typeName));
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

  generateClassForType(
      LibraryBuilder b, SelectionContext context, dynamic objectSchema) {
    dynamic className = "${upperCaseFirst(_prefix)}${objectSchema.name}";
    Class clazz = new Class((ClassBuilder cb) {
      Map<String, TypedReference> fields = {};
      context.field.selectionSet.selections.forEach((sel) {
        if (sel.field != null) {
          dynamic fieldName = sel.field.fieldName.name;
          dynamic fieldObject =
              objectSchema.fields.firstWhere((f) => f.name == fieldName);
          TypedReference returnType =
              generateFieldType(b, sel, fieldObject.type);
          fields[fieldName] = returnType;
        } else if (sel.fragmentSpread != null) {
          String name = sel.fragmentSpread.name;
          TypedReference frag = findFragment(name, _path);
          if (frag != null) {
            depFragments.add(frag.reference);
            cb.mixins.add(frag.reference);
          }
        }
      });
      generateClass(cb, className, fields);
    });
    b.body.add(clazz);
    return className;
  }
}
