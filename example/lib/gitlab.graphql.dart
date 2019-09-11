// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:dart_graphql/dart_graphql.dart';
import 'dart:core';
import 'dart:convert';

class User extends MapObject {
  String get avatarUrl => map["avatarUrl"] as String;
  set avatarUrl(String value) => map["avatarUrl"] = value;
  String get name => map["name"] as String;
  set name(String value) => map["name"] = value;
  String get username => map["username"] as String;
  set username(String value) => map["username"] = value;
  String get webUrl => map["webUrl"] as String;
  set webUrl(String value) => map["webUrl"] = value;
  static User fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return User()..map = map;
  }

  User clone() => User.fromMap(toJson() as Map<String, dynamic>, true);
}

class EpicEdge extends MapObject {
  String get cursor => map["cursor"] as String;
  set cursor(String value) => map["cursor"] = value;
  Epic get node {
    if (map['node'] is Epic) return map['node'] as Epic;
    return map['node'] = Epic.fromMap(map['node'] as Map<String, dynamic>);
  }

  set node(Epic value) => map["node"] = value;
  static EpicEdge fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return EpicEdge()..map = map;
  }

  EpicEdge clone() => EpicEdge.fromMap(toJson() as Map<String, dynamic>, true);
}

class PageInfo extends MapObject {
  String get endCursor => map["endCursor"] as String;
  set endCursor(String value) => map["endCursor"] = value;
  bool get hasNextPage => map["hasNextPage"] as bool;
  set hasNextPage(bool value) => map["hasNextPage"] = value;
  bool get hasPreviousPage => map["hasPreviousPage"] as bool;
  set hasPreviousPage(bool value) => map["hasPreviousPage"] = value;
  String get startCursor => map["startCursor"] as String;
  set startCursor(String value) => map["startCursor"] = value;
  static PageInfo fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return PageInfo()..map = map;
  }

  PageInfo clone() => PageInfo.fromMap(toJson() as Map<String, dynamic>, true);
}

class EpicConnection extends MapObject {
  List<EpicEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<EpicEdge>)
      return map['edges'] as List<EpicEdge>;

    List<EpicEdge> items = [];
    for (dynamic aVar in map['edges'])
      items.add(EpicEdge.fromMap(aVar as Map<String, dynamic>));

    return map['edges'] = items;
  }

  set edges(List<EpicEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'] as PageInfo;
    return map['pageInfo'] =
        PageInfo.fromMap(map['pageInfo'] as Map<String, dynamic>);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static EpicConnection fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return EpicConnection()..map = map;
  }

  EpicConnection clone() =>
      EpicConnection.fromMap(toJson() as Map<String, dynamic>, true);
}

class DiffRefs extends MapObject {
  String get baseSha => map["baseSha"] as String;
  set baseSha(String value) => map["baseSha"] = value;
  String get headSha => map["headSha"] as String;
  set headSha(String value) => map["headSha"] = value;
  String get startSha => map["startSha"] as String;
  set startSha(String value) => map["startSha"] = value;
  static DiffRefs fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return DiffRefs()..map = map;
  }

  DiffRefs clone() => DiffRefs.fromMap(toJson() as Map<String, dynamic>, true);
}

enum DiffPositionType { text, image }
Map<String, DiffPositionType> _mapNamesForDiffPositionType = {
  "text": DiffPositionType.text,
  "image": DiffPositionType.image
};
DiffPositionType parseDiffPositionType(String value) =>
    value != null && value != ""
        ? _mapNamesForDiffPositionType[value.toLowerCase()]
        : null;
String toDiffPositionTypeString(DiffPositionType value) =>
    value?.toString()?.split(".")?.last;

class DiffPosition extends MapObject {
  DiffRefs get diffRefs {
    if (map['diffRefs'] is DiffRefs) return map['diffRefs'] as DiffRefs;
    return map['diffRefs'] =
        DiffRefs.fromMap(map['diffRefs'] as Map<String, dynamic>);
  }

  set diffRefs(DiffRefs value) => map["diffRefs"] = value;
  String get filePath => map["filePath"] as String;
  set filePath(String value) => map["filePath"] = value;
  int get height => map["height"] as int;
  set height(int value) => map["height"] = value;
  int get newLine => map["newLine"] as int;
  set newLine(int value) => map["newLine"] = value;
  String get newPath => map["newPath"] as String;
  set newPath(String value) => map["newPath"] = value;
  int get oldLine => map["oldLine"] as int;
  set oldLine(int value) => map["oldLine"] = value;
  String get oldPath => map["oldPath"] as String;
  set oldPath(String value) => map["oldPath"] = value;
  DiffPositionType get positionType =>
      parseDiffPositionType(map["positionType"] as String);
  set positionType(DiffPositionType value) =>
      map["positionType"] = toDiffPositionTypeString(value);
  int get width => map["width"] as int;
  set width(int value) => map["width"] = value;
  int get x => map["x"] as int;
  set x(int value) => map["x"] = value;
  int get y => map["y"] as int;
  set y(int value) => map["y"] = value;
  static DiffPosition fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return DiffPosition()..map = map;
  }

  DiffPosition clone() =>
      DiffPosition.fromMap(toJson() as Map<String, dynamic>, true);
}

class NotePermissions extends MapObject {
  bool get adminNote => map["adminNote"] as bool;
  set adminNote(bool value) => map["adminNote"] = value;
  bool get awardEmoji => map["awardEmoji"] as bool;
  set awardEmoji(bool value) => map["awardEmoji"] = value;
  bool get createNote => map["createNote"] as bool;
  set createNote(bool value) => map["createNote"] = value;
  bool get readNote => map["readNote"] as bool;
  set readNote(bool value) => map["readNote"] = value;
  bool get resolveNote => map["resolveNote"] as bool;
  set resolveNote(bool value) => map["resolveNote"] = value;
  static NotePermissions fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return NotePermissions()..map = map;
  }

  NotePermissions clone() =>
      NotePermissions.fromMap(toJson() as Map<String, dynamic>, true);
}

class Note extends MapObject {
  User get author {
    if (map['author'] is User) return map['author'] as User;
    return map['author'] = User.fromMap(map['author'] as Map<String, dynamic>);
  }

  set author(User value) => map["author"] = value;
  String get body => map["body"] as String;
  set body(String value) => map["body"] = value;
  String get bodyHtml => map["bodyHtml"] as String;
  set bodyHtml(String value) => map["bodyHtml"] = value;
  dynamic get createdAt => map["createdAt"] as dynamic;
  set createdAt(dynamic value) => map["createdAt"] = value;
  Discussion get discussion {
    if (map['discussion'] is Discussion) return map['discussion'] as Discussion;
    return map['discussion'] =
        Discussion.fromMap(map['discussion'] as Map<String, dynamic>);
  }

  set discussion(Discussion value) => map["discussion"] = value;
  String get id => map["id"] as String;
  set id(String value) => map["id"] = value;
  DiffPosition get position {
    if (map['position'] is DiffPosition) return map['position'] as DiffPosition;
    return map['position'] =
        DiffPosition.fromMap(map['position'] as Map<String, dynamic>);
  }

  set position(DiffPosition value) => map["position"] = value;
  Project get project {
    if (map['project'] is Project) return map['project'] as Project;
    return map['project'] =
        Project.fromMap(map['project'] as Map<String, dynamic>);
  }

  set project(Project value) => map["project"] = value;
  bool get resolvable => map["resolvable"] as bool;
  set resolvable(bool value) => map["resolvable"] = value;
  dynamic get resolvedAt => map["resolvedAt"] as dynamic;
  set resolvedAt(dynamic value) => map["resolvedAt"] = value;
  User get resolvedBy {
    if (map['resolvedBy'] is User) return map['resolvedBy'] as User;
    return map['resolvedBy'] =
        User.fromMap(map['resolvedBy'] as Map<String, dynamic>);
  }

  set resolvedBy(User value) => map["resolvedBy"] = value;
  bool get system => map["system"] as bool;
  set system(bool value) => map["system"] = value;
  dynamic get updatedAt => map["updatedAt"] as dynamic;
  set updatedAt(dynamic value) => map["updatedAt"] = value;
  NotePermissions get userPermissions {
    if (map['userPermissions'] is NotePermissions)
      return map['userPermissions'] as NotePermissions;
    return map['userPermissions'] =
        NotePermissions.fromMap(map['userPermissions'] as Map<String, dynamic>);
  }

  set userPermissions(NotePermissions value) => map["userPermissions"] = value;
  static Note fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return Note()..map = map;
  }

  Note clone() => Note.fromMap(toJson() as Map<String, dynamic>, true);
}

class NoteEdge extends MapObject {
  String get cursor => map["cursor"] as String;
  set cursor(String value) => map["cursor"] = value;
  Note get node {
    if (map['node'] is Note) return map['node'] as Note;
    return map['node'] = Note.fromMap(map['node'] as Map<String, dynamic>);
  }

  set node(Note value) => map["node"] = value;
  static NoteEdge fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return NoteEdge()..map = map;
  }

  NoteEdge clone() => NoteEdge.fromMap(toJson() as Map<String, dynamic>, true);
}

class NoteConnection extends MapObject {
  List<NoteEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<NoteEdge>)
      return map['edges'] as List<NoteEdge>;

    List<NoteEdge> items = [];
    for (dynamic aVar in map['edges'])
      items.add(NoteEdge.fromMap(aVar as Map<String, dynamic>));

    return map['edges'] = items;
  }

  set edges(List<NoteEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'] as PageInfo;
    return map['pageInfo'] =
        PageInfo.fromMap(map['pageInfo'] as Map<String, dynamic>);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static NoteConnection fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return NoteConnection()..map = map;
  }

  NoteConnection clone() =>
      NoteConnection.fromMap(toJson() as Map<String, dynamic>, true);
}

class Discussion extends MapObject {
  dynamic get createdAt => map["createdAt"] as dynamic;
  set createdAt(dynamic value) => map["createdAt"] = value;
  String get id => map["id"] as String;
  set id(String value) => map["id"] = value;
  NoteConnection get notes {
    if (map['notes'] is NoteConnection) return map['notes'] as NoteConnection;
    return map['notes'] =
        NoteConnection.fromMap(map['notes'] as Map<String, dynamic>);
  }

  set notes(NoteConnection value) => map["notes"] = value;
  String get replyId => map["replyId"] as String;
  set replyId(String value) => map["replyId"] = value;
  static Discussion fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return Discussion()..map = map;
  }

  Discussion clone() =>
      Discussion.fromMap(toJson() as Map<String, dynamic>, true);
}

class DiscussionEdge extends MapObject {
  String get cursor => map["cursor"] as String;
  set cursor(String value) => map["cursor"] = value;
  Discussion get node {
    if (map['node'] is Discussion) return map['node'] as Discussion;
    return map['node'] =
        Discussion.fromMap(map['node'] as Map<String, dynamic>);
  }

  set node(Discussion value) => map["node"] = value;
  static DiscussionEdge fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return DiscussionEdge()..map = map;
  }

  DiscussionEdge clone() =>
      DiscussionEdge.fromMap(toJson() as Map<String, dynamic>, true);
}

class DiscussionConnection extends MapObject {
  List<DiscussionEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<DiscussionEdge>)
      return map['edges'] as List<DiscussionEdge>;

    List<DiscussionEdge> items = [];
    for (dynamic aVar in map['edges'])
      items.add(DiscussionEdge.fromMap(aVar as Map<String, dynamic>));

    return map['edges'] = items;
  }

  set edges(List<DiscussionEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'] as PageInfo;
    return map['pageInfo'] =
        PageInfo.fromMap(map['pageInfo'] as Map<String, dynamic>);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static DiscussionConnection fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return DiscussionConnection()..map = map;
  }

  DiscussionConnection clone() =>
      DiscussionConnection.fromMap(toJson() as Map<String, dynamic>, true);
}

class UserEdge extends MapObject {
  String get cursor => map["cursor"] as String;
  set cursor(String value) => map["cursor"] = value;
  User get node {
    if (map['node'] is User) return map['node'] as User;
    return map['node'] = User.fromMap(map['node'] as Map<String, dynamic>);
  }

  set node(User value) => map["node"] = value;
  static UserEdge fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return UserEdge()..map = map;
  }

  UserEdge clone() => UserEdge.fromMap(toJson() as Map<String, dynamic>, true);
}

class UserConnection extends MapObject {
  List<UserEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<UserEdge>)
      return map['edges'] as List<UserEdge>;

    List<UserEdge> items = [];
    for (dynamic aVar in map['edges'])
      items.add(UserEdge.fromMap(aVar as Map<String, dynamic>));

    return map['edges'] = items;
  }

  set edges(List<UserEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'] as PageInfo;
    return map['pageInfo'] =
        PageInfo.fromMap(map['pageInfo'] as Map<String, dynamic>);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static UserConnection fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return UserConnection()..map = map;
  }

  UserConnection clone() =>
      UserConnection.fromMap(toJson() as Map<String, dynamic>, true);
}

class Label extends MapObject {
  String get color => map["color"] as String;
  set color(String value) => map["color"] = value;
  String get description => map["description"] as String;
  set description(String value) => map["description"] = value;
  String get descriptionHtml => map["descriptionHtml"] as String;
  set descriptionHtml(String value) => map["descriptionHtml"] = value;
  String get textColor => map["textColor"] as String;
  set textColor(String value) => map["textColor"] = value;
  String get title => map["title"] as String;
  set title(String value) => map["title"] = value;
  static Label fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return Label()..map = map;
  }

  Label clone() => Label.fromMap(toJson() as Map<String, dynamic>, true);
}

class LabelEdge extends MapObject {
  String get cursor => map["cursor"] as String;
  set cursor(String value) => map["cursor"] = value;
  Label get node {
    if (map['node'] is Label) return map['node'] as Label;
    return map['node'] = Label.fromMap(map['node'] as Map<String, dynamic>);
  }

  set node(Label value) => map["node"] = value;
  static LabelEdge fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return LabelEdge()..map = map;
  }

  LabelEdge clone() =>
      LabelEdge.fromMap(toJson() as Map<String, dynamic>, true);
}

class LabelConnection extends MapObject {
  List<LabelEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<LabelEdge>)
      return map['edges'] as List<LabelEdge>;

    List<LabelEdge> items = [];
    for (dynamic aVar in map['edges'])
      items.add(LabelEdge.fromMap(aVar as Map<String, dynamic>));

    return map['edges'] = items;
  }

  set edges(List<LabelEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'] as PageInfo;
    return map['pageInfo'] =
        PageInfo.fromMap(map['pageInfo'] as Map<String, dynamic>);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static LabelConnection fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return LabelConnection()..map = map;
  }

  LabelConnection clone() =>
      LabelConnection.fromMap(toJson() as Map<String, dynamic>, true);
}

class Milestone extends MapObject {
  dynamic get createdAt => map["createdAt"] as dynamic;
  set createdAt(dynamic value) => map["createdAt"] = value;
  String get description => map["description"] as String;
  set description(String value) => map["description"] = value;
  dynamic get dueDate => map["dueDate"] as dynamic;
  set dueDate(dynamic value) => map["dueDate"] = value;
  dynamic get startDate => map["startDate"] as dynamic;
  set startDate(dynamic value) => map["startDate"] = value;
  String get state => map["state"] as String;
  set state(String value) => map["state"] = value;
  String get title => map["title"] as String;
  set title(String value) => map["title"] = value;
  dynamic get updatedAt => map["updatedAt"] as dynamic;
  set updatedAt(dynamic value) => map["updatedAt"] = value;
  static Milestone fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return Milestone()..map = map;
  }

  Milestone clone() =>
      Milestone.fromMap(toJson() as Map<String, dynamic>, true);
}

enum IssueState { opened, closed, locked }
Map<String, IssueState> _mapNamesForIssueState = {
  "opened": IssueState.opened,
  "closed": IssueState.closed,
  "locked": IssueState.locked
};
IssueState parseIssueState(String value) => value != null && value != ""
    ? _mapNamesForIssueState[value.toLowerCase()]
    : null;
String toIssueStateString(IssueState value) =>
    value?.toString()?.split(".")?.last;

class TaskCompletionStatus extends MapObject {
  int get completedCount => map["completedCount"] as int;
  set completedCount(int value) => map["completedCount"] = value;
  int get count => map["count"] as int;
  set count(int value) => map["count"] = value;
  static TaskCompletionStatus fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return TaskCompletionStatus()..map = map;
  }

  TaskCompletionStatus clone() =>
      TaskCompletionStatus.fromMap(toJson() as Map<String, dynamic>, true);
}

class IssuePermissions extends MapObject {
  bool get adminIssue => map["adminIssue"] as bool;
  set adminIssue(bool value) => map["adminIssue"] = value;
  bool get createDesign => map["createDesign"] as bool;
  set createDesign(bool value) => map["createDesign"] = value;
  bool get createNote => map["createNote"] as bool;
  set createNote(bool value) => map["createNote"] = value;
  bool get destroyDesign => map["destroyDesign"] as bool;
  set destroyDesign(bool value) => map["destroyDesign"] = value;
  bool get readDesign => map["readDesign"] as bool;
  set readDesign(bool value) => map["readDesign"] = value;
  bool get readIssue => map["readIssue"] as bool;
  set readIssue(bool value) => map["readIssue"] = value;
  bool get reopenIssue => map["reopenIssue"] as bool;
  set reopenIssue(bool value) => map["reopenIssue"] = value;
  bool get updateIssue => map["updateIssue"] as bool;
  set updateIssue(bool value) => map["updateIssue"] = value;
  static IssuePermissions fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return IssuePermissions()..map = map;
  }

  IssuePermissions clone() =>
      IssuePermissions.fromMap(toJson() as Map<String, dynamic>, true);
}

class Issue extends MapObject {
  UserConnection get assignees {
    if (map['assignees'] is UserConnection)
      return map['assignees'] as UserConnection;
    return map['assignees'] =
        UserConnection.fromMap(map['assignees'] as Map<String, dynamic>);
  }

  set assignees(UserConnection value) => map["assignees"] = value;
  User get author {
    if (map['author'] is User) return map['author'] as User;
    return map['author'] = User.fromMap(map['author'] as Map<String, dynamic>);
  }

  set author(User value) => map["author"] = value;
  dynamic get closedAt => map["closedAt"] as dynamic;
  set closedAt(dynamic value) => map["closedAt"] = value;
  bool get confidential => map["confidential"] as bool;
  set confidential(bool value) => map["confidential"] = value;
  dynamic get createdAt => map["createdAt"] as dynamic;
  set createdAt(dynamic value) => map["createdAt"] = value;
  String get description => map["description"] as String;
  set description(String value) => map["description"] = value;
  String get descriptionHtml => map["descriptionHtml"] as String;
  set descriptionHtml(String value) => map["descriptionHtml"] = value;
  DesignCollection get designCollection {
    if (map['designCollection'] is DesignCollection)
      return map['designCollection'] as DesignCollection;
    return map['designCollection'] = DesignCollection.fromMap(
        map['designCollection'] as Map<String, dynamic>);
  }

  set designCollection(DesignCollection value) =>
      map["designCollection"] = value;
  DesignCollection get designs {
    if (map['designs'] is DesignCollection)
      return map['designs'] as DesignCollection;
    return map['designs'] =
        DesignCollection.fromMap(map['designs'] as Map<String, dynamic>);
  }

  set designs(DesignCollection value) => map["designs"] = value;
  bool get discussionLocked => map["discussionLocked"] as bool;
  set discussionLocked(bool value) => map["discussionLocked"] = value;
  DiscussionConnection get discussions {
    if (map['discussions'] is DiscussionConnection)
      return map['discussions'] as DiscussionConnection;
    return map['discussions'] = DiscussionConnection.fromMap(
        map['discussions'] as Map<String, dynamic>);
  }

  set discussions(DiscussionConnection value) => map["discussions"] = value;
  int get downvotes => map["downvotes"] as int;
  set downvotes(int value) => map["downvotes"] = value;
  dynamic get dueDate => map["dueDate"] as dynamic;
  set dueDate(dynamic value) => map["dueDate"] = value;
  String get iid => map["iid"] as String;
  set iid(String value) => map["iid"] = value;
  LabelConnection get labels {
    if (map['labels'] is LabelConnection)
      return map['labels'] as LabelConnection;
    return map['labels'] =
        LabelConnection.fromMap(map['labels'] as Map<String, dynamic>);
  }

  set labels(LabelConnection value) => map["labels"] = value;
  Milestone get milestone {
    if (map['milestone'] is Milestone) return map['milestone'] as Milestone;
    return map['milestone'] =
        Milestone.fromMap(map['milestone'] as Map<String, dynamic>);
  }

  set milestone(Milestone value) => map["milestone"] = value;
  NoteConnection get notes {
    if (map['notes'] is NoteConnection) return map['notes'] as NoteConnection;
    return map['notes'] =
        NoteConnection.fromMap(map['notes'] as Map<String, dynamic>);
  }

  set notes(NoteConnection value) => map["notes"] = value;
  String get reference => map["reference"] as String;
  set reference(String value) => map["reference"] = value;
  int get relativePosition => map["relativePosition"] as int;
  set relativePosition(int value) => map["relativePosition"] = value;
  IssueState get state => parseIssueState(map["state"] as String);
  set state(IssueState value) => map["state"] = toIssueStateString(value);
  TaskCompletionStatus get taskCompletionStatus {
    if (map['taskCompletionStatus'] is TaskCompletionStatus)
      return map['taskCompletionStatus'] as TaskCompletionStatus;
    return map['taskCompletionStatus'] = TaskCompletionStatus.fromMap(
        map['taskCompletionStatus'] as Map<String, dynamic>);
  }

  set taskCompletionStatus(TaskCompletionStatus value) =>
      map["taskCompletionStatus"] = value;
  String get title => map["title"] as String;
  set title(String value) => map["title"] = value;
  String get titleHtml => map["titleHtml"] as String;
  set titleHtml(String value) => map["titleHtml"] = value;
  dynamic get updatedAt => map["updatedAt"] as dynamic;
  set updatedAt(dynamic value) => map["updatedAt"] = value;
  int get upvotes => map["upvotes"] as int;
  set upvotes(int value) => map["upvotes"] = value;
  int get userNotesCount => map["userNotesCount"] as int;
  set userNotesCount(int value) => map["userNotesCount"] = value;
  IssuePermissions get userPermissions {
    if (map['userPermissions'] is IssuePermissions)
      return map['userPermissions'] as IssuePermissions;
    return map['userPermissions'] = IssuePermissions.fromMap(
        map['userPermissions'] as Map<String, dynamic>);
  }

  set userPermissions(IssuePermissions value) => map["userPermissions"] = value;
  String get webPath => map["webPath"] as String;
  set webPath(String value) => map["webPath"] = value;
  String get webUrl => map["webUrl"] as String;
  set webUrl(String value) => map["webUrl"] = value;
  int get weight => map["weight"] as int;
  set weight(int value) => map["weight"] = value;
  static Issue fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return Issue()..map = map;
  }

  Issue clone() => Issue.fromMap(toJson() as Map<String, dynamic>, true);
}

class DesignVersion extends MapObject {
  DesignConnection get designs {
    if (map['designs'] is DesignConnection)
      return map['designs'] as DesignConnection;
    return map['designs'] =
        DesignConnection.fromMap(map['designs'] as Map<String, dynamic>);
  }

  set designs(DesignConnection value) => map["designs"] = value;
  String get id => map["id"] as String;
  set id(String value) => map["id"] = value;
  String get sha => map["sha"] as String;
  set sha(String value) => map["sha"] = value;
  static DesignVersion fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return DesignVersion()..map = map;
  }

  DesignVersion clone() =>
      DesignVersion.fromMap(toJson() as Map<String, dynamic>, true);
}

class DesignVersionEdge extends MapObject {
  String get cursor => map["cursor"] as String;
  set cursor(String value) => map["cursor"] = value;
  DesignVersion get node {
    if (map['node'] is DesignVersion) return map['node'] as DesignVersion;
    return map['node'] =
        DesignVersion.fromMap(map['node'] as Map<String, dynamic>);
  }

  set node(DesignVersion value) => map["node"] = value;
  static DesignVersionEdge fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return DesignVersionEdge()..map = map;
  }

  DesignVersionEdge clone() =>
      DesignVersionEdge.fromMap(toJson() as Map<String, dynamic>, true);
}

class DesignVersionConnection extends MapObject {
  List<DesignVersionEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<DesignVersionEdge>)
      return map['edges'] as List<DesignVersionEdge>;

    List<DesignVersionEdge> items = [];
    for (dynamic aVar in map['edges'])
      items.add(DesignVersionEdge.fromMap(aVar as Map<String, dynamic>));

    return map['edges'] = items;
  }

  set edges(List<DesignVersionEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'] as PageInfo;
    return map['pageInfo'] =
        PageInfo.fromMap(map['pageInfo'] as Map<String, dynamic>);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static DesignVersionConnection fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return DesignVersionConnection()..map = map;
  }

  DesignVersionConnection clone() =>
      DesignVersionConnection.fromMap(toJson() as Map<String, dynamic>, true);
}

class Design extends MapObject {
  DiffRefs get diffRefs {
    if (map['diffRefs'] is DiffRefs) return map['diffRefs'] as DiffRefs;
    return map['diffRefs'] =
        DiffRefs.fromMap(map['diffRefs'] as Map<String, dynamic>);
  }

  set diffRefs(DiffRefs value) => map["diffRefs"] = value;
  DiscussionConnection get discussions {
    if (map['discussions'] is DiscussionConnection)
      return map['discussions'] as DiscussionConnection;
    return map['discussions'] = DiscussionConnection.fromMap(
        map['discussions'] as Map<String, dynamic>);
  }

  set discussions(DiscussionConnection value) => map["discussions"] = value;
  String get filename => map["filename"] as String;
  set filename(String value) => map["filename"] = value;
  String get fullPath => map["fullPath"] as String;
  set fullPath(String value) => map["fullPath"] = value;
  String get id => map["id"] as String;
  set id(String value) => map["id"] = value;
  String get image => map["image"] as String;
  set image(String value) => map["image"] = value;
  Issue get issue {
    if (map['issue'] is Issue) return map['issue'] as Issue;
    return map['issue'] = Issue.fromMap(map['issue'] as Map<String, dynamic>);
  }

  set issue(Issue value) => map["issue"] = value;
  NoteConnection get notes {
    if (map['notes'] is NoteConnection) return map['notes'] as NoteConnection;
    return map['notes'] =
        NoteConnection.fromMap(map['notes'] as Map<String, dynamic>);
  }

  set notes(NoteConnection value) => map["notes"] = value;
  int get notesCount => map["notesCount"] as int;
  set notesCount(int value) => map["notesCount"] = value;
  Project get project {
    if (map['project'] is Project) return map['project'] as Project;
    return map['project'] =
        Project.fromMap(map['project'] as Map<String, dynamic>);
  }

  set project(Project value) => map["project"] = value;
  DesignVersionConnection get versions {
    if (map['versions'] is DesignVersionConnection)
      return map['versions'] as DesignVersionConnection;
    return map['versions'] = DesignVersionConnection.fromMap(
        map['versions'] as Map<String, dynamic>);
  }

  set versions(DesignVersionConnection value) => map["versions"] = value;
  static Design fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return Design()..map = map;
  }

  Design clone() => Design.fromMap(toJson() as Map<String, dynamic>, true);
}

class DesignEdge extends MapObject {
  String get cursor => map["cursor"] as String;
  set cursor(String value) => map["cursor"] = value;
  Design get node {
    if (map['node'] is Design) return map['node'] as Design;
    return map['node'] = Design.fromMap(map['node'] as Map<String, dynamic>);
  }

  set node(Design value) => map["node"] = value;
  static DesignEdge fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return DesignEdge()..map = map;
  }

  DesignEdge clone() =>
      DesignEdge.fromMap(toJson() as Map<String, dynamic>, true);
}

class DesignConnection extends MapObject {
  List<DesignEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<DesignEdge>)
      return map['edges'] as List<DesignEdge>;

    List<DesignEdge> items = [];
    for (dynamic aVar in map['edges'])
      items.add(DesignEdge.fromMap(aVar as Map<String, dynamic>));

    return map['edges'] = items;
  }

  set edges(List<DesignEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'] as PageInfo;
    return map['pageInfo'] =
        PageInfo.fromMap(map['pageInfo'] as Map<String, dynamic>);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static DesignConnection fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return DesignConnection()..map = map;
  }

  DesignConnection clone() =>
      DesignConnection.fromMap(toJson() as Map<String, dynamic>, true);
}

class DesignCollection extends MapObject {
  DesignConnection get designs {
    if (map['designs'] is DesignConnection)
      return map['designs'] as DesignConnection;
    return map['designs'] =
        DesignConnection.fromMap(map['designs'] as Map<String, dynamic>);
  }

  set designs(DesignConnection value) => map["designs"] = value;
  Issue get issue {
    if (map['issue'] is Issue) return map['issue'] as Issue;
    return map['issue'] = Issue.fromMap(map['issue'] as Map<String, dynamic>);
  }

  set issue(Issue value) => map["issue"] = value;
  Project get project {
    if (map['project'] is Project) return map['project'] as Project;
    return map['project'] =
        Project.fromMap(map['project'] as Map<String, dynamic>);
  }

  set project(Project value) => map["project"] = value;
  DesignVersionConnection get versions {
    if (map['versions'] is DesignVersionConnection)
      return map['versions'] as DesignVersionConnection;
    return map['versions'] = DesignVersionConnection.fromMap(
        map['versions'] as Map<String, dynamic>);
  }

  set versions(DesignVersionConnection value) => map["versions"] = value;
  static DesignCollection fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return DesignCollection()..map = map;
  }

  DesignCollection clone() =>
      DesignCollection.fromMap(toJson() as Map<String, dynamic>, true);
}

class EpicIssue extends MapObject {
  UserConnection get assignees {
    if (map['assignees'] is UserConnection)
      return map['assignees'] as UserConnection;
    return map['assignees'] =
        UserConnection.fromMap(map['assignees'] as Map<String, dynamic>);
  }

  set assignees(UserConnection value) => map["assignees"] = value;
  User get author {
    if (map['author'] is User) return map['author'] as User;
    return map['author'] = User.fromMap(map['author'] as Map<String, dynamic>);
  }

  set author(User value) => map["author"] = value;
  dynamic get closedAt => map["closedAt"] as dynamic;
  set closedAt(dynamic value) => map["closedAt"] = value;
  bool get confidential => map["confidential"] as bool;
  set confidential(bool value) => map["confidential"] = value;
  dynamic get createdAt => map["createdAt"] as dynamic;
  set createdAt(dynamic value) => map["createdAt"] = value;
  String get description => map["description"] as String;
  set description(String value) => map["description"] = value;
  String get descriptionHtml => map["descriptionHtml"] as String;
  set descriptionHtml(String value) => map["descriptionHtml"] = value;
  DesignCollection get designCollection {
    if (map['designCollection'] is DesignCollection)
      return map['designCollection'] as DesignCollection;
    return map['designCollection'] = DesignCollection.fromMap(
        map['designCollection'] as Map<String, dynamic>);
  }

  set designCollection(DesignCollection value) =>
      map["designCollection"] = value;
  DesignCollection get designs {
    if (map['designs'] is DesignCollection)
      return map['designs'] as DesignCollection;
    return map['designs'] =
        DesignCollection.fromMap(map['designs'] as Map<String, dynamic>);
  }

  set designs(DesignCollection value) => map["designs"] = value;
  bool get discussionLocked => map["discussionLocked"] as bool;
  set discussionLocked(bool value) => map["discussionLocked"] = value;
  DiscussionConnection get discussions {
    if (map['discussions'] is DiscussionConnection)
      return map['discussions'] as DiscussionConnection;
    return map['discussions'] = DiscussionConnection.fromMap(
        map['discussions'] as Map<String, dynamic>);
  }

  set discussions(DiscussionConnection value) => map["discussions"] = value;
  int get downvotes => map["downvotes"] as int;
  set downvotes(int value) => map["downvotes"] = value;
  dynamic get dueDate => map["dueDate"] as dynamic;
  set dueDate(dynamic value) => map["dueDate"] = value;
  String get epicIssueId => map["epicIssueId"] as String;
  set epicIssueId(String value) => map["epicIssueId"] = value;
  String get iid => map["iid"] as String;
  set iid(String value) => map["iid"] = value;
  LabelConnection get labels {
    if (map['labels'] is LabelConnection)
      return map['labels'] as LabelConnection;
    return map['labels'] =
        LabelConnection.fromMap(map['labels'] as Map<String, dynamic>);
  }

  set labels(LabelConnection value) => map["labels"] = value;
  Milestone get milestone {
    if (map['milestone'] is Milestone) return map['milestone'] as Milestone;
    return map['milestone'] =
        Milestone.fromMap(map['milestone'] as Map<String, dynamic>);
  }

  set milestone(Milestone value) => map["milestone"] = value;
  NoteConnection get notes {
    if (map['notes'] is NoteConnection) return map['notes'] as NoteConnection;
    return map['notes'] =
        NoteConnection.fromMap(map['notes'] as Map<String, dynamic>);
  }

  set notes(NoteConnection value) => map["notes"] = value;
  String get reference => map["reference"] as String;
  set reference(String value) => map["reference"] = value;
  String get relationPath => map["relationPath"] as String;
  set relationPath(String value) => map["relationPath"] = value;
  int get relativePosition => map["relativePosition"] as int;
  set relativePosition(int value) => map["relativePosition"] = value;
  IssueState get state => parseIssueState(map["state"] as String);
  set state(IssueState value) => map["state"] = toIssueStateString(value);
  TaskCompletionStatus get taskCompletionStatus {
    if (map['taskCompletionStatus'] is TaskCompletionStatus)
      return map['taskCompletionStatus'] as TaskCompletionStatus;
    return map['taskCompletionStatus'] = TaskCompletionStatus.fromMap(
        map['taskCompletionStatus'] as Map<String, dynamic>);
  }

  set taskCompletionStatus(TaskCompletionStatus value) =>
      map["taskCompletionStatus"] = value;
  String get title => map["title"] as String;
  set title(String value) => map["title"] = value;
  String get titleHtml => map["titleHtml"] as String;
  set titleHtml(String value) => map["titleHtml"] = value;
  dynamic get updatedAt => map["updatedAt"] as dynamic;
  set updatedAt(dynamic value) => map["updatedAt"] = value;
  int get upvotes => map["upvotes"] as int;
  set upvotes(int value) => map["upvotes"] = value;
  int get userNotesCount => map["userNotesCount"] as int;
  set userNotesCount(int value) => map["userNotesCount"] = value;
  IssuePermissions get userPermissions {
    if (map['userPermissions'] is IssuePermissions)
      return map['userPermissions'] as IssuePermissions;
    return map['userPermissions'] = IssuePermissions.fromMap(
        map['userPermissions'] as Map<String, dynamic>);
  }

  set userPermissions(IssuePermissions value) => map["userPermissions"] = value;
  String get webPath => map["webPath"] as String;
  set webPath(String value) => map["webPath"] = value;
  String get webUrl => map["webUrl"] as String;
  set webUrl(String value) => map["webUrl"] = value;
  int get weight => map["weight"] as int;
  set weight(int value) => map["weight"] = value;
  static EpicIssue fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return EpicIssue()..map = map;
  }

  EpicIssue clone() =>
      EpicIssue.fromMap(toJson() as Map<String, dynamic>, true);
}

class EpicIssueEdge extends MapObject {
  String get cursor => map["cursor"] as String;
  set cursor(String value) => map["cursor"] = value;
  EpicIssue get node {
    if (map['node'] is EpicIssue) return map['node'] as EpicIssue;
    return map['node'] = EpicIssue.fromMap(map['node'] as Map<String, dynamic>);
  }

  set node(EpicIssue value) => map["node"] = value;
  static EpicIssueEdge fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return EpicIssueEdge()..map = map;
  }

  EpicIssueEdge clone() =>
      EpicIssueEdge.fromMap(toJson() as Map<String, dynamic>, true);
}

class EpicIssueConnection extends MapObject {
  List<EpicIssueEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<EpicIssueEdge>)
      return map['edges'] as List<EpicIssueEdge>;

    List<EpicIssueEdge> items = [];
    for (dynamic aVar in map['edges'])
      items.add(EpicIssueEdge.fromMap(aVar as Map<String, dynamic>));

    return map['edges'] = items;
  }

  set edges(List<EpicIssueEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'] as PageInfo;
    return map['pageInfo'] =
        PageInfo.fromMap(map['pageInfo'] as Map<String, dynamic>);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static EpicIssueConnection fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return EpicIssueConnection()..map = map;
  }

  EpicIssueConnection clone() =>
      EpicIssueConnection.fromMap(toJson() as Map<String, dynamic>, true);
}

enum EpicState { opened, closed }
Map<String, EpicState> _mapNamesForEpicState = {
  "opened": EpicState.opened,
  "closed": EpicState.closed
};
EpicState parseEpicState(String value) => value != null && value != ""
    ? _mapNamesForEpicState[value.toLowerCase()]
    : null;
String toEpicStateString(EpicState value) =>
    value?.toString()?.split(".")?.last;

class EpicPermissions extends MapObject {
  bool get adminEpic => map["adminEpic"] as bool;
  set adminEpic(bool value) => map["adminEpic"] = value;
  bool get awardEmoji => map["awardEmoji"] as bool;
  set awardEmoji(bool value) => map["awardEmoji"] = value;
  bool get createEpic => map["createEpic"] as bool;
  set createEpic(bool value) => map["createEpic"] = value;
  bool get createNote => map["createNote"] as bool;
  set createNote(bool value) => map["createNote"] = value;
  bool get destroyEpic => map["destroyEpic"] as bool;
  set destroyEpic(bool value) => map["destroyEpic"] = value;
  bool get readEpic => map["readEpic"] as bool;
  set readEpic(bool value) => map["readEpic"] = value;
  bool get readEpicIid => map["readEpicIid"] as bool;
  set readEpicIid(bool value) => map["readEpicIid"] = value;
  bool get updateEpic => map["updateEpic"] as bool;
  set updateEpic(bool value) => map["updateEpic"] = value;
  static EpicPermissions fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return EpicPermissions()..map = map;
  }

  EpicPermissions clone() =>
      EpicPermissions.fromMap(toJson() as Map<String, dynamic>, true);
}

class Epic extends MapObject {
  User get author {
    if (map['author'] is User) return map['author'] as User;
    return map['author'] = User.fromMap(map['author'] as Map<String, dynamic>);
  }

  set author(User value) => map["author"] = value;
  EpicConnection get children {
    if (map['children'] is EpicConnection)
      return map['children'] as EpicConnection;
    return map['children'] =
        EpicConnection.fromMap(map['children'] as Map<String, dynamic>);
  }

  set children(EpicConnection value) => map["children"] = value;
  dynamic get closedAt => map["closedAt"] as dynamic;
  set closedAt(dynamic value) => map["closedAt"] = value;
  dynamic get createdAt => map["createdAt"] as dynamic;
  set createdAt(dynamic value) => map["createdAt"] = value;
  String get description => map["description"] as String;
  set description(String value) => map["description"] = value;
  DiscussionConnection get discussions {
    if (map['discussions'] is DiscussionConnection)
      return map['discussions'] as DiscussionConnection;
    return map['discussions'] = DiscussionConnection.fromMap(
        map['discussions'] as Map<String, dynamic>);
  }

  set discussions(DiscussionConnection value) => map["discussions"] = value;
  dynamic get dueDate => map["dueDate"] as dynamic;
  set dueDate(dynamic value) => map["dueDate"] = value;
  dynamic get dueDateFixed => map["dueDateFixed"] as dynamic;
  set dueDateFixed(dynamic value) => map["dueDateFixed"] = value;
  dynamic get dueDateFromMilestones => map["dueDateFromMilestones"] as dynamic;
  set dueDateFromMilestones(dynamic value) =>
      map["dueDateFromMilestones"] = value;
  bool get dueDateIsFixed => map["dueDateIsFixed"] as bool;
  set dueDateIsFixed(bool value) => map["dueDateIsFixed"] = value;
  Group get group {
    if (map['group'] is Group) return map['group'] as Group;
    return map['group'] = Group.fromMap(map['group'] as Map<String, dynamic>);
  }

  set group(Group value) => map["group"] = value;
  bool get hasChildren => map["hasChildren"] as bool;
  set hasChildren(bool value) => map["hasChildren"] = value;
  bool get hasIssues => map["hasIssues"] as bool;
  set hasIssues(bool value) => map["hasIssues"] = value;
  String get id => map["id"] as String;
  set id(String value) => map["id"] = value;
  String get iid => map["iid"] as String;
  set iid(String value) => map["iid"] = value;
  EpicIssueConnection get issues {
    if (map['issues'] is EpicIssueConnection)
      return map['issues'] as EpicIssueConnection;
    return map['issues'] =
        EpicIssueConnection.fromMap(map['issues'] as Map<String, dynamic>);
  }

  set issues(EpicIssueConnection value) => map["issues"] = value;
  NoteConnection get notes {
    if (map['notes'] is NoteConnection) return map['notes'] as NoteConnection;
    return map['notes'] =
        NoteConnection.fromMap(map['notes'] as Map<String, dynamic>);
  }

  set notes(NoteConnection value) => map["notes"] = value;
  Epic get parent {
    if (map['parent'] is Epic) return map['parent'] as Epic;
    return map['parent'] = Epic.fromMap(map['parent'] as Map<String, dynamic>);
  }

  set parent(Epic value) => map["parent"] = value;
  String get reference => map["reference"] as String;
  set reference(String value) => map["reference"] = value;
  String get relationPath => map["relationPath"] as String;
  set relationPath(String value) => map["relationPath"] = value;
  dynamic get startDate => map["startDate"] as dynamic;
  set startDate(dynamic value) => map["startDate"] = value;
  dynamic get startDateFixed => map["startDateFixed"] as dynamic;
  set startDateFixed(dynamic value) => map["startDateFixed"] = value;
  dynamic get startDateFromMilestones =>
      map["startDateFromMilestones"] as dynamic;
  set startDateFromMilestones(dynamic value) =>
      map["startDateFromMilestones"] = value;
  bool get startDateIsFixed => map["startDateIsFixed"] as bool;
  set startDateIsFixed(bool value) => map["startDateIsFixed"] = value;
  EpicState get state => parseEpicState(map["state"] as String);
  set state(EpicState value) => map["state"] = toEpicStateString(value);
  String get title => map["title"] as String;
  set title(String value) => map["title"] = value;
  dynamic get updatedAt => map["updatedAt"] as dynamic;
  set updatedAt(dynamic value) => map["updatedAt"] = value;
  EpicPermissions get userPermissions {
    if (map['userPermissions'] is EpicPermissions)
      return map['userPermissions'] as EpicPermissions;
    return map['userPermissions'] =
        EpicPermissions.fromMap(map['userPermissions'] as Map<String, dynamic>);
  }

  set userPermissions(EpicPermissions value) => map["userPermissions"] = value;
  String get webPath => map["webPath"] as String;
  set webPath(String value) => map["webPath"] = value;
  String get webUrl => map["webUrl"] as String;
  set webUrl(String value) => map["webUrl"] = value;
  static Epic fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return Epic()..map = map;
  }

  Epic clone() => Epic.fromMap(toJson() as Map<String, dynamic>, true);
}

class ProjectEdge extends MapObject {
  String get cursor => map["cursor"] as String;
  set cursor(String value) => map["cursor"] = value;
  Project get node {
    if (map['node'] is Project) return map['node'] as Project;
    return map['node'] = Project.fromMap(map['node'] as Map<String, dynamic>);
  }

  set node(Project value) => map["node"] = value;
  static ProjectEdge fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return ProjectEdge()..map = map;
  }

  ProjectEdge clone() =>
      ProjectEdge.fromMap(toJson() as Map<String, dynamic>, true);
}

class ProjectConnection extends MapObject {
  List<ProjectEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<ProjectEdge>)
      return map['edges'] as List<ProjectEdge>;

    List<ProjectEdge> items = [];
    for (dynamic aVar in map['edges'])
      items.add(ProjectEdge.fromMap(aVar as Map<String, dynamic>));

    return map['edges'] = items;
  }

  set edges(List<ProjectEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'] as PageInfo;
    return map['pageInfo'] =
        PageInfo.fromMap(map['pageInfo'] as Map<String, dynamic>);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static ProjectConnection fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return ProjectConnection()..map = map;
  }

  ProjectConnection clone() =>
      ProjectConnection.fromMap(toJson() as Map<String, dynamic>, true);
}

class RootStorageStatistics extends MapObject {
  int get buildArtifactsSize => map["buildArtifactsSize"] as int;
  set buildArtifactsSize(int value) => map["buildArtifactsSize"] = value;
  int get lfsObjectsSize => map["lfsObjectsSize"] as int;
  set lfsObjectsSize(int value) => map["lfsObjectsSize"] = value;
  int get packagesSize => map["packagesSize"] as int;
  set packagesSize(int value) => map["packagesSize"] = value;
  int get repositorySize => map["repositorySize"] as int;
  set repositorySize(int value) => map["repositorySize"] = value;
  int get storageSize => map["storageSize"] as int;
  set storageSize(int value) => map["storageSize"] = value;
  int get wikiSize => map["wikiSize"] as int;
  set wikiSize(int value) => map["wikiSize"] = value;
  static RootStorageStatistics fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return RootStorageStatistics()..map = map;
  }

  RootStorageStatistics clone() =>
      RootStorageStatistics.fromMap(toJson() as Map<String, dynamic>, true);
}

class GroupPermissions extends MapObject {
  bool get readGroup => map["readGroup"] as bool;
  set readGroup(bool value) => map["readGroup"] = value;
  static GroupPermissions fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return GroupPermissions()..map = map;
  }

  GroupPermissions clone() =>
      GroupPermissions.fromMap(toJson() as Map<String, dynamic>, true);
}

class Group extends MapObject {
  String get avatarUrl => map["avatarUrl"] as String;
  set avatarUrl(String value) => map["avatarUrl"] = value;
  String get description => map["description"] as String;
  set description(String value) => map["description"] = value;
  String get descriptionHtml => map["descriptionHtml"] as String;
  set descriptionHtml(String value) => map["descriptionHtml"] = value;
  Epic get epic {
    if (map['epic'] is Epic) return map['epic'] as Epic;
    return map['epic'] = Epic.fromMap(map['epic'] as Map<String, dynamic>);
  }

  set epic(Epic value) => map["epic"] = value;
  EpicConnection get epics {
    if (map['epics'] is EpicConnection) return map['epics'] as EpicConnection;
    return map['epics'] =
        EpicConnection.fromMap(map['epics'] as Map<String, dynamic>);
  }

  set epics(EpicConnection value) => map["epics"] = value;
  bool get epicsEnabled => map["epicsEnabled"] as bool;
  set epicsEnabled(bool value) => map["epicsEnabled"] = value;
  String get fullName => map["fullName"] as String;
  set fullName(String value) => map["fullName"] = value;
  String get fullPath => map["fullPath"] as String;
  set fullPath(String value) => map["fullPath"] = value;
  String get id => map["id"] as String;
  set id(String value) => map["id"] = value;
  bool get lfsEnabled => map["lfsEnabled"] as bool;
  set lfsEnabled(bool value) => map["lfsEnabled"] = value;
  String get name => map["name"] as String;
  set name(String value) => map["name"] = value;
  Group get parent {
    if (map['parent'] is Group) return map['parent'] as Group;
    return map['parent'] = Group.fromMap(map['parent'] as Map<String, dynamic>);
  }

  set parent(Group value) => map["parent"] = value;
  String get path => map["path"] as String;
  set path(String value) => map["path"] = value;
  ProjectConnection get projects {
    if (map['projects'] is ProjectConnection)
      return map['projects'] as ProjectConnection;
    return map['projects'] =
        ProjectConnection.fromMap(map['projects'] as Map<String, dynamic>);
  }

  set projects(ProjectConnection value) => map["projects"] = value;
  bool get requestAccessEnabled => map["requestAccessEnabled"] as bool;
  set requestAccessEnabled(bool value) => map["requestAccessEnabled"] = value;
  RootStorageStatistics get rootStorageStatistics {
    if (map['rootStorageStatistics'] is RootStorageStatistics)
      return map['rootStorageStatistics'] as RootStorageStatistics;
    return map['rootStorageStatistics'] = RootStorageStatistics.fromMap(
        map['rootStorageStatistics'] as Map<String, dynamic>);
  }

  set rootStorageStatistics(RootStorageStatistics value) =>
      map["rootStorageStatistics"] = value;
  GroupPermissions get userPermissions {
    if (map['userPermissions'] is GroupPermissions)
      return map['userPermissions'] as GroupPermissions;
    return map['userPermissions'] = GroupPermissions.fromMap(
        map['userPermissions'] as Map<String, dynamic>);
  }

  set userPermissions(GroupPermissions value) => map["userPermissions"] = value;
  String get visibility => map["visibility"] as String;
  set visibility(String value) => map["visibility"] = value;
  String get webUrl => map["webUrl"] as String;
  set webUrl(String value) => map["webUrl"] = value;
  static Group fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return Group()..map = map;
  }

  Group clone() => Group.fromMap(toJson() as Map<String, dynamic>, true);
}

class IssueEdge extends MapObject {
  String get cursor => map["cursor"] as String;
  set cursor(String value) => map["cursor"] = value;
  Issue get node {
    if (map['node'] is Issue) return map['node'] as Issue;
    return map['node'] = Issue.fromMap(map['node'] as Map<String, dynamic>);
  }

  set node(Issue value) => map["node"] = value;
  static IssueEdge fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return IssueEdge()..map = map;
  }

  IssueEdge clone() =>
      IssueEdge.fromMap(toJson() as Map<String, dynamic>, true);
}

class IssueConnection extends MapObject {
  List<IssueEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<IssueEdge>)
      return map['edges'] as List<IssueEdge>;

    List<IssueEdge> items = [];
    for (dynamic aVar in map['edges'])
      items.add(IssueEdge.fromMap(aVar as Map<String, dynamic>));

    return map['edges'] = items;
  }

  set edges(List<IssueEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'] as PageInfo;
    return map['pageInfo'] =
        PageInfo.fromMap(map['pageInfo'] as Map<String, dynamic>);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static IssueConnection fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return IssueConnection()..map = map;
  }

  IssueConnection clone() =>
      IssueConnection.fromMap(toJson() as Map<String, dynamic>, true);
}

class DetailedStatus extends MapObject {
  String get detailsPath => map["detailsPath"] as String;
  set detailsPath(String value) => map["detailsPath"] = value;
  String get favicon => map["favicon"] as String;
  set favicon(String value) => map["favicon"] = value;
  String get group => map["group"] as String;
  set group(String value) => map["group"] = value;
  bool get hasDetails => map["hasDetails"] as bool;
  set hasDetails(bool value) => map["hasDetails"] = value;
  String get icon => map["icon"] as String;
  set icon(String value) => map["icon"] = value;
  String get label => map["label"] as String;
  set label(String value) => map["label"] = value;
  String get text => map["text"] as String;
  set text(String value) => map["text"] = value;
  String get tooltip => map["tooltip"] as String;
  set tooltip(String value) => map["tooltip"] = value;
  static DetailedStatus fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return DetailedStatus()..map = map;
  }

  DetailedStatus clone() =>
      DetailedStatus.fromMap(toJson() as Map<String, dynamic>, true);
}

enum PipelineStatusEnum {
  CREATED,
  PREPARING,
  PENDING,
  RUNNING,
  FAILED,
  SUCCESS,
  CANCELED,
  SKIPPED,
  MANUAL,
  SCHEDULED
}
Map<String, PipelineStatusEnum> _mapNamesForPipelineStatusEnum = {
  "created": PipelineStatusEnum.CREATED,
  "preparing": PipelineStatusEnum.PREPARING,
  "pending": PipelineStatusEnum.PENDING,
  "running": PipelineStatusEnum.RUNNING,
  "failed": PipelineStatusEnum.FAILED,
  "success": PipelineStatusEnum.SUCCESS,
  "canceled": PipelineStatusEnum.CANCELED,
  "skipped": PipelineStatusEnum.SKIPPED,
  "manual": PipelineStatusEnum.MANUAL,
  "scheduled": PipelineStatusEnum.SCHEDULED
};
PipelineStatusEnum parsePipelineStatusEnum(String value) =>
    value != null && value != ""
        ? _mapNamesForPipelineStatusEnum[value.toLowerCase()]
        : null;
String toPipelineStatusEnumString(PipelineStatusEnum value) =>
    value?.toString()?.split(".")?.last;

class PipelinePermissions extends MapObject {
  bool get adminPipeline => map["adminPipeline"] as bool;
  set adminPipeline(bool value) => map["adminPipeline"] = value;
  bool get destroyPipeline => map["destroyPipeline"] as bool;
  set destroyPipeline(bool value) => map["destroyPipeline"] = value;
  bool get updatePipeline => map["updatePipeline"] as bool;
  set updatePipeline(bool value) => map["updatePipeline"] = value;
  static PipelinePermissions fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return PipelinePermissions()..map = map;
  }

  PipelinePermissions clone() =>
      PipelinePermissions.fromMap(toJson() as Map<String, dynamic>, true);
}

class Pipeline extends MapObject {
  String get beforeSha => map["beforeSha"] as String;
  set beforeSha(String value) => map["beforeSha"] = value;
  dynamic get committedAt => map["committedAt"] as dynamic;
  set committedAt(dynamic value) => map["committedAt"] = value;
  double get coverage => map["coverage"] as double;
  set coverage(double value) => map["coverage"] = value;
  dynamic get createdAt => map["createdAt"] as dynamic;
  set createdAt(dynamic value) => map["createdAt"] = value;
  DetailedStatus get detailedStatus {
    if (map['detailedStatus'] is DetailedStatus)
      return map['detailedStatus'] as DetailedStatus;
    return map['detailedStatus'] =
        DetailedStatus.fromMap(map['detailedStatus'] as Map<String, dynamic>);
  }

  set detailedStatus(DetailedStatus value) => map["detailedStatus"] = value;
  int get duration => map["duration"] as int;
  set duration(int value) => map["duration"] = value;
  dynamic get finishedAt => map["finishedAt"] as dynamic;
  set finishedAt(dynamic value) => map["finishedAt"] = value;
  String get id => map["id"] as String;
  set id(String value) => map["id"] = value;
  String get iid => map["iid"] as String;
  set iid(String value) => map["iid"] = value;
  String get sha => map["sha"] as String;
  set sha(String value) => map["sha"] = value;
  dynamic get startedAt => map["startedAt"] as dynamic;
  set startedAt(dynamic value) => map["startedAt"] = value;
  PipelineStatusEnum get status =>
      parsePipelineStatusEnum(map["status"] as String);
  set status(PipelineStatusEnum value) =>
      map["status"] = toPipelineStatusEnumString(value);
  dynamic get updatedAt => map["updatedAt"] as dynamic;
  set updatedAt(dynamic value) => map["updatedAt"] = value;
  PipelinePermissions get userPermissions {
    if (map['userPermissions'] is PipelinePermissions)
      return map['userPermissions'] as PipelinePermissions;
    return map['userPermissions'] = PipelinePermissions.fromMap(
        map['userPermissions'] as Map<String, dynamic>);
  }

  set userPermissions(PipelinePermissions value) =>
      map["userPermissions"] = value;
  static Pipeline fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return Pipeline()..map = map;
  }

  Pipeline clone() => Pipeline.fromMap(toJson() as Map<String, dynamic>, true);
}

class PipelineEdge extends MapObject {
  String get cursor => map["cursor"] as String;
  set cursor(String value) => map["cursor"] = value;
  Pipeline get node {
    if (map['node'] is Pipeline) return map['node'] as Pipeline;
    return map['node'] = Pipeline.fromMap(map['node'] as Map<String, dynamic>);
  }

  set node(Pipeline value) => map["node"] = value;
  static PipelineEdge fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return PipelineEdge()..map = map;
  }

  PipelineEdge clone() =>
      PipelineEdge.fromMap(toJson() as Map<String, dynamic>, true);
}

class PipelineConnection extends MapObject {
  List<PipelineEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<PipelineEdge>)
      return map['edges'] as List<PipelineEdge>;

    List<PipelineEdge> items = [];
    for (dynamic aVar in map['edges'])
      items.add(PipelineEdge.fromMap(aVar as Map<String, dynamic>));

    return map['edges'] = items;
  }

  set edges(List<PipelineEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'] as PageInfo;
    return map['pageInfo'] =
        PageInfo.fromMap(map['pageInfo'] as Map<String, dynamic>);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static PipelineConnection fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return PipelineConnection()..map = map;
  }

  PipelineConnection clone() =>
      PipelineConnection.fromMap(toJson() as Map<String, dynamic>, true);
}

enum MergeRequestState { opened, closed, locked, merged }
Map<String, MergeRequestState> _mapNamesForMergeRequestState = {
  "opened": MergeRequestState.opened,
  "closed": MergeRequestState.closed,
  "locked": MergeRequestState.locked,
  "merged": MergeRequestState.merged
};
MergeRequestState parseMergeRequestState(String value) =>
    value != null && value != ""
        ? _mapNamesForMergeRequestState[value.toLowerCase()]
        : null;
String toMergeRequestStateString(MergeRequestState value) =>
    value?.toString()?.split(".")?.last;

class MergeRequestPermissions extends MapObject {
  bool get adminMergeRequest => map["adminMergeRequest"] as bool;
  set adminMergeRequest(bool value) => map["adminMergeRequest"] = value;
  bool get cherryPickOnCurrentMergeRequest =>
      map["cherryPickOnCurrentMergeRequest"] as bool;
  set cherryPickOnCurrentMergeRequest(bool value) =>
      map["cherryPickOnCurrentMergeRequest"] = value;
  bool get createNote => map["createNote"] as bool;
  set createNote(bool value) => map["createNote"] = value;
  bool get pushToSourceBranch => map["pushToSourceBranch"] as bool;
  set pushToSourceBranch(bool value) => map["pushToSourceBranch"] = value;
  bool get readMergeRequest => map["readMergeRequest"] as bool;
  set readMergeRequest(bool value) => map["readMergeRequest"] = value;
  bool get removeSourceBranch => map["removeSourceBranch"] as bool;
  set removeSourceBranch(bool value) => map["removeSourceBranch"] = value;
  bool get revertOnCurrentMergeRequest =>
      map["revertOnCurrentMergeRequest"] as bool;
  set revertOnCurrentMergeRequest(bool value) =>
      map["revertOnCurrentMergeRequest"] = value;
  bool get updateMergeRequest => map["updateMergeRequest"] as bool;
  set updateMergeRequest(bool value) => map["updateMergeRequest"] = value;
  static MergeRequestPermissions fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return MergeRequestPermissions()..map = map;
  }

  MergeRequestPermissions clone() =>
      MergeRequestPermissions.fromMap(toJson() as Map<String, dynamic>, true);
}

class MergeRequest extends MapObject {
  bool get allowCollaboration => map["allowCollaboration"] as bool;
  set allowCollaboration(bool value) => map["allowCollaboration"] = value;
  dynamic get createdAt => map["createdAt"] as dynamic;
  set createdAt(dynamic value) => map["createdAt"] = value;
  String get defaultMergeCommitMessage =>
      map["defaultMergeCommitMessage"] as String;
  set defaultMergeCommitMessage(String value) =>
      map["defaultMergeCommitMessage"] = value;
  String get description => map["description"] as String;
  set description(String value) => map["description"] = value;
  String get descriptionHtml => map["descriptionHtml"] as String;
  set descriptionHtml(String value) => map["descriptionHtml"] = value;
  String get diffHeadSha => map["diffHeadSha"] as String;
  set diffHeadSha(String value) => map["diffHeadSha"] = value;
  DiffRefs get diffRefs {
    if (map['diffRefs'] is DiffRefs) return map['diffRefs'] as DiffRefs;
    return map['diffRefs'] =
        DiffRefs.fromMap(map['diffRefs'] as Map<String, dynamic>);
  }

  set diffRefs(DiffRefs value) => map["diffRefs"] = value;
  DiscussionConnection get discussions {
    if (map['discussions'] is DiscussionConnection)
      return map['discussions'] as DiscussionConnection;
    return map['discussions'] = DiscussionConnection.fromMap(
        map['discussions'] as Map<String, dynamic>);
  }

  set discussions(DiscussionConnection value) => map["discussions"] = value;
  int get downvotes => map["downvotes"] as int;
  set downvotes(int value) => map["downvotes"] = value;
  bool get forceRemoveSourceBranch => map["forceRemoveSourceBranch"] as bool;
  set forceRemoveSourceBranch(bool value) =>
      map["forceRemoveSourceBranch"] = value;
  Pipeline get headPipeline {
    if (map['headPipeline'] is Pipeline) return map['headPipeline'] as Pipeline;
    return map['headPipeline'] =
        Pipeline.fromMap(map['headPipeline'] as Map<String, dynamic>);
  }

  set headPipeline(Pipeline value) => map["headPipeline"] = value;
  String get id => map["id"] as String;
  set id(String value) => map["id"] = value;
  String get iid => map["iid"] as String;
  set iid(String value) => map["iid"] = value;
  String get inProgressMergeCommitSha =>
      map["inProgressMergeCommitSha"] as String;
  set inProgressMergeCommitSha(String value) =>
      map["inProgressMergeCommitSha"] = value;
  String get mergeCommitMessage => map["mergeCommitMessage"] as String;
  set mergeCommitMessage(String value) => map["mergeCommitMessage"] = value;
  String get mergeCommitSha => map["mergeCommitSha"] as String;
  set mergeCommitSha(String value) => map["mergeCommitSha"] = value;
  String get mergeError => map["mergeError"] as String;
  set mergeError(String value) => map["mergeError"] = value;
  bool get mergeOngoing => map["mergeOngoing"] as bool;
  set mergeOngoing(bool value) => map["mergeOngoing"] = value;
  String get mergeStatus => map["mergeStatus"] as String;
  set mergeStatus(String value) => map["mergeStatus"] = value;
  bool get mergeWhenPipelineSucceeds =>
      map["mergeWhenPipelineSucceeds"] as bool;
  set mergeWhenPipelineSucceeds(bool value) =>
      map["mergeWhenPipelineSucceeds"] = value;
  bool get mergeableDiscussionsState =>
      map["mergeableDiscussionsState"] as bool;
  set mergeableDiscussionsState(bool value) =>
      map["mergeableDiscussionsState"] = value;
  NoteConnection get notes {
    if (map['notes'] is NoteConnection) return map['notes'] as NoteConnection;
    return map['notes'] =
        NoteConnection.fromMap(map['notes'] as Map<String, dynamic>);
  }

  set notes(NoteConnection value) => map["notes"] = value;
  PipelineConnection get pipelines {
    if (map['pipelines'] is PipelineConnection)
      return map['pipelines'] as PipelineConnection;
    return map['pipelines'] =
        PipelineConnection.fromMap(map['pipelines'] as Map<String, dynamic>);
  }

  set pipelines(PipelineConnection value) => map["pipelines"] = value;
  Project get project {
    if (map['project'] is Project) return map['project'] as Project;
    return map['project'] =
        Project.fromMap(map['project'] as Map<String, dynamic>);
  }

  set project(Project value) => map["project"] = value;
  int get projectId => map["projectId"] as int;
  set projectId(int value) => map["projectId"] = value;
  String get rebaseCommitSha => map["rebaseCommitSha"] as String;
  set rebaseCommitSha(String value) => map["rebaseCommitSha"] = value;
  bool get rebaseInProgress => map["rebaseInProgress"] as bool;
  set rebaseInProgress(bool value) => map["rebaseInProgress"] = value;
  bool get shouldBeRebased => map["shouldBeRebased"] as bool;
  set shouldBeRebased(bool value) => map["shouldBeRebased"] = value;
  bool get shouldRemoveSourceBranch => map["shouldRemoveSourceBranch"] as bool;
  set shouldRemoveSourceBranch(bool value) =>
      map["shouldRemoveSourceBranch"] = value;
  String get sourceBranch => map["sourceBranch"] as String;
  set sourceBranch(String value) => map["sourceBranch"] = value;
  bool get sourceBranchExists => map["sourceBranchExists"] as bool;
  set sourceBranchExists(bool value) => map["sourceBranchExists"] = value;
  Project get sourceProject {
    if (map['sourceProject'] is Project) return map['sourceProject'] as Project;
    return map['sourceProject'] =
        Project.fromMap(map['sourceProject'] as Map<String, dynamic>);
  }

  set sourceProject(Project value) => map["sourceProject"] = value;
  int get sourceProjectId => map["sourceProjectId"] as int;
  set sourceProjectId(int value) => map["sourceProjectId"] = value;
  MergeRequestState get state => parseMergeRequestState(map["state"] as String);
  set state(MergeRequestState value) =>
      map["state"] = toMergeRequestStateString(value);
  bool get subscribed => map["subscribed"] as bool;
  set subscribed(bool value) => map["subscribed"] = value;
  String get targetBranch => map["targetBranch"] as String;
  set targetBranch(String value) => map["targetBranch"] = value;
  Project get targetProject {
    if (map['targetProject'] is Project) return map['targetProject'] as Project;
    return map['targetProject'] =
        Project.fromMap(map['targetProject'] as Map<String, dynamic>);
  }

  set targetProject(Project value) => map["targetProject"] = value;
  int get targetProjectId => map["targetProjectId"] as int;
  set targetProjectId(int value) => map["targetProjectId"] = value;
  TaskCompletionStatus get taskCompletionStatus {
    if (map['taskCompletionStatus'] is TaskCompletionStatus)
      return map['taskCompletionStatus'] as TaskCompletionStatus;
    return map['taskCompletionStatus'] = TaskCompletionStatus.fromMap(
        map['taskCompletionStatus'] as Map<String, dynamic>);
  }

  set taskCompletionStatus(TaskCompletionStatus value) =>
      map["taskCompletionStatus"] = value;
  String get title => map["title"] as String;
  set title(String value) => map["title"] = value;
  String get titleHtml => map["titleHtml"] as String;
  set titleHtml(String value) => map["titleHtml"] = value;
  dynamic get updatedAt => map["updatedAt"] as dynamic;
  set updatedAt(dynamic value) => map["updatedAt"] = value;
  int get upvotes => map["upvotes"] as int;
  set upvotes(int value) => map["upvotes"] = value;
  int get userNotesCount => map["userNotesCount"] as int;
  set userNotesCount(int value) => map["userNotesCount"] = value;
  MergeRequestPermissions get userPermissions {
    if (map['userPermissions'] is MergeRequestPermissions)
      return map['userPermissions'] as MergeRequestPermissions;
    return map['userPermissions'] = MergeRequestPermissions.fromMap(
        map['userPermissions'] as Map<String, dynamic>);
  }

  set userPermissions(MergeRequestPermissions value) =>
      map["userPermissions"] = value;
  String get webUrl => map["webUrl"] as String;
  set webUrl(String value) => map["webUrl"] = value;
  bool get workInProgress => map["workInProgress"] as bool;
  set workInProgress(bool value) => map["workInProgress"] = value;
  static MergeRequest fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return MergeRequest()..map = map;
  }

  MergeRequest clone() =>
      MergeRequest.fromMap(toJson() as Map<String, dynamic>, true);
}

class MergeRequestEdge extends MapObject {
  String get cursor => map["cursor"] as String;
  set cursor(String value) => map["cursor"] = value;
  MergeRequest get node {
    if (map['node'] is MergeRequest) return map['node'] as MergeRequest;
    return map['node'] =
        MergeRequest.fromMap(map['node'] as Map<String, dynamic>);
  }

  set node(MergeRequest value) => map["node"] = value;
  static MergeRequestEdge fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return MergeRequestEdge()..map = map;
  }

  MergeRequestEdge clone() =>
      MergeRequestEdge.fromMap(toJson() as Map<String, dynamic>, true);
}

class MergeRequestConnection extends MapObject {
  List<MergeRequestEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<MergeRequestEdge>)
      return map['edges'] as List<MergeRequestEdge>;

    List<MergeRequestEdge> items = [];
    for (dynamic aVar in map['edges'])
      items.add(MergeRequestEdge.fromMap(aVar as Map<String, dynamic>));

    return map['edges'] = items;
  }

  set edges(List<MergeRequestEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'] as PageInfo;
    return map['pageInfo'] =
        PageInfo.fromMap(map['pageInfo'] as Map<String, dynamic>);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static MergeRequestConnection fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return MergeRequestConnection()..map = map;
  }

  MergeRequestConnection clone() =>
      MergeRequestConnection.fromMap(toJson() as Map<String, dynamic>, true);
}

class Namespace extends MapObject {
  String get description => map["description"] as String;
  set description(String value) => map["description"] = value;
  String get descriptionHtml => map["descriptionHtml"] as String;
  set descriptionHtml(String value) => map["descriptionHtml"] = value;
  String get fullName => map["fullName"] as String;
  set fullName(String value) => map["fullName"] = value;
  String get fullPath => map["fullPath"] as String;
  set fullPath(String value) => map["fullPath"] = value;
  String get id => map["id"] as String;
  set id(String value) => map["id"] = value;
  bool get lfsEnabled => map["lfsEnabled"] as bool;
  set lfsEnabled(bool value) => map["lfsEnabled"] = value;
  String get name => map["name"] as String;
  set name(String value) => map["name"] = value;
  String get path => map["path"] as String;
  set path(String value) => map["path"] = value;
  ProjectConnection get projects {
    if (map['projects'] is ProjectConnection)
      return map['projects'] as ProjectConnection;
    return map['projects'] =
        ProjectConnection.fromMap(map['projects'] as Map<String, dynamic>);
  }

  set projects(ProjectConnection value) => map["projects"] = value;
  bool get requestAccessEnabled => map["requestAccessEnabled"] as bool;
  set requestAccessEnabled(bool value) => map["requestAccessEnabled"] = value;
  RootStorageStatistics get rootStorageStatistics {
    if (map['rootStorageStatistics'] is RootStorageStatistics)
      return map['rootStorageStatistics'] as RootStorageStatistics;
    return map['rootStorageStatistics'] = RootStorageStatistics.fromMap(
        map['rootStorageStatistics'] as Map<String, dynamic>);
  }

  set rootStorageStatistics(RootStorageStatistics value) =>
      map["rootStorageStatistics"] = value;
  String get visibility => map["visibility"] as String;
  set visibility(String value) => map["visibility"] = value;
  static Namespace fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return Namespace()..map = map;
  }

  Namespace clone() =>
      Namespace.fromMap(toJson() as Map<String, dynamic>, true);
}

enum EntryType { tree, blob, commit }
Map<String, EntryType> _mapNamesForEntryType = {
  "tree": EntryType.tree,
  "blob": EntryType.blob,
  "commit": EntryType.commit
};
EntryType parseEntryType(String value) => value != null && value != ""
    ? _mapNamesForEntryType[value.toLowerCase()]
    : null;
String toEntryTypeString(EntryType value) =>
    value?.toString()?.split(".")?.last;

class Blob extends MapObject {
  String get flatPath => map["flatPath"] as String;
  set flatPath(String value) => map["flatPath"] = value;
  String get id => map["id"] as String;
  set id(String value) => map["id"] = value;
  String get lfsOid => map["lfsOid"] as String;
  set lfsOid(String value) => map["lfsOid"] = value;
  String get name => map["name"] as String;
  set name(String value) => map["name"] = value;
  String get path => map["path"] as String;
  set path(String value) => map["path"] = value;
  EntryType get type => parseEntryType(map["type"] as String);
  set type(EntryType value) => map["type"] = toEntryTypeString(value);
  String get webUrl => map["webUrl"] as String;
  set webUrl(String value) => map["webUrl"] = value;
  static Blob fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return Blob()..map = map;
  }

  Blob clone() => Blob.fromMap(toJson() as Map<String, dynamic>, true);
}

class BlobEdge extends MapObject {
  String get cursor => map["cursor"] as String;
  set cursor(String value) => map["cursor"] = value;
  Blob get node {
    if (map['node'] is Blob) return map['node'] as Blob;
    return map['node'] = Blob.fromMap(map['node'] as Map<String, dynamic>);
  }

  set node(Blob value) => map["node"] = value;
  static BlobEdge fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return BlobEdge()..map = map;
  }

  BlobEdge clone() => BlobEdge.fromMap(toJson() as Map<String, dynamic>, true);
}

class BlobConnection extends MapObject {
  List<BlobEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<BlobEdge>)
      return map['edges'] as List<BlobEdge>;

    List<BlobEdge> items = [];
    for (dynamic aVar in map['edges'])
      items.add(BlobEdge.fromMap(aVar as Map<String, dynamic>));

    return map['edges'] = items;
  }

  set edges(List<BlobEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'] as PageInfo;
    return map['pageInfo'] =
        PageInfo.fromMap(map['pageInfo'] as Map<String, dynamic>);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static BlobConnection fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return BlobConnection()..map = map;
  }

  BlobConnection clone() =>
      BlobConnection.fromMap(toJson() as Map<String, dynamic>, true);
}

class Commit extends MapObject {
  User get author {
    if (map['author'] is User) return map['author'] as User;
    return map['author'] = User.fromMap(map['author'] as Map<String, dynamic>);
  }

  set author(User value) => map["author"] = value;
  dynamic get authoredDate => map["authoredDate"] as dynamic;
  set authoredDate(dynamic value) => map["authoredDate"] = value;
  String get description => map["description"] as String;
  set description(String value) => map["description"] = value;
  String get id => map["id"] as String;
  set id(String value) => map["id"] = value;
  Pipeline get latestPipeline {
    if (map['latestPipeline'] is Pipeline)
      return map['latestPipeline'] as Pipeline;
    return map['latestPipeline'] =
        Pipeline.fromMap(map['latestPipeline'] as Map<String, dynamic>);
  }

  set latestPipeline(Pipeline value) => map["latestPipeline"] = value;
  String get message => map["message"] as String;
  set message(String value) => map["message"] = value;
  String get sha => map["sha"] as String;
  set sha(String value) => map["sha"] = value;
  String get title => map["title"] as String;
  set title(String value) => map["title"] = value;
  String get webUrl => map["webUrl"] as String;
  set webUrl(String value) => map["webUrl"] = value;
  static Commit fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return Commit()..map = map;
  }

  Commit clone() => Commit.fromMap(toJson() as Map<String, dynamic>, true);
}

class Submodule extends MapObject {
  String get flatPath => map["flatPath"] as String;
  set flatPath(String value) => map["flatPath"] = value;
  String get id => map["id"] as String;
  set id(String value) => map["id"] = value;
  String get name => map["name"] as String;
  set name(String value) => map["name"] = value;
  String get path => map["path"] as String;
  set path(String value) => map["path"] = value;
  String get treeUrl => map["treeUrl"] as String;
  set treeUrl(String value) => map["treeUrl"] = value;
  EntryType get type => parseEntryType(map["type"] as String);
  set type(EntryType value) => map["type"] = toEntryTypeString(value);
  String get webUrl => map["webUrl"] as String;
  set webUrl(String value) => map["webUrl"] = value;
  static Submodule fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return Submodule()..map = map;
  }

  Submodule clone() =>
      Submodule.fromMap(toJson() as Map<String, dynamic>, true);
}

class SubmoduleEdge extends MapObject {
  String get cursor => map["cursor"] as String;
  set cursor(String value) => map["cursor"] = value;
  Submodule get node {
    if (map['node'] is Submodule) return map['node'] as Submodule;
    return map['node'] = Submodule.fromMap(map['node'] as Map<String, dynamic>);
  }

  set node(Submodule value) => map["node"] = value;
  static SubmoduleEdge fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return SubmoduleEdge()..map = map;
  }

  SubmoduleEdge clone() =>
      SubmoduleEdge.fromMap(toJson() as Map<String, dynamic>, true);
}

class SubmoduleConnection extends MapObject {
  List<SubmoduleEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<SubmoduleEdge>)
      return map['edges'] as List<SubmoduleEdge>;

    List<SubmoduleEdge> items = [];
    for (dynamic aVar in map['edges'])
      items.add(SubmoduleEdge.fromMap(aVar as Map<String, dynamic>));

    return map['edges'] = items;
  }

  set edges(List<SubmoduleEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'] as PageInfo;
    return map['pageInfo'] =
        PageInfo.fromMap(map['pageInfo'] as Map<String, dynamic>);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static SubmoduleConnection fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return SubmoduleConnection()..map = map;
  }

  SubmoduleConnection clone() =>
      SubmoduleConnection.fromMap(toJson() as Map<String, dynamic>, true);
}

class TreeEntry extends MapObject {
  String get flatPath => map["flatPath"] as String;
  set flatPath(String value) => map["flatPath"] = value;
  String get id => map["id"] as String;
  set id(String value) => map["id"] = value;
  String get name => map["name"] as String;
  set name(String value) => map["name"] = value;
  String get path => map["path"] as String;
  set path(String value) => map["path"] = value;
  EntryType get type => parseEntryType(map["type"] as String);
  set type(EntryType value) => map["type"] = toEntryTypeString(value);
  String get webUrl => map["webUrl"] as String;
  set webUrl(String value) => map["webUrl"] = value;
  static TreeEntry fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return TreeEntry()..map = map;
  }

  TreeEntry clone() =>
      TreeEntry.fromMap(toJson() as Map<String, dynamic>, true);
}

class TreeEntryEdge extends MapObject {
  String get cursor => map["cursor"] as String;
  set cursor(String value) => map["cursor"] = value;
  TreeEntry get node {
    if (map['node'] is TreeEntry) return map['node'] as TreeEntry;
    return map['node'] = TreeEntry.fromMap(map['node'] as Map<String, dynamic>);
  }

  set node(TreeEntry value) => map["node"] = value;
  static TreeEntryEdge fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return TreeEntryEdge()..map = map;
  }

  TreeEntryEdge clone() =>
      TreeEntryEdge.fromMap(toJson() as Map<String, dynamic>, true);
}

class TreeEntryConnection extends MapObject {
  List<TreeEntryEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<TreeEntryEdge>)
      return map['edges'] as List<TreeEntryEdge>;

    List<TreeEntryEdge> items = [];
    for (dynamic aVar in map['edges'])
      items.add(TreeEntryEdge.fromMap(aVar as Map<String, dynamic>));

    return map['edges'] = items;
  }

  set edges(List<TreeEntryEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'] as PageInfo;
    return map['pageInfo'] =
        PageInfo.fromMap(map['pageInfo'] as Map<String, dynamic>);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static TreeEntryConnection fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return TreeEntryConnection()..map = map;
  }

  TreeEntryConnection clone() =>
      TreeEntryConnection.fromMap(toJson() as Map<String, dynamic>, true);
}

class Tree extends MapObject {
  BlobConnection get blobs {
    if (map['blobs'] is BlobConnection) return map['blobs'] as BlobConnection;
    return map['blobs'] =
        BlobConnection.fromMap(map['blobs'] as Map<String, dynamic>);
  }

  set blobs(BlobConnection value) => map["blobs"] = value;
  Commit get lastCommit {
    if (map['lastCommit'] is Commit) return map['lastCommit'] as Commit;
    return map['lastCommit'] =
        Commit.fromMap(map['lastCommit'] as Map<String, dynamic>);
  }

  set lastCommit(Commit value) => map["lastCommit"] = value;
  SubmoduleConnection get submodules {
    if (map['submodules'] is SubmoduleConnection)
      return map['submodules'] as SubmoduleConnection;
    return map['submodules'] =
        SubmoduleConnection.fromMap(map['submodules'] as Map<String, dynamic>);
  }

  set submodules(SubmoduleConnection value) => map["submodules"] = value;
  TreeEntryConnection get trees {
    if (map['trees'] is TreeEntryConnection)
      return map['trees'] as TreeEntryConnection;
    return map['trees'] =
        TreeEntryConnection.fromMap(map['trees'] as Map<String, dynamic>);
  }

  set trees(TreeEntryConnection value) => map["trees"] = value;
  static Tree fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return Tree()..map = map;
  }

  Tree clone() => Tree.fromMap(toJson() as Map<String, dynamic>, true);
}

class Repository extends MapObject {
  bool get empty => map["empty"] as bool;
  set empty(bool value) => map["empty"] = value;
  bool get exists => map["exists"] as bool;
  set exists(bool value) => map["exists"] = value;
  String get rootRef => map["rootRef"] as String;
  set rootRef(String value) => map["rootRef"] = value;
  Tree get tree {
    if (map['tree'] is Tree) return map['tree'] as Tree;
    return map['tree'] = Tree.fromMap(map['tree'] as Map<String, dynamic>);
  }

  set tree(Tree value) => map["tree"] = value;
  static Repository fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return Repository()..map = map;
  }

  Repository clone() =>
      Repository.fromMap(toJson() as Map<String, dynamic>, true);
}

class ProjectStatistics extends MapObject {
  int get buildArtifactsSize => map["buildArtifactsSize"] as int;
  set buildArtifactsSize(int value) => map["buildArtifactsSize"] = value;
  int get commitCount => map["commitCount"] as int;
  set commitCount(int value) => map["commitCount"] = value;
  int get lfsObjectsSize => map["lfsObjectsSize"] as int;
  set lfsObjectsSize(int value) => map["lfsObjectsSize"] = value;
  int get packagesSize => map["packagesSize"] as int;
  set packagesSize(int value) => map["packagesSize"] = value;
  int get repositorySize => map["repositorySize"] as int;
  set repositorySize(int value) => map["repositorySize"] = value;
  int get storageSize => map["storageSize"] as int;
  set storageSize(int value) => map["storageSize"] = value;
  int get wikiSize => map["wikiSize"] as int;
  set wikiSize(int value) => map["wikiSize"] = value;
  static ProjectStatistics fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return ProjectStatistics()..map = map;
  }

  ProjectStatistics clone() =>
      ProjectStatistics.fromMap(toJson() as Map<String, dynamic>, true);
}

class ProjectPermissions extends MapObject {
  bool get adminProject => map["adminProject"] as bool;
  set adminProject(bool value) => map["adminProject"] = value;
  bool get adminRemoteMirror => map["adminRemoteMirror"] as bool;
  set adminRemoteMirror(bool value) => map["adminRemoteMirror"] = value;
  bool get adminWiki => map["adminWiki"] as bool;
  set adminWiki(bool value) => map["adminWiki"] = value;
  bool get archiveProject => map["archiveProject"] as bool;
  set archiveProject(bool value) => map["archiveProject"] = value;
  bool get changeNamespace => map["changeNamespace"] as bool;
  set changeNamespace(bool value) => map["changeNamespace"] = value;
  bool get changeVisibilityLevel => map["changeVisibilityLevel"] as bool;
  set changeVisibilityLevel(bool value) => map["changeVisibilityLevel"] = value;
  bool get createDeployment => map["createDeployment"] as bool;
  set createDeployment(bool value) => map["createDeployment"] = value;
  bool get createDesign => map["createDesign"] as bool;
  set createDesign(bool value) => map["createDesign"] = value;
  bool get createIssue => map["createIssue"] as bool;
  set createIssue(bool value) => map["createIssue"] = value;
  bool get createLabel => map["createLabel"] as bool;
  set createLabel(bool value) => map["createLabel"] = value;
  bool get createMergeRequestFrom => map["createMergeRequestFrom"] as bool;
  set createMergeRequestFrom(bool value) =>
      map["createMergeRequestFrom"] = value;
  bool get createMergeRequestIn => map["createMergeRequestIn"] as bool;
  set createMergeRequestIn(bool value) => map["createMergeRequestIn"] = value;
  bool get createPages => map["createPages"] as bool;
  set createPages(bool value) => map["createPages"] = value;
  bool get createPipeline => map["createPipeline"] as bool;
  set createPipeline(bool value) => map["createPipeline"] = value;
  bool get createPipelineSchedule => map["createPipelineSchedule"] as bool;
  set createPipelineSchedule(bool value) =>
      map["createPipelineSchedule"] = value;
  bool get createProjectSnippet => map["createProjectSnippet"] as bool;
  set createProjectSnippet(bool value) => map["createProjectSnippet"] = value;
  bool get createWiki => map["createWiki"] as bool;
  set createWiki(bool value) => map["createWiki"] = value;
  bool get destroyDesign => map["destroyDesign"] as bool;
  set destroyDesign(bool value) => map["destroyDesign"] = value;
  bool get destroyPages => map["destroyPages"] as bool;
  set destroyPages(bool value) => map["destroyPages"] = value;
  bool get destroyWiki => map["destroyWiki"] as bool;
  set destroyWiki(bool value) => map["destroyWiki"] = value;
  bool get downloadCode => map["downloadCode"] as bool;
  set downloadCode(bool value) => map["downloadCode"] = value;
  bool get downloadWikiCode => map["downloadWikiCode"] as bool;
  set downloadWikiCode(bool value) => map["downloadWikiCode"] = value;
  bool get forkProject => map["forkProject"] as bool;
  set forkProject(bool value) => map["forkProject"] = value;
  bool get pushCode => map["pushCode"] as bool;
  set pushCode(bool value) => map["pushCode"] = value;
  bool get pushToDeleteProtectedBranch =>
      map["pushToDeleteProtectedBranch"] as bool;
  set pushToDeleteProtectedBranch(bool value) =>
      map["pushToDeleteProtectedBranch"] = value;
  bool get readCommitStatus => map["readCommitStatus"] as bool;
  set readCommitStatus(bool value) => map["readCommitStatus"] = value;
  bool get readCycleAnalytics => map["readCycleAnalytics"] as bool;
  set readCycleAnalytics(bool value) => map["readCycleAnalytics"] = value;
  bool get readDesign => map["readDesign"] as bool;
  set readDesign(bool value) => map["readDesign"] = value;
  bool get readPagesContent => map["readPagesContent"] as bool;
  set readPagesContent(bool value) => map["readPagesContent"] = value;
  bool get readProject => map["readProject"] as bool;
  set readProject(bool value) => map["readProject"] = value;
  bool get readProjectMember => map["readProjectMember"] as bool;
  set readProjectMember(bool value) => map["readProjectMember"] = value;
  bool get readWiki => map["readWiki"] as bool;
  set readWiki(bool value) => map["readWiki"] = value;
  bool get removeForkProject => map["removeForkProject"] as bool;
  set removeForkProject(bool value) => map["removeForkProject"] = value;
  bool get removePages => map["removePages"] as bool;
  set removePages(bool value) => map["removePages"] = value;
  bool get removeProject => map["removeProject"] as bool;
  set removeProject(bool value) => map["removeProject"] = value;
  bool get renameProject => map["renameProject"] as bool;
  set renameProject(bool value) => map["renameProject"] = value;
  bool get requestAccess => map["requestAccess"] as bool;
  set requestAccess(bool value) => map["requestAccess"] = value;
  bool get updatePages => map["updatePages"] as bool;
  set updatePages(bool value) => map["updatePages"] = value;
  bool get updateWiki => map["updateWiki"] as bool;
  set updateWiki(bool value) => map["updateWiki"] = value;
  bool get uploadFile => map["uploadFile"] as bool;
  set uploadFile(bool value) => map["uploadFile"] = value;
  static ProjectPermissions fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return ProjectPermissions()..map = map;
  }

  ProjectPermissions clone() =>
      ProjectPermissions.fromMap(toJson() as Map<String, dynamic>, true);
}

class Project extends MapObject {
  bool get archived => map["archived"] as bool;
  set archived(bool value) => map["archived"] = value;
  String get avatarUrl => map["avatarUrl"] as String;
  set avatarUrl(String value) => map["avatarUrl"] = value;
  bool get containerRegistryEnabled => map["containerRegistryEnabled"] as bool;
  set containerRegistryEnabled(bool value) =>
      map["containerRegistryEnabled"] = value;
  dynamic get createdAt => map["createdAt"] as dynamic;
  set createdAt(dynamic value) => map["createdAt"] = value;
  String get description => map["description"] as String;
  set description(String value) => map["description"] = value;
  String get descriptionHtml => map["descriptionHtml"] as String;
  set descriptionHtml(String value) => map["descriptionHtml"] = value;
  int get forksCount => map["forksCount"] as int;
  set forksCount(int value) => map["forksCount"] = value;
  String get fullPath => map["fullPath"] as String;
  set fullPath(String value) => map["fullPath"] = value;
  Group get group {
    if (map['group'] is Group) return map['group'] as Group;
    return map['group'] = Group.fromMap(map['group'] as Map<String, dynamic>);
  }

  set group(Group value) => map["group"] = value;
  String get httpUrlToRepo => map["httpUrlToRepo"] as String;
  set httpUrlToRepo(String value) => map["httpUrlToRepo"] = value;
  String get id => map["id"] as String;
  set id(String value) => map["id"] = value;
  String get importStatus => map["importStatus"] as String;
  set importStatus(String value) => map["importStatus"] = value;
  Issue get issue {
    if (map['issue'] is Issue) return map['issue'] as Issue;
    return map['issue'] = Issue.fromMap(map['issue'] as Map<String, dynamic>);
  }

  set issue(Issue value) => map["issue"] = value;
  IssueConnection get issues {
    if (map['issues'] is IssueConnection)
      return map['issues'] as IssueConnection;
    return map['issues'] =
        IssueConnection.fromMap(map['issues'] as Map<String, dynamic>);
  }

  set issues(IssueConnection value) => map["issues"] = value;
  bool get issuesEnabled => map["issuesEnabled"] as bool;
  set issuesEnabled(bool value) => map["issuesEnabled"] = value;
  bool get jobsEnabled => map["jobsEnabled"] as bool;
  set jobsEnabled(bool value) => map["jobsEnabled"] = value;
  dynamic get lastActivityAt => map["lastActivityAt"] as dynamic;
  set lastActivityAt(dynamic value) => map["lastActivityAt"] = value;
  bool get lfsEnabled => map["lfsEnabled"] as bool;
  set lfsEnabled(bool value) => map["lfsEnabled"] = value;
  MergeRequest get mergeRequest {
    if (map['mergeRequest'] is MergeRequest)
      return map['mergeRequest'] as MergeRequest;
    return map['mergeRequest'] =
        MergeRequest.fromMap(map['mergeRequest'] as Map<String, dynamic>);
  }

  set mergeRequest(MergeRequest value) => map["mergeRequest"] = value;
  MergeRequestConnection get mergeRequests {
    if (map['mergeRequests'] is MergeRequestConnection)
      return map['mergeRequests'] as MergeRequestConnection;
    return map['mergeRequests'] = MergeRequestConnection.fromMap(
        map['mergeRequests'] as Map<String, dynamic>);
  }

  set mergeRequests(MergeRequestConnection value) =>
      map["mergeRequests"] = value;
  bool get mergeRequestsEnabled => map["mergeRequestsEnabled"] as bool;
  set mergeRequestsEnabled(bool value) => map["mergeRequestsEnabled"] = value;
  bool get mergeRequestsFfOnlyEnabled =>
      map["mergeRequestsFfOnlyEnabled"] as bool;
  set mergeRequestsFfOnlyEnabled(bool value) =>
      map["mergeRequestsFfOnlyEnabled"] = value;
  String get name => map["name"] as String;
  set name(String value) => map["name"] = value;
  String get nameWithNamespace => map["nameWithNamespace"] as String;
  set nameWithNamespace(String value) => map["nameWithNamespace"] = value;
  Namespace get namespace {
    if (map['namespace'] is Namespace) return map['namespace'] as Namespace;
    return map['namespace'] =
        Namespace.fromMap(map['namespace'] as Map<String, dynamic>);
  }

  set namespace(Namespace value) => map["namespace"] = value;
  bool get onlyAllowMergeIfAllDiscussionsAreResolved =>
      map["onlyAllowMergeIfAllDiscussionsAreResolved"] as bool;
  set onlyAllowMergeIfAllDiscussionsAreResolved(bool value) =>
      map["onlyAllowMergeIfAllDiscussionsAreResolved"] = value;
  bool get onlyAllowMergeIfPipelineSucceeds =>
      map["onlyAllowMergeIfPipelineSucceeds"] as bool;
  set onlyAllowMergeIfPipelineSucceeds(bool value) =>
      map["onlyAllowMergeIfPipelineSucceeds"] = value;
  int get openIssuesCount => map["openIssuesCount"] as int;
  set openIssuesCount(int value) => map["openIssuesCount"] = value;
  String get path => map["path"] as String;
  set path(String value) => map["path"] = value;
  PipelineConnection get pipelines {
    if (map['pipelines'] is PipelineConnection)
      return map['pipelines'] as PipelineConnection;
    return map['pipelines'] =
        PipelineConnection.fromMap(map['pipelines'] as Map<String, dynamic>);
  }

  set pipelines(PipelineConnection value) => map["pipelines"] = value;
  bool get printingMergeRequestLinkEnabled =>
      map["printingMergeRequestLinkEnabled"] as bool;
  set printingMergeRequestLinkEnabled(bool value) =>
      map["printingMergeRequestLinkEnabled"] = value;
  bool get publicJobs => map["publicJobs"] as bool;
  set publicJobs(bool value) => map["publicJobs"] = value;
  Repository get repository {
    if (map['repository'] is Repository) return map['repository'] as Repository;
    return map['repository'] =
        Repository.fromMap(map['repository'] as Map<String, dynamic>);
  }

  set repository(Repository value) => map["repository"] = value;
  bool get requestAccessEnabled => map["requestAccessEnabled"] as bool;
  set requestAccessEnabled(bool value) => map["requestAccessEnabled"] = value;
  bool get sharedRunnersEnabled => map["sharedRunnersEnabled"] as bool;
  set sharedRunnersEnabled(bool value) => map["sharedRunnersEnabled"] = value;
  bool get snippetsEnabled => map["snippetsEnabled"] as bool;
  set snippetsEnabled(bool value) => map["snippetsEnabled"] = value;
  String get sshUrlToRepo => map["sshUrlToRepo"] as String;
  set sshUrlToRepo(String value) => map["sshUrlToRepo"] = value;
  int get starCount => map["starCount"] as int;
  set starCount(int value) => map["starCount"] = value;
  ProjectStatistics get statistics {
    if (map['statistics'] is ProjectStatistics)
      return map['statistics'] as ProjectStatistics;
    return map['statistics'] =
        ProjectStatistics.fromMap(map['statistics'] as Map<String, dynamic>);
  }

  set statistics(ProjectStatistics value) => map["statistics"] = value;
  String get tagList => map["tagList"] as String;
  set tagList(String value) => map["tagList"] = value;
  ProjectPermissions get userPermissions {
    if (map['userPermissions'] is ProjectPermissions)
      return map['userPermissions'] as ProjectPermissions;
    return map['userPermissions'] = ProjectPermissions.fromMap(
        map['userPermissions'] as Map<String, dynamic>);
  }

  set userPermissions(ProjectPermissions value) =>
      map["userPermissions"] = value;
  String get visibility => map["visibility"] as String;
  set visibility(String value) => map["visibility"] = value;
  String get webUrl => map["webUrl"] as String;
  set webUrl(String value) => map["webUrl"] = value;
  bool get wikiEnabled => map["wikiEnabled"] as bool;
  set wikiEnabled(bool value) => map["wikiEnabled"] = value;
  static Project fromMap(Map<String, dynamic> map, [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return Project()..map = map;
  }

  Project clone() => Project.fromMap(toJson() as Map<String, dynamic>, true);
}

class GitlabCEIssueLabels_OperationResult extends MapObject {
  Project get project {
    if (map['project'] is Project) return map['project'] as Project;
    return map['project'] =
        Project.fromMap(map['project'] as Map<String, dynamic>);
  }

  set project(Project value) => map["project"] = value;
  static GitlabCEIssueLabels_OperationResult fromMap(Map<String, dynamic> map,
      [bool deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map)) as Map<String, dynamic>;
    return GitlabCEIssueLabels_OperationResult()..map = map;
  }

  GitlabCEIssueLabels_OperationResult clone() =>
      GitlabCEIssueLabels_OperationResult.fromMap(
          toJson() as Map<String, dynamic>, true);
}

GraphqlQuery<GitlabCEIssueLabels_OperationResult> GitlabCEIssueLabels(
    {int firstN}) {
  const query = """query GitlabCEIssueLabels(\$firstN: Int) {
  project(fullPath: "gitlab-org/gitlab-ce") {
    id
    issues(first: \$firstN) {
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
}""";
  return GraphqlQuery(query, <String, dynamic>{"firstN": firstN},
      GitlabCEIssueLabels_OperationResult.fromMap);
}
