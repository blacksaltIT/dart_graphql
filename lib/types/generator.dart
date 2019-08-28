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
  GraphqlSchema _schema;
  GraphqlParser(this._schema);

  Module parse(String query) {
    final parser = new Parser(scan(query));
    final document = parser.parseDocument();
    Iterable<Operation> operations = document.definitions
        .whereType<OperationDefinitionContext>()
        .map<Operation>((c) => new Operation(c, _schema));
    return new Module(operations.toList());
  }
}

class Module {
  List<Operation> _operations;

  Module(this._operations);

  String generate(String path) {
    final library = new Library((LibraryBuilder b) {
      _operations.forEach((o) => o.generate(path, b));
    });
    final emitter = new DartEmitter(new Allocator());
    return new DartFormatter()
        .format('// GENERATED CODE - DO NOT MODIFY BY HAND\n\n'
            '${library.accept(emitter)}');
  }
}
