// Copyright (c) 2019, the Black Salt authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library graphql_fetch.client;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';

part 'query.dart';

class RestClient extends http.BaseClient {
  http.Client _client;
  String _endpoint;
  String language;
  Uri _baseUri;

  RestClient(this._endpoint, {this.language}) {
    this._client = new http.Client();
    this._baseUri = Uri.parse(this._endpoint);
  }

  void configureRequest(BaseRequest request) {}

  Future<StreamedResponse> send(BaseRequest request) {
    configureRequest(request);
    return _client.send(request);
  }

  String toJson(Map<String, dynamic> data) {
    return json.encode(data, toEncodable: toEncodable);
  }

  toEncodable(d) {
    for (ScalarSerializer c in scalarSerializers.values) {
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
      [Map<String, String> headers, List<String> files]) async {
    String body = toJson(data);
    Uri uri = _baseUri.replace(path: _baseUri.path + path);

    Map<String, String> _headers = {'Content-Type': 'application/json'};

    if (headers != null) _headers.addAll(headers);

    http.Response response = null;
    if (files != null && files.length > 0) {
      //response =
      var request = new http.MultipartRequest("POST", uri);

      request.fields['query'] = data['query'];
      request.fields['variables'] = toJson(data['variables']);
      request.headers['Authorization'] = headers['Authorization'];

      for (var i = 0; i < files.length; i++) {
        File imageFile = new File(files[i]);

        var stream =
            new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
        var length = await imageFile.length();

        http.MultipartFile mfile = new http.MultipartFile(
            'file$i', stream, length,
            filename: basename(files[i]));

        request.files.add(mfile);
      }

      try {
        response = await Response.fromStream(await this.send(request));
      } catch (e) {
        response = new Response('{"error": "${e.toString()}"', 500);
      }
    } else
      response = await this.post(uri.toString(), body: body, headers: _headers);

    return handleJsonResponse(response);
  }

  JsonResponse handleJsonResponse(http.Response response) {
    if (response.statusCode >= HttpStatus.ok &&
        response.statusCode < HttpStatus.badRequest) {
      String bodyString = utf8.decode(response.bodyBytes);
      return new JsonResponse(bodyString);
    } else {
      throw new http.ClientException(
          "network error:${response.statusCode}\n" + response.body);
    }
  }

  Future<JsonResponse> putJson(String path, Map<String, dynamic> data,
      [Map<String, String> headers]) async {
    var body = toJson(data);
    Uri uri = _baseUri.replace(path: _baseUri.path + path);

    Map<String, String> _headers = {'Content-Type': 'application/json'};
    if (headers != null) _headers..addAll(headers);

    http.Response response =
        await this.put(uri.toString(), body: body, headers: _headers);
    return handleJsonResponse(response);
  }

  Future<dynamic> getJson(String path, Map<String, dynamic> queries,
      [Map<String, String> headers]) async {
    Uri uri = _baseUri.replace(
        path: _baseUri.path + path, queryParameters: toQueries(queries));

    Map<String, String> _headers = {'Content-Type': 'application/json'};
    if (headers != null) _headers..addAll(headers);

    http.Response response = await this.get(uri.toString(), headers: _headers);
    return handleJsonResponse(response);
  }

  void close() {
    _client.close();
  }

  toQueries(Map<String, dynamic> queries) {
    return new Map.fromIterables(
        queries.keys, queries.values.map((v) => v.toString()));
  }
}

class GraphqlClient extends RestClient {
  GraphqlClient(String endpoint, {String language})
      : super(endpoint, language: language);

  Future<JsonResponse> request<T>(String query, Map<String, dynamic> variables,
      [Map<String, String> headers, List<String> files]) async {
    var result = await postJson(
        "", {"query": query, "variables": variables}, headers, files);
    return result;
  }

  Future<GraphqlResponse<T>> query<T>(GraphqlQuery<T> query,
      [Map<String, String> headers, List<String> files]) async {
    headers ??= {};
    if (language != null) headers['Accept-Language'] = language;

    JsonResponse result =
        await request(query.query, query.variables, headers, files);
    return result.decode((body) {
      Map map = json.decode(body);
      return new GraphqlResponse<T>(query.constructorOfData, map);
    });
  }
}

main() async {
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
  GraphqlClient cli = new GraphqlClient(
      "http://localhost:60000/simple/v1/cj9mldxkd008c017544mu2vhw");
  var result = await cli.request(query, {"alias": "atest"});
  print(result);
}
