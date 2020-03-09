import 'dart:async';
import 'dart:io';

import 'package:dart_graphql/types/generator.dart';
import 'package:dart_graphql/types/GraphqlSetting.dart';
import 'package:dart_graphql/types/GraphqlSchema.dart';

Future<void> main() async {
  GraphqlBuildSetting buildSetting =
      createSetting(schemaUrl: 'https://gitlab.com/api/graphql');
  GraphqlSchema schema = GraphqlSchema(buildSetting.getSchema());
  await schema.awaitForSchema();
  GraphqlParser parser = GraphqlParser(schema);

  File input = File('example/lib/gitlab.graphql');
  File output = File('example/lib/gitlab.graphql.dart');
  Module module = parser.parse(await input.readAsString());

  String code = module.generate(output.path);
  return output.writeAsString(code);
}
