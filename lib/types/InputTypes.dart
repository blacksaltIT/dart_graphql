// Copyright (c) 2019, the Black Salt authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of 'generator.dart';

class InputTypes extends BaseTypes {
  InputTypes(GraphqlSchema schema) : super(schema);

  TypedReference generateInputType(LibraryBuilder b, dynamic typeSchema) {
    switch (typeSchema.kind as String) {
      case "NON_NULL":
        return generateInputType(b, typeSchema.ofType);
        break;
      case "LIST":
        TypedReference genericType = generateInputType(b, typeSchema.ofType);
        return TypedReference(
            refer("List<${genericType.reference.symbol}>", "dart:core"),
            GraphType.list,
            genericReference: genericType);
      case "INPUT_OBJECT":
        String typeName = typeSchema.name as String;
        var className =
            generateInputClassForType(b, _schema.findObject(typeName));
        return TypedReference(
          refer(className),
          GraphType.object,
        );
      case "SCALAR":
        return findScalarType(typeSchema.name as String);
      case "ENUM":
        String typeName = typeSchema.name as String;
        var className = generateEnumForType(b, _schema.findObject(typeName));
        return TypedReference(refer(className), GraphType.enumeration);

      default:
        return TypedReference(refer("dynamic", "dart:core"), GraphType.other);
    }
  }

  String generateInputClassForType(LibraryBuilder b, dynamic typeSchema) {
    String className = typeSchema.name as String;
    if (_schema.isRegistered(className)) return className;
    _schema.registerType(className);

    Map<String, TypedReference> fields = {};
    for (var f in typeSchema.inputFields) {
      fields[f.name as String] = generateInputType(b, f.type);
    }
    Class clazz = Class((cb) {
      generateClass(cb, className, fields);
      generateConstructor(cb, className, fields);
    });
    b.body.add(clazz);
    return className;
  }

  void generateConstructor(
      ClassBuilder cb, String className, Map<String, TypedReference> fields) {
    ConstructorBuilder constructor = ConstructorBuilder();
    List<String> creatorCode = [];
    for (var name in fields.keys) {
      TypedReference type = fields[name];
      constructor.optionalParameters.add(
        Parameter(
          (pb) => pb
            ..name = name
            ..type = type.reference
            ..named = true,
        ),
      );

      if (type.type == GraphType.other) {
        creatorCode.add(
            '"$name" : scalarSerializers["${type.scalaTypeName}"].serialize($name)');
      } else if (type.type == GraphType.enumeration) {
        creatorCode.add('"$name" : to${type.reference.symbol}String($name)');
      } else if (type.type == GraphType.list &&
          type.genericReference.type == GraphType.enumeration) {
        creatorCode.add(
            '"$name" : $name?.map(to${type.genericReference.reference.symbol}String)?.toList()');
      } else {
        creatorCode.add('"$name" : $name');
      }
    }
    constructor.initializers.add(Code('''super.fromMap(<String, dynamic>{
       ${creatorCode.join(",\n")}
        })'''));
    cb.constructors.add(constructor.build());
  }
}
