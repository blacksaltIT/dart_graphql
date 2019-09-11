# example

### build.yaml
Add `build.yaml` to your project:
```yaml
targets:
  $default:
    builders:
      example|graphql_builder:
        generate_for:
          - "**/*.graphql"
        options:
          gqlEndpoint: "https://gitlab.com/api/graphql"

builders:
  graphql_builder:
    import: "package:dart_graphql/generator/graphql_fetch_generator.dart"
    builder_factories: ["getGqlBuilder"]
    build_extensions:
      .graphql:
        - .graphql.dart
    auto_apply: dependents
    build_to: source
    applies_builders: ["source_gen"]

```

### gitlab.graphql

Create a graphql file:
```graphql
query GitlabCEIssueLabels($firstN: Int) {
  project(fullPath: "gitlab-org/gitlab-ce") {
    id
    issues(first: $firstN) {
      edges {
        node {
          title
          state
          labels {
            edges {
              node {
                title
              }
            }
          }
        }
      }
    }
  }
}
```

### Build

Run `pub run build_runner build --verbose --delete-conflicting-outputs`

### Use

```dart
import 'package:dart_graphql/dart_graphql.dart';
import 'package:example/gitlab.graphql.dart';

void main() async {
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
```