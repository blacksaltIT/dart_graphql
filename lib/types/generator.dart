// Copyright (c) 2019, the Black Salt authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:graphql_parser/graphql_parser.dart';

import '../dart_graphql.dart';
import 'GraphqlSchema.dart';

part 'BaseTypes.dart';
part 'InputTypes.dart';
part 'Operation.dart';
part 'QueryTypes.dart';

class GraphqlParser {
  final GraphqlSchema _schema;
  GraphqlParser(this._schema);

  Module parse(String query) {
    final parser = Parser(scan(query));
    final document = parser.parseDocument();
    Iterable<Operation> operations = document.definitions
        .whereType<OperationDefinitionContext>()
        .map<Operation>((c) => Operation(c, _schema));
    return Module(operations.toList());
  }
}

class Module {
  final List<Operation> _operations;

  Module(this._operations);

  String generate(String path) {
    final library = Library((b) {
      for (Operation op in _operations) {
        op.generate(path, b);
      }
    });
    final emitter = DartEmitter(Allocator());
    return DartFormatter()
        .format('// GENERATED CODE - DO NOT MODIFY BY HAND\n\n'
            '${library.accept(emitter)}');
  }
}
