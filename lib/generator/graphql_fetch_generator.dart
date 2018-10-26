// Copyright (c) 2018, the Black Salt authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library graphql_client_generator;

import 'dart:async';

import 'package:build/build.dart';
import 'package:glob/glob.dart';
import 'package:logging/logging.dart';

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
  GraphqlBuildSetting _setting;
  final Logger log = new Logger('GraphqlSetting');

  Resource<GraphqlSchema> _schemaResource;

  GraphqlBuilder(this._setting) {
    this._schemaResource =
        new Resource(() => new GraphqlSchema(_setting.getSchema()));
  }

  @override
  Map<String, List<String>> buildExtensions = const {
    '.graphql': const ['.graphql.dart']
  };

  @override
  Future build(BuildStep buildStep) async {
    GraphqlSchema schema = await buildStep.fetchResource(_schemaResource);
    await schema.awaitForSchema();
    var parser = new GraphqlParser(schema);
    if (!schema.fragmentsRegistered) {
      await for (AssetId aid in buildStep.findAssets(new Glob("**.graphql"))) {
        String content = await buildStep.readAsString(aid);
        parser.registerFragment(content, aid.addExtension(".dart").path);
      }
    }
    log.info("handling ${buildStep.inputId.path}");
    AssetId output = buildStep.inputId.addExtension('.dart');
    String query = await buildStep.readAsString(buildStep.inputId);
    Module module = parser.parse(query);
    String code = module.generate(output.path);
    buildStep.writeAsString(output, code);
    return new Future.value();
  }
}