import 'dart:async';

import 'package:dart_graphql/dart_graphql.dart';
import 'package:example/gitlab.graphql.dart';

Future<void> main() async {
  GraphqlClient gqlClient = GraphqlClient("https://gitlab.com/api/graphql");
  var gqlResponse = await gqlClient.query(GitlabCEIssueLabels(firstN: 15));

  print("Issue labels:");
  for (IssueEdge issueEdge in gqlResponse.data.project.issues.edges) {
    List<String> labels =
        issueEdge.node.labels.edges.map((e) => e.node.title).toList();

    print(
        "${issueEdge.node.title} [${issueEdge.node.state}]: ${labels.join(', ')}");
  }
}
