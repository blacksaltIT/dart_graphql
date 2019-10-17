library graphql_fetch.client;

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'query.dart';

class RestClient extends http.BaseClient {
  final http.Client _client = http.Client();
  final String _endpoint;
  String language;
  Uri _baseUri;

  RestClient(this._endpoint, {this.language}) {
    _baseUri = Uri.parse(_endpoint);
  }

  void configureRequest(http.BaseRequest request) {}

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    configureRequest(request);
    return _client.send(request);
  }

  String toJson(Map<String, dynamic> data) =>
      json.encode(data, toEncodable: toEncodable);

  dynamic toEncodable(dynamic d) {
    for (ScalarSerializer<dynamic> c in scalarSerializers.values) {
      if (c.isType(d)) {
        return c.serialize(d);
      }
    }
    if (d is MapObject) {
      return d.toJson();
    }
    return d;
  }

  Future<JsonResponse> postJson(String path, Map<String, dynamic> data,
      [Map<String, String> headers, Iterable<http.MultipartFile> files]) async {
    String body = toJson(data);
    Uri uri = _baseUri.replace(path: _baseUri.path + path);
    Map<String, String> _headers = <String, String>{
      'Content-Type': 'application/json'
    };

    if (headers != null) _headers.addAll(headers);

    http.Response response;
    if (files != null && files.isNotEmpty) {
      http.MultipartRequest request = http.MultipartRequest("POST", uri);

      request.fields['query'] = data['query'] as String;
      request.fields['variables'] =
          toJson(data['variables'] as Map<String, dynamic>);
      request.headers['Authorization'] = headers['Authorization'];
      request.files.addAll(files);

      try {
        response = await http.Response.fromStream(await send(request));
      } on Exception catch (e) {
        response = http.Response('{"error": "${e.toString()}"', 500);
      }
    } else {
      response = await post(uri.toString(), body: body, headers: _headers);
    }

    return handleJsonResponse(response);
  }

  JsonResponse handleJsonResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 400) {
      String bodyString = utf8.decode(response.bodyBytes);
      return JsonResponse(bodyString);
    } else {
      throw http.ClientException(
          "network error:${response.statusCode}\n${response.body}");
    }
  }

  Future<JsonResponse> putJson(String path, Map<String, dynamic> data,
      [Map<String, String> headers]) async {
    String body = toJson(data);
    Uri uri = _baseUri.replace(path: _baseUri.path + path);

    Map<String, String> _headers = <String, String>{
      'Content-Type': 'application/json'
    };
    if (headers != null) _headers.addAll(headers);

    http.Response response =
        await put(uri.toString(), body: body, headers: _headers);
    return handleJsonResponse(response);
  }

  Future<JsonResponse> getJson(String path, Map<String, dynamic> queries,
      [Map<String, String> headers]) async {
    Uri uri = _baseUri.replace(
        path: _baseUri.path + path, queryParameters: toQueries(queries));

    Map<String, String> _headers = <String, String>{
      'Content-Type': 'application/json'
    };
    if (headers != null) _headers.addAll(headers);

    http.Response response = await get(uri.toString(), headers: _headers);
    return handleJsonResponse(response);
  }

  @override
  void close() {
    _client.close();
  }

  Map<String, dynamic> toQueries(Map<String, dynamic> queries) =>
      Map<String, dynamic>.fromIterables(queries.keys,
          queries.values.map<String>((dynamic v) => v.toString()));
}

class GraphqlClient extends RestClient {
  GraphqlClient(String endpoint, {String language})
      : super(endpoint, language: language);

  Future<JsonResponse> request(String query, Map<String, dynamic> variables,
      [Map<String, String> headers, Iterable<http.MultipartFile> files]) async {
    JsonResponse result = await postJson(
        "",
        <String, dynamic>{"query": query, "variables": variables},
        headers,
        files);
    return result;
  }

  Future<GraphqlResponse<T>> query<T>(GraphqlQuery<T> query,
      [Map<String, String> headers, Iterable<http.MultipartFile> files]) async {
    headers ??= <String, String>{};
    if (language != null) headers['Accept-Language'] = language;

    JsonResponse result =
        await request(query.query, query.variables, headers, files);
    return result.decode((body) {
      Map<String, dynamic> map = json.decode(body) as Map<String, dynamic>;
      return GraphqlResponse<T>(query.constructorOfData, map);
    });
  }
}

Future<void> main() async {
  String query = """
    query(\$alias: String) {
      allShows(filter: {
        aliases_some: {
          alias : \$alias
        }
      }){
        id
        title
        aliases {
          id
        }
      }
    }""";
  GraphqlClient cli = GraphqlClient(
      "http://localhost:60000/simple/v1/cj9mldxkd008c017544mu2vhw");
  var result = await cli.request(query, <String, dynamic>{"alias": "atest"});
  print(result);
}
