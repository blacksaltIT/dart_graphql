<a href="https://travis-ci.org/blacksaltIT/dart_graphql"><img src="https://travis-ci.org/blacksaltIT/dart_graphql.svg?branch=master"/></a>

# GraphQL Plugin

Support for using graphql in Dart.

This _plugin_ defines a simple framework for generating graphql entities.

The code generation is based on a set of graphql queries but all affected types are generated **using the original type name and all properties**. This behavior allows to use a common type like `PageInfo` everywhere in your code.

## Features

- Generate directly from http endpoint
- Lazy response parsing
- Case insensitive enum handling
- File upload respects https://github.com/jaydenseric/graphql-multipart-request-spec

## Getting started

See [example project](https://github.com/blacksaltIT/dart_graphql/tree/master/example)

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

### File upload

  On your server create a new scalar type called 'Upload' and use the generator.
  The generator will create a `FileUploadInput` everywhere where it sees `Upload`.
  Before the request the library goes into the query variables recursively and
  collect all files and their paths in the tree. You can restore them on your server
  as described in https://github.com/jaydenseric/graphql-multipart-request-spec
  All file fields will have `null` value in the request.
  You can save bandwidth if you use the same `FileUploadInput` instance if you
  want to use the same file.

# Notes

The _plugin_ based on [graphql-fetch][base_graphql] project ported to dart2 and extended.

Please file feature requests and bugs at the [issue tracker][tracker].

[base_graphql]: https://github.com/spacedragon/graphql-fetch
[tracker]: https://github.com/blacksaltIT/dart_graphql/issues
