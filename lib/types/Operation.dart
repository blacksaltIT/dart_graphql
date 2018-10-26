// Copyright (c) 2018, the Black Salt authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of 'generator.dart';

class Operation extends BaseTypes {
  OperationDefinitionContext _context;
  QueryTypes _queryTypes;

  Operation(this._context, GraphqlSchema schema) : super(schema);

  void generate(String path, LibraryBuilder fb) {
    _queryTypes = new QueryTypes(_schema, methodName, path);

    Method method = new Method((MethodBuilder b) {
      dynamic returns = generateReturn(fb);
      b
        ..name = methodName
        ..returns = returns[0];
      generateParameters(fb, b, path);
      b.body = generateCode(returns[1]);
    });
    fb.body.add(method);
  }

  String get methodName => _context.name;

  String get resultClassName => "${upperCaseFirst(methodName)}Result";

  generateCode(String resultClass) {
    Reference graphqlQuery = refer("GraphqlQuery", "../graphql/fetch.dart");
    List<String> variables = _context.variableDefinitions?.variableDefinitions
        ?.map<String>((v) => '"${v.variable.name}": ${v.variable.name}')
        ?.toList();

    String query = wrapStringCode(_context.span.text);

    List<String> strings = _queryTypes.depFragments
        .map<String>((r) => "${r.symbol}.fragmentString")
        .toList(growable: true);
    strings.insert(0, "query");
    return new Code.scope((a) {
      if (variables == null) {
        return "const query = $query;"
            "return new ${a(graphqlQuery)}("
            "${strings.join(" + ")}, "
            "null, "
            "$resultClass.fromMap);";
      } else {
        return "const query = $query;"
            "return new ${a(graphqlQuery)}("
            "${strings.join(" + ")}, "
            "{${variables.join(',')}},"
            "$resultClass.fromMap);";
      }
    });
  }

  generateResultClass(
      LibraryBuilder b, SelectionContext context, dynamic schemaObject) {
    dynamic cls = new Class((ClassBuilder cb) => generateClass(
            cb, resultClassName, {
          schemaObject.name:
              _queryTypes.generateFieldType(b, context, schemaObject.type)
        }));
    b.body.add(cls);
    return resultClassName;
  }

  generateReturn(LibraryBuilder b) {
    for (SelectionContext sel in _context.selectionSet.selections) {
      String field = sel.field.fieldName.name;
      dynamic query = this._context.TYPE.text == "mutation"
          ? _schema.findMutation(field)
          : _schema.findQuery(field);
      dynamic className = generateResultClass(b, sel, query);
      return [
        refer("GraphqlQuery<$className>", "../graphql/fetch.dart"),
        className
      ];
    }
  }

  void generateParameters(LibraryBuilder fb, MethodBuilder b, String path) {
    InputTypes inputTypes = new InputTypes(_schema, path);

    if (_context.variableDefinitions != null) {
      for (VariableDefinitionContext variable
          in _context.variableDefinitions.variableDefinitions) {
        String name = variable.variable.name;
        String type = variable.type.typeName.name;
        dynamic parameterBuilder = new ParameterBuilder()
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
