// Copyright (c) 2019, the Black Salt authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of 'generator.dart';

class InputTypes extends BaseTypes {
  InputTypes(GraphqlSchema schema) : super(schema);

  TypedReference generateInputType(LibraryBuilder b, dynamic typeSchema) {
    switch (typeSchema.kind) {
      case "NON_NULL":
        return generateInputType(b, typeSchema.ofType);
        break;
      case "LIST":
        TypedReference genericType = generateInputType(b, typeSchema.ofType);
        return new TypedReference(
            refer("List<${genericType.reference.symbol}>", "dart:core"),
            GraphType.LIST,
            genericReference: genericType);
      case "INPUT_OBJECT":
        String typeName = typeSchema.name;
        var className =
            generateInputClassForType(b, _schema.findObject(typeName));
        return new TypedReference(
          refer(className),
          GraphType.OBJECT,
        );
      case "SCALAR":
        return findScalarType(typeSchema.name);
      case "ENUM":
        String typeName = typeSchema.name;
        var className = generateEnumForType(b, _schema.findObject(typeName));
        return new TypedReference(refer(className), GraphType.ENUM);
      default:
        return new TypedReference(
            refer("dynamic", "dart:core"), GraphType.OTHER);
    }
  }

  generateInputClassForType(LibraryBuilder b, dynamic typeSchema) {
    dynamic className = typeSchema.name;
    if (_schema.isRegistered(className)) return className;
    _schema.registerType(className);

    Map<String, TypedReference> fields = {};
    for (var f in typeSchema.inputFields) {
      fields[f.name] = generateInputType(b, f.type);
    }
    Class clazz = new Class((cb) {
      generateClass(cb, className, fields);
      generateConstructor(cb, className, fields);
    });
    b.body.add(clazz);
    return className;
  }

  generateConstructor(
      ClassBuilder cb, String className, Map<String, TypedReference> fields) {
    ConstructorBuilder constructor = new ConstructorBuilder();
    List<String> creatorCode = [];
    for (var name in fields.keys) {
      TypedReference type = fields[name];
      constructor.optionalParameters
          .add(new Parameter((ParameterBuilder pb) => pb
            ..name = name
            ..type = type.reference
            ..named = true));

      if (type.type == GraphType.OTHER)
        creatorCode.add(
            '"$name" : scalarSerializers["${type.scalaTypeName}"].serialize($name)');
      else
        creatorCode.add('"$name" : $name');
    }
    constructor..initializers.add(new Code('''super.fromMap({
       ${creatorCode.join(",\n")}
        })'''));
    cb.constructors.add(constructor.build());
  }

  generateEnumForType(LibraryBuilder b, dynamic typeSchema) {
    String className = typeSchema.name;
    if (_schema.isRegistered(className)) return className;
    _schema.registerType(className);

    b.body.add(new Class((ClassBuilder b) => b
      ..name = className
      ..extend = refer("EnumValue")
      ..fields.addAll(typeSchema.enumValues
          .map<Field>((e) => new Field((FieldBuilder fb) => fb
            ..name = e.name
            ..type = refer(className)
            ..static = true
            ..modifier = FieldModifier.final$
            ..assignment = new Code('new $className._("${e.name}")'))))
      ..constructors.add(new Constructor((ConstructorBuilder cb) => cb
        ..initializers.add(new Code('super(value: value)'))
        ..name = "_"
        ..requiredParameters.add(new Parameter((ParameterBuilder pb) => pb
          ..name = "value"
          ..type = refer("String")))))
      ..fields.add(new Field((FieldBuilder fb) => fb
        ..name = "values"
        ..static = true
        ..assignment = new Code("{" +
            typeSchema.enumValues
                .map<String>((e) => '"${e.name}": ${e.name}')
                .join(",\n") +
            "}")
        ..type = refer("Map<String, $className>")))));

    return className;
  }
}
