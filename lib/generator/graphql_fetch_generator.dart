// Copyright (c) 2019, the Black Salt authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library graphql_client_generator;

import 'dart:async';

import 'package:build/build.dart';

import '../types/GraphqlSchema.dart';
import '../types/GraphqlSetting.dart';
import '../types/generator.dart';

Builder getGqlBuilder(BuilderOptions options) {
  // Paranoid copy of options.config - don't assume it's mutable or needed
  // elsewhere.
  var optionsMap = Map<String, dynamic>.from(options.config);

  var builder = GraphqlBuilder(createSetting(
      schemaUrl: optionsMap.remove('gqlEndpoint') as String)); // no options yet

  if (optionsMap.isNotEmpty) {
    if (log == null) {
      throw StateError('Upgrade `build_runner` to at least 0.8.2.');
    } else {
      log.warning('These options were ignored: `$optionsMap`.');
    }
  }

  return builder;
}

class GraphqlBuilder extends Builder {
  final GraphqlBuildSetting _setting;
  Resource<GraphqlSchema> _schemaResource;

  GraphqlBuilder(this._setting) {
    _schemaResource = Resource(() => GraphqlSchema(_setting.getSchema()));
  }

  @override
  Map<String, List<String>> buildExtensions = const {
    '.graphql': ['.graphql.dart']
  };

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    GraphqlSchema schema = await buildStep.fetchResource(_schemaResource);
    await schema.awaitForSchema();
    var parser = GraphqlParser(schema);
    log.info("handling ${buildStep.inputId.path}");
    AssetId output = buildStep.inputId.addExtension('.dart');
    String query = await buildStep.readAsString(buildStep.inputId);
    Module module = parser.parse(query);
    String code = module.generate(output.path);
    return buildStep.writeAsString(output, code);
  }
}
