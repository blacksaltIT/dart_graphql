// Copyright (c) 2019, the Black Salt authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

class GraphqlSchema {
  final Future _schemaFuture;

  dynamic _schema;
  final List<String> _generatedTypes = [];

  GraphqlSchema(this._schemaFuture);

  Future awaitForSchema() async => _schema ??= await _schemaFuture;

  dynamic findQuery(String queryName) {
    String queryTypeName = _schema.queryType.name as String;
    dynamic queryObject =
        _schema.types.firstWhere((dynamic d) => d.name == queryTypeName);
    return queryObject.fields
        .firstWhere((dynamic d) => d.name == queryName, orElse: () => null);
  }

  dynamic findObject(String typeName) => _schema.types
      .firstWhere((dynamic d) => d.name == typeName, orElse: () => null);

  dynamic findMutation(String mutationName) {
    String mutationTypeName = _schema.mutationType.name as String;
    dynamic queryObject =
        _schema.types.firstWhere((dynamic d) => d.name == mutationTypeName);
    return queryObject.fields
        .firstWhere((dynamic d) => d.name == mutationName, orElse: () => null);
  }

  void registerType(String className) => _generatedTypes.add(className);
  bool isRegistered(String className) => _generatedTypes.contains(className);
}
