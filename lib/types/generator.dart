// Copyright (c) 2018, the Black Salt authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:graphql_parser/graphql_parser.dart';
import 'package:path/path.dart' as p;

import '../fetch.dart';
import 'GraphqlSchema.dart';

part 'BaseTypes.dart';
part 'Fragment.dart';
part 'InputTypes.dart';
part 'Operation.dart';
part 'QueryTypes.dart';

class GraphqlParser {
  GraphqlSchema _schema;
  GraphqlParser(this._schema);

  Module parse(String query) {
    final parser = new Parser(scan(query));
    final document = parser.parseDocument();
    Iterable<Fragment> fragments = document.definitions
        .whereType<FragmentDefinitionContext>()
        .map<Fragment>((c) => new Fragment(c, _schema));
    Iterable<Operation> operations = document.definitions
        .whereType<OperationDefinitionContext>()
        .map<Operation>((c) => new Operation(c, _schema));
    return new Module(operations.toList(), fragments.toList());
  }

  registerFragment(String content, String file) {
    final parser = new Parser(scan(content));
    final document = parser.parseDocument();
    Iterable<Fragment> fragments = document.definitions
        .whereType<FragmentDefinitionContext>()
        .map<Fragment>((c) => new Fragment(c, _schema));
    fragments.forEach((f) => f.registerFragment(file));
  }
}

class Module {
  List<Operation> _operations;
  List<Fragment> _fragments;

  Module(this._operations, this._fragments);

  String generate(String path) {
    final library = new Library((LibraryBuilder b) {
      _fragments.forEach((f) => f.generate(path, b));
      _operations.forEach((o) => o.generate(path, b));
    });
    final emitter = new DartEmitter(new Allocator());
    return new DartFormatter()
        .format('// GENERATED CODE - DO NOT MODIFY BY HAND\n\n'
            '${library.accept(emitter)}');
  }
}
