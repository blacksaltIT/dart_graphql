// Copyright (c) 2019, the Black Salt authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of 'client.dart';

typedef T Decoder<T>(aString);

class JsonResponse {
  String _body;

  JsonResponse(this._body);

  T decode<T>(decoder) {
    return decoder(_body);
  }

  String get body => _body;
}

class GraphqlExceptionErrorLocation {
  int line;
  int column;

  GraphqlExceptionErrorLocation([this.line, this.column]) {}

  String toString() {
    if (line != null && column != null) return "$line:$column";
    if (line != null) return "$line";
    if (column != null) return "$column";
    return "";
  }
}

class GraphqlExceptionErrorEntry {
  String message;
  List<GraphqlExceptionErrorLocation> locations = [];

  GraphqlExceptionErrorEntry([this.message, this.locations]) {}

  String toString() {
    if (message != null && locations != null && locations.isNotEmpty)
      return "$message at (${locations.join(",")})";

    if (message == null && locations != null && locations.isNotEmpty)
      return "${locations.join(",")}";

    return message;
  }
}

class GraphqlException implements Exception {
  String message;
  List<GraphqlExceptionErrorEntry> errors = [];

  GraphqlException([this.message, this.errors]) {}

  String toString() {
    if (message != null && errors != null && errors.isNotEmpty)
      return "$message: $errors";
    if (errors != null && errors.isNotEmpty) return "GraphqlException: $errors";

    return "GraphqlException";
  }
}

class GraphqlQuery<T> {
  String query;
  Map<String, dynamic> variables;

  GraphqlQuery(this.query, this.variables, this.constructorOfData);

  Function constructorOfData;
}

class GraphqlResponse<T> extends MapObject {
  GraphqlResponse(this.dataCreator, Map mapObject) {
    super.map = mapObject;
  }

  Function dataCreator;

  T get data => dataCreator(MapObject.get(this, "data"));

  List<GraphqlExceptionErrorEntry> _errors;
  List<GraphqlExceptionErrorEntry> get errors {
    if (_errors != null) return _errors;

    _errors = [];
    List<dynamic> errList = MapObject.get(this, "errors");
    for (Map<String, dynamic> err in errList ?? []) {
      _errors.add(GraphqlExceptionErrorEntry());
      _errors.last.message = err["message"];
      _errors.last.locations = [];
      for (Map<String, dynamic> location in err["locations"] ?? []) {
        _errors.last.locations.add(GraphqlExceptionErrorLocation(
            location["line"], location["column"]));
      }
    }
    return _errors;
  }

  bool hasError() {
    return errors.isNotEmpty;
  }
}

class GraphqlResponseError extends MapObject {
  String get message => this["message"];

  String get requestId => this["requestId"];

  List<String> get path => this["path"];

  List get locations => this["path"];

  static GraphqlResponseError fromMap(Map map) {
    return new GraphqlResponseError()..map.addAll(map);
  }

  GraphqlResponseError copy({String message, String requestId}) {
    return new GraphqlResponseError()
      ..map.addAll(this.map)
      ..map["message"] = message
      ..map["requestId"] = requestId;
  }
}

class MapObject {
  @protected
  Map<String, dynamic> map = {};

  MapObject.fromMap(this.map) {
    compact();
  }

  MapObject();

  static get(dynamic obj, String key) {
    return obj[key];
  }

  compact() {
    List<String> keys = [];
    var values = [];
    map.forEach((key, value) {
      if (value != null) {
        keys.add(key);
        values.add(value);
      }
    });
    this.map = new Map.fromIterables(keys, values);
  }

  dynamic operator [](String key) => map[key];

  Map toJson() => map;

  @override
  String toString() {
    return map.toString();
  }
}

class EnumValue {
  EnumValue({this.value}) {}

  String value;

  @override
  String toString() {
    return value;
  }
}

Map<String, ScalarSerializer> scalarSerializers = {
  "DateTime": DateTimeConverter(),
  "EnumValue": EnumSerializer(),
  "JSONString": JSONStringSerializer()
};

abstract class ScalarSerializer<T> {
  dynamic serialize(T data);
  T deserialize(dynamic value);
  bool isType(dynamic value);
  String get dartName;
  String get dartPackage;
}

class DateTimeConverter implements ScalarSerializer<DateTime> {
  @override
  DateTime deserialize(d) => d == null ? null : DateTime.parse(d);

  isType(dynamic value) => value is DateTime;

  @override
  serialize(DateTime data) {
    if (data is DateTime) {
      DateTime utcDate = data.toUtc();
      String stamp = "${_addLeadingZeros(utcDate.year, 4)}-${_addLeadingZeros(utcDate.month)}-${_addLeadingZeros(utcDate.day)}T${_addLeadingZeros(utcDate.hour)}:${_addLeadingZeros(utcDate.minute)}:${_addLeadingZeros(utcDate.second)}";
      String timezone = 
          "${data.timeZoneOffset.isNegative ? '-' : '+'}${_addLeadingZeros(data.timeZoneOffset.inMinutes ~/ 60)}:${_addLeadingZeros(data.timeZoneOffset.inMinutes % 60)}";
      return "$stamp$timezone";
    }
  }

  String _addLeadingZeros(int number, [int totalLength = 2]) => number.toString().padLeft(totalLength, '0');

  String get dartName => "DateTime";

  @override
  String get dartPackage => null;
}

class EnumSerializer implements ScalarSerializer<EnumValue> {
  @override
  EnumValue deserialize(d) => d == null ? null : EnumValue(value: d);

  isType(dynamic value) => value is EnumValue;

  @override
  serialize(EnumValue data) {
    if (data is EnumValue) {
      return data.value;
    }
  }

  String get dartName => "EnumValue";

  @override
  String get dartPackage => 'package:dart_graphql/graphql/fetch.dart';
}

class JSONStringSerializer implements ScalarSerializer<Map<String, dynamic>> {
  @override
  Map<String, dynamic> deserialize(dynamic d) =>
      d == null ? null : json.decode(d);

  isType(dynamic value) => value is Map<String, dynamic>;

  @override
  serialize(Map<String, dynamic> data) {
    return json.encode(data);
  }

  String get dartName => "Map<String, dynamic>";

  @override
  String get dartPackage => 'dart:core';
}
