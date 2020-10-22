// Copyright (c) 2019, the Black Salt authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of 'client.dart';

typedef Decoder = T Function<T>(String aString);

class JsonResponse {
  final String _body;

  JsonResponse(this._body);

  T decode<T>(T Function(String) decoder) => decoder(_body);

  String get body => _body;
}

class GraphqlExceptionErrorLocation {
  int line;
  int column;

  GraphqlExceptionErrorLocation([this.line, this.column]);

  @override
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

  GraphqlExceptionErrorEntry([this.message, this.locations]);

  @override
  String toString() {
    if (message != null && locations != null && locations.isNotEmpty) {
      return "$message at (${locations.join(",")})";
    }

    if (message == null && locations != null && locations.isNotEmpty) {
      return "${locations.join(",")}";
    }

    return message;
  }
}

class GraphqlException implements Exception {
  String message;
  List<GraphqlExceptionErrorEntry> errors = [];

  GraphqlException([this.message, this.errors]);

  @override
  String toString() {
    if (message != null && errors != null && errors.isNotEmpty) {
      return "$message: $errors";
    }

    if (errors != null && errors.isNotEmpty) {
      return "GraphqlException: $errors";
    }

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
  GraphqlResponse(this.dataCreator, Map<String, dynamic> mapObject) {
    super.map = mapObject;
  }

  Function dataCreator;

  T get data => dataCreator(MapObject.get(this, "data")) as T;

  List<GraphqlExceptionErrorEntry> _errors;
  List<GraphqlExceptionErrorEntry> get errors {
    if (_errors != null) return _errors;

    _errors = [];
    List<Map<String, dynamic>> errList =
        (MapObject.get(this, "errors") as List<dynamic>)
            ?.cast<Map<String, dynamic>>();
    for (Map<String, dynamic> err in errList ?? []) {
      _errors.add(GraphqlExceptionErrorEntry());
      _errors.last.message = err["message"] as String;
      _errors.last.locations = [];
      for (Map<String, dynamic> location in err["locations"] ?? []) {
        _errors.last.locations.add(GraphqlExceptionErrorLocation(
            location["line"] as int, location["column"] as int));
      }
    }
    return _errors;
  }

  bool hasError() => errors.isNotEmpty;
}

class GraphqlResponseError extends MapObject {
  String get message => this["message"] as String;

  String get requestId => this["requestId"] as String;

  List<String> get path => this["path"] as List<String>;

  List<dynamic> get locations => this["locations"] as List<dynamic>;

  static GraphqlResponseError fromMap(Map<String, dynamic> map) =>
      GraphqlResponseError()..map.addAll(map);

  GraphqlResponseError copy({String message, String requestId}) =>
      GraphqlResponseError()
        ..map.addAll(map)
        ..map["message"] = message
        ..map["requestId"] = requestId;
}

class FileUploadInput {
  final Stream<List<int>> chunkStream;
  final Stream<int> byteStream;
  final List<int> bytes;
  final String string;
  final Uri uri;

  final String fileName;

  FileUploadInput({
    this.chunkStream,
    this.byteStream,
    this.bytes,
    this.string,
    this.uri,
    this.fileName,
  }) {
    assert([chunkStream, byteStream, bytes, string, uri]
            .fold<int>(0, (count, arg) => count + (arg != null ? 1 : 0)) ==
        1);
  }
}

class MapObject {
  @protected
  Map<String, dynamic> map = <String, dynamic>{};

  MapObject();
  MapObject.fromMap(this.map) {
    compact();
  }

  static dynamic get(dynamic obj, String key) => obj[key];

  void compact() {
    List<String> keys = [];
    List<dynamic> values = <dynamic>[];
    map.forEach((key, dynamic value) {
      if (value != null) {
        keys.add(key);
        values.add(value);
      }
    });
    map = Map<String, dynamic>.fromIterables(keys, values);
  }

  dynamic operator [](String key) => map[key];

  dynamic toJson() => map;

  @override
  String toString() => map.toString();
}

Map<String, ScalarSerializer> scalarSerializers = {
  "DateTime": DateTimeConverter(),
  "JSONString": JSONStringSerializer(),
  "TimeDelta": TimeDeltaSerializer(),
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
  DateTime deserialize(dynamic d) =>
      d == null ? null : DateTime.parse(d as String).toLocal();

  @override
  bool isType(dynamic value) => value is DateTime;

  @override
  dynamic serialize(DateTime data) {
    if (data is DateTime) {
      DateTime utcDate = data.toUtc();
      String stamp =
          "${_addLeadingZeros(utcDate.year, 4)}-${_addLeadingZeros(utcDate.month)}-${_addLeadingZeros(utcDate.day)}T${_addLeadingZeros(utcDate.hour)}:${_addLeadingZeros(utcDate.minute)}:${_addLeadingZeros(utcDate.second)}";
      String timezone =
          "${utcDate.timeZoneOffset.isNegative ? '-' : '+'}${_addLeadingZeros(utcDate.timeZoneOffset.inMinutes ~/ 60)}:${_addLeadingZeros(utcDate.timeZoneOffset.inMinutes % 60)}";
      return "$stamp$timezone";
    }
  }

  String _addLeadingZeros(int number, [int totalLength = 2]) =>
      number.toString().padLeft(totalLength, '0');

  @override
  String get dartName => "DateTime";

  @override
  String get dartPackage => null;
}

class JSONStringSerializer implements ScalarSerializer<Map<String, dynamic>> {
  @override
  Map<String, dynamic> deserialize(dynamic d) =>
      d == null ? null : json.decode(d as String) as Map<String, dynamic>;

  @override
  bool isType(dynamic value) => value is Map<String, dynamic>;

  @override
  dynamic serialize(Map<String, dynamic> data) => json.encode(data);

  @override
  String get dartName => "Map<String, dynamic>";

  @override
  String get dartPackage => 'dart:core';
}

class TimeDeltaSerializer implements ScalarSerializer<Duration> {
  static final RegExp pyFormat = RegExp(
      r'((?<days>-?\d+) days?, )?(?<hrs>\d+):(?<mins>\d\d):(?<secs>\d\d)(\.(?<usecs>\d{6}))?');

  @override
  Duration deserialize(dynamic d) {
    if (d == null || d is! String) return null;

    RegExpMatch match = pyFormat.firstMatch(d as String);
    if (match == null) return null;

    return Duration(
      days: int.parse(match.namedGroup('days') ?? '0'),
      hours: int.parse(match.namedGroup('hrs') ?? '0'),
      minutes: int.parse(match.namedGroup('mins') ?? '0'),
      seconds: int.parse(match.namedGroup('secs') ?? '0'),
      microseconds: int.parse(match.namedGroup('usecs') ?? '0'),
    );
  }

  @override
  bool isType(dynamic value) => value is Duration;

  @override
  dynamic serialize(Duration data) => data?.toString();

  @override
  String get dartName => "Duration";

  @override
  String get dartPackage => 'dart:core';
}
