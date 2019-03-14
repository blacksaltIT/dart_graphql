// Copyright (c) 2019, the Black Salt authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

class GraphqlSchema {
  Future _schemaFuture;

  dynamic _schema;
  List<String> _generatedTypes = [];

  GraphqlSchema(this._schemaFuture);

  Future awaitForSchema() async {
    if (this._schema == null) {
      this._schema = await _schemaFuture;
    }
    return this._schema;
  }

  findQuery(String queryName) {
    String queryTypeName = _schema.queryType.name;
    dynamic queryObject =
        _schema.types.firstWhere((d) => d.name == queryTypeName);
    return queryObject.fields
        .firstWhere((d) => d.name == queryName, orElse: () => null);
  }

  findObject(String typeName) {
    return _schema.types
        .firstWhere((d) => d.name == typeName, orElse: () => null);
  }

  findMutation(String mutationName) {
    String mutationTypeName = _schema.mutationType.name;
    dynamic queryObject =
        _schema.types.firstWhere((d) => d.name == mutationTypeName);
    return queryObject.fields
        .firstWhere((d) => d.name == mutationName, orElse: () => null);
  }

  registerType(String className) {
    _generatedTypes.add(className);
  }

  isRegistered(String className) {
    return _generatedTypes.contains(className);
  }
}
