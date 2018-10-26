// Copyright (c) 2018, the Black Salt authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:build_config/build_config.dart';
import 'package:build_runner/build_runner.dart';
import '../types/GraphqlSetting.dart';
import './graphql_fetch_generator.dart';
export '../types/GraphqlSetting.dart' show createSetting;

final String schemaUrl = 'https://foo.bar';

List<BuilderApplication> actions = [
  applyToRoot(
      new GraphqlBuilder(createSetting(schemaUrl: schemaUrl)),
      generateFor: const InputSet(include: const ['**/*.graphql'])),
];

main() async {
  await build(actions, deleteFilesByDefault: true);
}