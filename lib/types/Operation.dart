// Copyright (c) 2019, the Black Salt authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of 'generator.dart';

class Operation extends BaseTypes {
  OperationDefinitionContext _context;
  QueryTypes _queryTypes;

  Operation(this._context, GraphqlSchema schema) : super(schema);

  void generate(String path, LibraryBuilder fb) {
    _queryTypes = new QueryTypes(_schema);

    if (_schema.isRegistered(methodName)) return;
    _schema.registerType(methodName);

    Method method = new Method((MethodBuilder b) {
      dynamic returns = generateReturn(fb);
      b
        ..name = methodName
        ..returns = returns[0] as Reference;
      generateParameters(fb, b, path);
      b.body = generateCode(returns[1] as String);
    });
    fb.body.add(method);
  }

  String get methodName => _context.name;

  String get resultClassName => "${upperCaseFirst(methodName)}_OperationResult";

  Code generateCode(String resultClass) {
    Reference graphqlQuery =
        refer("GraphqlQuery", "package:dart_graphql/dart_graphql.dart");
    List<String> variables = _context.variableDefinitions?.variableDefinitions
        ?.map<String>((v) => '"${v.variable.name}": ${v.variable.name}')
        ?.toList();

    String query = wrapStringCode(_context.span.text);

    return new Code.scope((a) {
      if (variables == null) {
        return "const query = $query;"
            "return new ${a(graphqlQuery)}("
            "query, "
            "null, "
            "$resultClass.fromMap);";
      } else {
        return "const query = $query;"
            "return new ${a(graphqlQuery)}("
            "query, "
            "{${variables.join(',')}},"
            "$resultClass.fromMap);";
      }
    });
  }

  String generateResultClass(
      LibraryBuilder b, dynamic schemaObject, String payloadClassName) {
    Class cls =
        new Class((ClassBuilder cb) => generateClass(cb, resultClassName, {
              schemaObject.name as String:
                  new TypedReference(refer(payloadClassName), GraphType.OBJECT)
            }));
    b.body.add(cls);
    return resultClassName;
  }

  List<dynamic> generateReturn(LibraryBuilder b) {
    var sel = _context.selectionSet.selections[0];
    String field = sel.field.fieldName.name;
    dynamic query = this._context.TYPE.text == "mutation"
        ? _schema.findMutation(field)
        : _schema.findQuery(field);

    String payloadClassName = _queryTypes.generateClassForObject(
        b, _schema.findObject(query?.type?.name as String));

    String className = generateResultClass(b, query, payloadClassName);

    return <dynamic>[
      refer(
          "GraphqlQuery<$className>", "package:dart_graphql/dart_graphql.dart"),
      className
    ];
  }

  void generateParameters(LibraryBuilder fb, MethodBuilder b, String path) {
    InputTypes inputTypes = new InputTypes(_schema);

    if (_context.variableDefinitions != null) {
      for (VariableDefinitionContext variable
          in _context.variableDefinitions.variableDefinitions) {
        String name = variable.variable.name;
        String type = variable.type.typeName.name;
        ParameterBuilder parameterBuilder = new ParameterBuilder()
          ..name = name
          ..named = true
          ..type = inputTypes
              .generateInputType(fb, this._schema.findObject(type))
              .reference;
        if (variable.type?.EXCLAMATION?.text == "!") {
          parameterBuilder.annotations
              .add(refer("required", "package:meta/meta.dart"));
        }
        b.optionalParameters.add(parameterBuilder.build());
      }
    }
  }
}
