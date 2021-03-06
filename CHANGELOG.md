# Changelog

## 0.4.2

- Fix timezone information handling in DateTime serialize/deserialize

## 0.4.1

- Support `TimeDelta` scalar serializer (generates `Duration`).
  Input format: [[D day[s], ][H]H:MM:SS[.UUUUUU]](https://docs.python.org/3/library/datetime.html#timedelta-objects), output format is `Duration.toString()`: ([H]H:MM:SS.UUUUUU like '135:05:59.365145').

## 0.4.0

Breaking changes:
- Support for graphql multipart request spec (https://github.com/jaydenseric/graphql-multipart-request-spec) which
  affects how files are sent.
- A few parameters became named instead of positional.

## 0.3.5

- Support lists in query parameters

## 0.3.4

- Fix strict analyzer errors in generated code

## 0.3.3

- Fix noSuchMethod error

## 0.3.2

- Fix cast error during parsing errors
- More analysis rules

## 0.3.1

- Remove dart:html dependency so the package can be used without flutter web

## 0.3.0

- Remove dart:io dependency so the package can be used with flutter web

## 0.2.2

- Happier pub linter

## 0.2.1

- Use strict mode and more linter rules
- Fix an enum encoding issue

## 0.2.0

- Publish dart_graphql pub

## 0.0.1

- Initial version
