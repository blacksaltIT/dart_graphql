// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:dart_graphql/dart_graphql.dart';
import 'dart:core';
import 'dart:convert';

class User extends MapObject {
  String get avatarUrl => map["avatarUrl"];
  set avatarUrl(String value) => map["avatarUrl"] = value;
  String get name => map["name"];
  set name(String value) => map["name"] = value;
  String get username => map["username"];
  set username(String value) => map["username"] = value;
  String get webUrl => map["webUrl"];
  set webUrl(String value) => map["webUrl"] = value;
  static User fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return User()..map = map;
  }

  User clone() => User.fromMap(toJson(), true);
}

class EpicEdge extends MapObject {
  String get cursor => map["cursor"];
  set cursor(String value) => map["cursor"] = value;
  Epic get node {
    if (map['node'] is Epic) return map['node'];
    return map['node'] = Epic.fromMap(map['node']);
  }

  set node(Epic value) => map["node"] = value;
  static EpicEdge fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return EpicEdge()..map = map;
  }

  EpicEdge clone() => EpicEdge.fromMap(toJson(), true);
}

class PageInfo extends MapObject {
  String get endCursor => map["endCursor"];
  set endCursor(String value) => map["endCursor"] = value;
  bool get hasNextPage => map["hasNextPage"];
  set hasNextPage(bool value) => map["hasNextPage"] = value;
  bool get hasPreviousPage => map["hasPreviousPage"];
  set hasPreviousPage(bool value) => map["hasPreviousPage"] = value;
  String get startCursor => map["startCursor"];
  set startCursor(String value) => map["startCursor"] = value;
  static PageInfo fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return PageInfo()..map = map;
  }

  PageInfo clone() => PageInfo.fromMap(toJson(), true);
}

class EpicConnection extends MapObject {
  List<EpicEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<EpicEdge>)
      return map['edges'];

    List<EpicEdge> items = [];
    for (dynamic aVar in map['edges']) items.add(EpicEdge.fromMap(aVar));

    return map['edges'] = items;
  }

  set edges(List<EpicEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'];
    return map['pageInfo'] = PageInfo.fromMap(map['pageInfo']);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static EpicConnection fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return EpicConnection()..map = map;
  }

  EpicConnection clone() => EpicConnection.fromMap(toJson(), true);
}

class DiffRefs extends MapObject {
  String get baseSha => map["baseSha"];
  set baseSha(String value) => map["baseSha"] = value;
  String get headSha => map["headSha"];
  set headSha(String value) => map["headSha"] = value;
  String get startSha => map["startSha"];
  set startSha(String value) => map["startSha"] = value;
  static DiffRefs fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return DiffRefs()..map = map;
  }

  DiffRefs clone() => DiffRefs.fromMap(toJson(), true);
}

class DiffPosition extends MapObject {
  DiffRefs get diffRefs {
    if (map['diffRefs'] is DiffRefs) return map['diffRefs'];
    return map['diffRefs'] = DiffRefs.fromMap(map['diffRefs']);
  }

  set diffRefs(DiffRefs value) => map["diffRefs"] = value;
  String get filePath => map["filePath"];
  set filePath(String value) => map["filePath"] = value;
  int get height => map["height"];
  set height(int value) => map["height"] = value;
  int get newLine => map["newLine"];
  set newLine(int value) => map["newLine"] = value;
  String get newPath => map["newPath"];
  set newPath(String value) => map["newPath"] = value;
  int get oldLine => map["oldLine"];
  set oldLine(int value) => map["oldLine"] = value;
  String get oldPath => map["oldPath"];
  set oldPath(String value) => map["oldPath"] = value;
  String get positionType => map["positionType"];
  set positionType(String value) => map["positionType"] = value;
  int get width => map["width"];
  set width(int value) => map["width"] = value;
  int get x => map["x"];
  set x(int value) => map["x"] = value;
  int get y => map["y"];
  set y(int value) => map["y"] = value;
  static DiffPosition fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return DiffPosition()..map = map;
  }

  DiffPosition clone() => DiffPosition.fromMap(toJson(), true);
}

class NotePermissions extends MapObject {
  bool get adminNote => map["adminNote"];
  set adminNote(bool value) => map["adminNote"] = value;
  bool get awardEmoji => map["awardEmoji"];
  set awardEmoji(bool value) => map["awardEmoji"] = value;
  bool get createNote => map["createNote"];
  set createNote(bool value) => map["createNote"] = value;
  bool get readNote => map["readNote"];
  set readNote(bool value) => map["readNote"] = value;
  bool get resolveNote => map["resolveNote"];
  set resolveNote(bool value) => map["resolveNote"] = value;
  static NotePermissions fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return NotePermissions()..map = map;
  }

  NotePermissions clone() => NotePermissions.fromMap(toJson(), true);
}

class Note extends MapObject {
  User get author {
    if (map['author'] is User) return map['author'];
    return map['author'] = User.fromMap(map['author']);
  }

  set author(User value) => map["author"] = value;
  String get body => map["body"];
  set body(String value) => map["body"] = value;
  String get bodyHtml => map["bodyHtml"];
  set bodyHtml(String value) => map["bodyHtml"] = value;
  dynamic get createdAt => map["createdAt"];
  set createdAt(dynamic value) => map["createdAt"] = value;
  Discussion get discussion {
    if (map['discussion'] is Discussion) return map['discussion'];
    return map['discussion'] = Discussion.fromMap(map['discussion']);
  }

  set discussion(Discussion value) => map["discussion"] = value;
  String get id => map["id"];
  set id(String value) => map["id"] = value;
  DiffPosition get position {
    if (map['position'] is DiffPosition) return map['position'];
    return map['position'] = DiffPosition.fromMap(map['position']);
  }

  set position(DiffPosition value) => map["position"] = value;
  Project get project {
    if (map['project'] is Project) return map['project'];
    return map['project'] = Project.fromMap(map['project']);
  }

  set project(Project value) => map["project"] = value;
  bool get resolvable => map["resolvable"];
  set resolvable(bool value) => map["resolvable"] = value;
  dynamic get resolvedAt => map["resolvedAt"];
  set resolvedAt(dynamic value) => map["resolvedAt"] = value;
  User get resolvedBy {
    if (map['resolvedBy'] is User) return map['resolvedBy'];
    return map['resolvedBy'] = User.fromMap(map['resolvedBy']);
  }

  set resolvedBy(User value) => map["resolvedBy"] = value;
  bool get system => map["system"];
  set system(bool value) => map["system"] = value;
  dynamic get updatedAt => map["updatedAt"];
  set updatedAt(dynamic value) => map["updatedAt"] = value;
  NotePermissions get userPermissions {
    if (map['userPermissions'] is NotePermissions)
      return map['userPermissions'];
    return map['userPermissions'] =
        NotePermissions.fromMap(map['userPermissions']);
  }

  set userPermissions(NotePermissions value) => map["userPermissions"] = value;
  static Note fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return Note()..map = map;
  }

  Note clone() => Note.fromMap(toJson(), true);
}

class NoteEdge extends MapObject {
  String get cursor => map["cursor"];
  set cursor(String value) => map["cursor"] = value;
  Note get node {
    if (map['node'] is Note) return map['node'];
    return map['node'] = Note.fromMap(map['node']);
  }

  set node(Note value) => map["node"] = value;
  static NoteEdge fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return NoteEdge()..map = map;
  }

  NoteEdge clone() => NoteEdge.fromMap(toJson(), true);
}

class NoteConnection extends MapObject {
  List<NoteEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<NoteEdge>)
      return map['edges'];

    List<NoteEdge> items = [];
    for (dynamic aVar in map['edges']) items.add(NoteEdge.fromMap(aVar));

    return map['edges'] = items;
  }

  set edges(List<NoteEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'];
    return map['pageInfo'] = PageInfo.fromMap(map['pageInfo']);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static NoteConnection fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return NoteConnection()..map = map;
  }

  NoteConnection clone() => NoteConnection.fromMap(toJson(), true);
}

class Discussion extends MapObject {
  dynamic get createdAt => map["createdAt"];
  set createdAt(dynamic value) => map["createdAt"] = value;
  String get id => map["id"];
  set id(String value) => map["id"] = value;
  NoteConnection get notes {
    if (map['notes'] is NoteConnection) return map['notes'];
    return map['notes'] = NoteConnection.fromMap(map['notes']);
  }

  set notes(NoteConnection value) => map["notes"] = value;
  String get replyId => map["replyId"];
  set replyId(String value) => map["replyId"] = value;
  static Discussion fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return Discussion()..map = map;
  }

  Discussion clone() => Discussion.fromMap(toJson(), true);
}

class DiscussionEdge extends MapObject {
  String get cursor => map["cursor"];
  set cursor(String value) => map["cursor"] = value;
  Discussion get node {
    if (map['node'] is Discussion) return map['node'];
    return map['node'] = Discussion.fromMap(map['node']);
  }

  set node(Discussion value) => map["node"] = value;
  static DiscussionEdge fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return DiscussionEdge()..map = map;
  }

  DiscussionEdge clone() => DiscussionEdge.fromMap(toJson(), true);
}

class DiscussionConnection extends MapObject {
  List<DiscussionEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<DiscussionEdge>)
      return map['edges'];

    List<DiscussionEdge> items = [];
    for (dynamic aVar in map['edges']) items.add(DiscussionEdge.fromMap(aVar));

    return map['edges'] = items;
  }

  set edges(List<DiscussionEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'];
    return map['pageInfo'] = PageInfo.fromMap(map['pageInfo']);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static DiscussionConnection fromMap(Map<String, dynamic> map,
      [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return DiscussionConnection()..map = map;
  }

  DiscussionConnection clone() => DiscussionConnection.fromMap(toJson(), true);
}

class UserEdge extends MapObject {
  String get cursor => map["cursor"];
  set cursor(String value) => map["cursor"] = value;
  User get node {
    if (map['node'] is User) return map['node'];
    return map['node'] = User.fromMap(map['node']);
  }

  set node(User value) => map["node"] = value;
  static UserEdge fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return UserEdge()..map = map;
  }

  UserEdge clone() => UserEdge.fromMap(toJson(), true);
}

class UserConnection extends MapObject {
  List<UserEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<UserEdge>)
      return map['edges'];

    List<UserEdge> items = [];
    for (dynamic aVar in map['edges']) items.add(UserEdge.fromMap(aVar));

    return map['edges'] = items;
  }

  set edges(List<UserEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'];
    return map['pageInfo'] = PageInfo.fromMap(map['pageInfo']);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static UserConnection fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return UserConnection()..map = map;
  }

  UserConnection clone() => UserConnection.fromMap(toJson(), true);
}

class Label extends MapObject {
  String get color => map["color"];
  set color(String value) => map["color"] = value;
  String get description => map["description"];
  set description(String value) => map["description"] = value;
  String get descriptionHtml => map["descriptionHtml"];
  set descriptionHtml(String value) => map["descriptionHtml"] = value;
  String get textColor => map["textColor"];
  set textColor(String value) => map["textColor"] = value;
  String get title => map["title"];
  set title(String value) => map["title"] = value;
  static Label fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return Label()..map = map;
  }

  Label clone() => Label.fromMap(toJson(), true);
}

class LabelEdge extends MapObject {
  String get cursor => map["cursor"];
  set cursor(String value) => map["cursor"] = value;
  Label get node {
    if (map['node'] is Label) return map['node'];
    return map['node'] = Label.fromMap(map['node']);
  }

  set node(Label value) => map["node"] = value;
  static LabelEdge fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return LabelEdge()..map = map;
  }

  LabelEdge clone() => LabelEdge.fromMap(toJson(), true);
}

class LabelConnection extends MapObject {
  List<LabelEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<LabelEdge>)
      return map['edges'];

    List<LabelEdge> items = [];
    for (dynamic aVar in map['edges']) items.add(LabelEdge.fromMap(aVar));

    return map['edges'] = items;
  }

  set edges(List<LabelEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'];
    return map['pageInfo'] = PageInfo.fromMap(map['pageInfo']);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static LabelConnection fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return LabelConnection()..map = map;
  }

  LabelConnection clone() => LabelConnection.fromMap(toJson(), true);
}

class Milestone extends MapObject {
  dynamic get createdAt => map["createdAt"];
  set createdAt(dynamic value) => map["createdAt"] = value;
  String get description => map["description"];
  set description(String value) => map["description"] = value;
  dynamic get dueDate => map["dueDate"];
  set dueDate(dynamic value) => map["dueDate"] = value;
  dynamic get startDate => map["startDate"];
  set startDate(dynamic value) => map["startDate"] = value;
  String get state => map["state"];
  set state(String value) => map["state"] = value;
  String get title => map["title"];
  set title(String value) => map["title"] = value;
  dynamic get updatedAt => map["updatedAt"];
  set updatedAt(dynamic value) => map["updatedAt"] = value;
  static Milestone fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return Milestone()..map = map;
  }

  Milestone clone() => Milestone.fromMap(toJson(), true);
}

class TaskCompletionStatus extends MapObject {
  int get completedCount => map["completedCount"];
  set completedCount(int value) => map["completedCount"] = value;
  int get count => map["count"];
  set count(int value) => map["count"] = value;
  static TaskCompletionStatus fromMap(Map<String, dynamic> map,
      [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return TaskCompletionStatus()..map = map;
  }

  TaskCompletionStatus clone() => TaskCompletionStatus.fromMap(toJson(), true);
}

class IssuePermissions extends MapObject {
  bool get adminIssue => map["adminIssue"];
  set adminIssue(bool value) => map["adminIssue"] = value;
  bool get createDesign => map["createDesign"];
  set createDesign(bool value) => map["createDesign"] = value;
  bool get createNote => map["createNote"];
  set createNote(bool value) => map["createNote"] = value;
  bool get destroyDesign => map["destroyDesign"];
  set destroyDesign(bool value) => map["destroyDesign"] = value;
  bool get readDesign => map["readDesign"];
  set readDesign(bool value) => map["readDesign"] = value;
  bool get readIssue => map["readIssue"];
  set readIssue(bool value) => map["readIssue"] = value;
  bool get reopenIssue => map["reopenIssue"];
  set reopenIssue(bool value) => map["reopenIssue"] = value;
  bool get updateIssue => map["updateIssue"];
  set updateIssue(bool value) => map["updateIssue"] = value;
  static IssuePermissions fromMap(Map<String, dynamic> map,
      [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return IssuePermissions()..map = map;
  }

  IssuePermissions clone() => IssuePermissions.fromMap(toJson(), true);
}

class Issue extends MapObject {
  UserConnection get assignees {
    if (map['assignees'] is UserConnection) return map['assignees'];
    return map['assignees'] = UserConnection.fromMap(map['assignees']);
  }

  set assignees(UserConnection value) => map["assignees"] = value;
  User get author {
    if (map['author'] is User) return map['author'];
    return map['author'] = User.fromMap(map['author']);
  }

  set author(User value) => map["author"] = value;
  dynamic get closedAt => map["closedAt"];
  set closedAt(dynamic value) => map["closedAt"] = value;
  bool get confidential => map["confidential"];
  set confidential(bool value) => map["confidential"] = value;
  dynamic get createdAt => map["createdAt"];
  set createdAt(dynamic value) => map["createdAt"] = value;
  String get description => map["description"];
  set description(String value) => map["description"] = value;
  String get descriptionHtml => map["descriptionHtml"];
  set descriptionHtml(String value) => map["descriptionHtml"] = value;
  DesignCollection get designs {
    if (map['designs'] is DesignCollection) return map['designs'];
    return map['designs'] = DesignCollection.fromMap(map['designs']);
  }

  set designs(DesignCollection value) => map["designs"] = value;
  bool get discussionLocked => map["discussionLocked"];
  set discussionLocked(bool value) => map["discussionLocked"] = value;
  DiscussionConnection get discussions {
    if (map['discussions'] is DiscussionConnection) return map['discussions'];
    return map['discussions'] =
        DiscussionConnection.fromMap(map['discussions']);
  }

  set discussions(DiscussionConnection value) => map["discussions"] = value;
  int get downvotes => map["downvotes"];
  set downvotes(int value) => map["downvotes"] = value;
  dynamic get dueDate => map["dueDate"];
  set dueDate(dynamic value) => map["dueDate"] = value;
  String get iid => map["iid"];
  set iid(String value) => map["iid"] = value;
  LabelConnection get labels {
    if (map['labels'] is LabelConnection) return map['labels'];
    return map['labels'] = LabelConnection.fromMap(map['labels']);
  }

  set labels(LabelConnection value) => map["labels"] = value;
  Milestone get milestone {
    if (map['milestone'] is Milestone) return map['milestone'];
    return map['milestone'] = Milestone.fromMap(map['milestone']);
  }

  set milestone(Milestone value) => map["milestone"] = value;
  NoteConnection get notes {
    if (map['notes'] is NoteConnection) return map['notes'];
    return map['notes'] = NoteConnection.fromMap(map['notes']);
  }

  set notes(NoteConnection value) => map["notes"] = value;
  String get reference => map["reference"];
  set reference(String value) => map["reference"] = value;
  int get relativePosition => map["relativePosition"];
  set relativePosition(int value) => map["relativePosition"] = value;
  String get state => map["state"];
  set state(String value) => map["state"] = value;
  TaskCompletionStatus get taskCompletionStatus {
    if (map['taskCompletionStatus'] is TaskCompletionStatus)
      return map['taskCompletionStatus'];
    return map['taskCompletionStatus'] =
        TaskCompletionStatus.fromMap(map['taskCompletionStatus']);
  }

  set taskCompletionStatus(TaskCompletionStatus value) =>
      map["taskCompletionStatus"] = value;
  String get title => map["title"];
  set title(String value) => map["title"] = value;
  String get titleHtml => map["titleHtml"];
  set titleHtml(String value) => map["titleHtml"] = value;
  dynamic get updatedAt => map["updatedAt"];
  set updatedAt(dynamic value) => map["updatedAt"] = value;
  int get upvotes => map["upvotes"];
  set upvotes(int value) => map["upvotes"] = value;
  int get userNotesCount => map["userNotesCount"];
  set userNotesCount(int value) => map["userNotesCount"] = value;
  IssuePermissions get userPermissions {
    if (map['userPermissions'] is IssuePermissions)
      return map['userPermissions'];
    return map['userPermissions'] =
        IssuePermissions.fromMap(map['userPermissions']);
  }

  set userPermissions(IssuePermissions value) => map["userPermissions"] = value;
  String get webPath => map["webPath"];
  set webPath(String value) => map["webPath"] = value;
  String get webUrl => map["webUrl"];
  set webUrl(String value) => map["webUrl"] = value;
  int get weight => map["weight"];
  set weight(int value) => map["weight"] = value;
  static Issue fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return Issue()..map = map;
  }

  Issue clone() => Issue.fromMap(toJson(), true);
}

class DesignVersion extends MapObject {
  DesignConnection get designs {
    if (map['designs'] is DesignConnection) return map['designs'];
    return map['designs'] = DesignConnection.fromMap(map['designs']);
  }

  set designs(DesignConnection value) => map["designs"] = value;
  String get id => map["id"];
  set id(String value) => map["id"] = value;
  String get sha => map["sha"];
  set sha(String value) => map["sha"] = value;
  static DesignVersion fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return DesignVersion()..map = map;
  }

  DesignVersion clone() => DesignVersion.fromMap(toJson(), true);
}

class DesignVersionEdge extends MapObject {
  String get cursor => map["cursor"];
  set cursor(String value) => map["cursor"] = value;
  DesignVersion get node {
    if (map['node'] is DesignVersion) return map['node'];
    return map['node'] = DesignVersion.fromMap(map['node']);
  }

  set node(DesignVersion value) => map["node"] = value;
  static DesignVersionEdge fromMap(Map<String, dynamic> map,
      [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return DesignVersionEdge()..map = map;
  }

  DesignVersionEdge clone() => DesignVersionEdge.fromMap(toJson(), true);
}

class DesignVersionConnection extends MapObject {
  List<DesignVersionEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<DesignVersionEdge>)
      return map['edges'];

    List<DesignVersionEdge> items = [];
    for (dynamic aVar in map['edges'])
      items.add(DesignVersionEdge.fromMap(aVar));

    return map['edges'] = items;
  }

  set edges(List<DesignVersionEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'];
    return map['pageInfo'] = PageInfo.fromMap(map['pageInfo']);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static DesignVersionConnection fromMap(Map<String, dynamic> map,
      [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return DesignVersionConnection()..map = map;
  }

  DesignVersionConnection clone() =>
      DesignVersionConnection.fromMap(toJson(), true);
}

class Design extends MapObject {
  DiffRefs get diffRefs {
    if (map['diffRefs'] is DiffRefs) return map['diffRefs'];
    return map['diffRefs'] = DiffRefs.fromMap(map['diffRefs']);
  }

  set diffRefs(DiffRefs value) => map["diffRefs"] = value;
  DiscussionConnection get discussions {
    if (map['discussions'] is DiscussionConnection) return map['discussions'];
    return map['discussions'] =
        DiscussionConnection.fromMap(map['discussions']);
  }

  set discussions(DiscussionConnection value) => map["discussions"] = value;
  String get filename => map["filename"];
  set filename(String value) => map["filename"] = value;
  String get fullPath => map["fullPath"];
  set fullPath(String value) => map["fullPath"] = value;
  String get id => map["id"];
  set id(String value) => map["id"] = value;
  String get image => map["image"];
  set image(String value) => map["image"] = value;
  Issue get issue {
    if (map['issue'] is Issue) return map['issue'];
    return map['issue'] = Issue.fromMap(map['issue']);
  }

  set issue(Issue value) => map["issue"] = value;
  NoteConnection get notes {
    if (map['notes'] is NoteConnection) return map['notes'];
    return map['notes'] = NoteConnection.fromMap(map['notes']);
  }

  set notes(NoteConnection value) => map["notes"] = value;
  Project get project {
    if (map['project'] is Project) return map['project'];
    return map['project'] = Project.fromMap(map['project']);
  }

  set project(Project value) => map["project"] = value;
  DesignVersionConnection get versions {
    if (map['versions'] is DesignVersionConnection) return map['versions'];
    return map['versions'] = DesignVersionConnection.fromMap(map['versions']);
  }

  set versions(DesignVersionConnection value) => map["versions"] = value;
  static Design fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return Design()..map = map;
  }

  Design clone() => Design.fromMap(toJson(), true);
}

class DesignEdge extends MapObject {
  String get cursor => map["cursor"];
  set cursor(String value) => map["cursor"] = value;
  Design get node {
    if (map['node'] is Design) return map['node'];
    return map['node'] = Design.fromMap(map['node']);
  }

  set node(Design value) => map["node"] = value;
  static DesignEdge fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return DesignEdge()..map = map;
  }

  DesignEdge clone() => DesignEdge.fromMap(toJson(), true);
}

class DesignConnection extends MapObject {
  List<DesignEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<DesignEdge>)
      return map['edges'];

    List<DesignEdge> items = [];
    for (dynamic aVar in map['edges']) items.add(DesignEdge.fromMap(aVar));

    return map['edges'] = items;
  }

  set edges(List<DesignEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'];
    return map['pageInfo'] = PageInfo.fromMap(map['pageInfo']);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static DesignConnection fromMap(Map<String, dynamic> map,
      [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return DesignConnection()..map = map;
  }

  DesignConnection clone() => DesignConnection.fromMap(toJson(), true);
}

class DesignCollection extends MapObject {
  DesignConnection get designs {
    if (map['designs'] is DesignConnection) return map['designs'];
    return map['designs'] = DesignConnection.fromMap(map['designs']);
  }

  set designs(DesignConnection value) => map["designs"] = value;
  Issue get issue {
    if (map['issue'] is Issue) return map['issue'];
    return map['issue'] = Issue.fromMap(map['issue']);
  }

  set issue(Issue value) => map["issue"] = value;
  Project get project {
    if (map['project'] is Project) return map['project'];
    return map['project'] = Project.fromMap(map['project']);
  }

  set project(Project value) => map["project"] = value;
  DesignVersionConnection get versions {
    if (map['versions'] is DesignVersionConnection) return map['versions'];
    return map['versions'] = DesignVersionConnection.fromMap(map['versions']);
  }

  set versions(DesignVersionConnection value) => map["versions"] = value;
  static DesignCollection fromMap(Map<String, dynamic> map,
      [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return DesignCollection()..map = map;
  }

  DesignCollection clone() => DesignCollection.fromMap(toJson(), true);
}

class EpicIssue extends MapObject {
  UserConnection get assignees {
    if (map['assignees'] is UserConnection) return map['assignees'];
    return map['assignees'] = UserConnection.fromMap(map['assignees']);
  }

  set assignees(UserConnection value) => map["assignees"] = value;
  User get author {
    if (map['author'] is User) return map['author'];
    return map['author'] = User.fromMap(map['author']);
  }

  set author(User value) => map["author"] = value;
  dynamic get closedAt => map["closedAt"];
  set closedAt(dynamic value) => map["closedAt"] = value;
  bool get confidential => map["confidential"];
  set confidential(bool value) => map["confidential"] = value;
  dynamic get createdAt => map["createdAt"];
  set createdAt(dynamic value) => map["createdAt"] = value;
  String get description => map["description"];
  set description(String value) => map["description"] = value;
  String get descriptionHtml => map["descriptionHtml"];
  set descriptionHtml(String value) => map["descriptionHtml"] = value;
  DesignCollection get designs {
    if (map['designs'] is DesignCollection) return map['designs'];
    return map['designs'] = DesignCollection.fromMap(map['designs']);
  }

  set designs(DesignCollection value) => map["designs"] = value;
  bool get discussionLocked => map["discussionLocked"];
  set discussionLocked(bool value) => map["discussionLocked"] = value;
  DiscussionConnection get discussions {
    if (map['discussions'] is DiscussionConnection) return map['discussions'];
    return map['discussions'] =
        DiscussionConnection.fromMap(map['discussions']);
  }

  set discussions(DiscussionConnection value) => map["discussions"] = value;
  int get downvotes => map["downvotes"];
  set downvotes(int value) => map["downvotes"] = value;
  dynamic get dueDate => map["dueDate"];
  set dueDate(dynamic value) => map["dueDate"] = value;
  String get epicIssueId => map["epicIssueId"];
  set epicIssueId(String value) => map["epicIssueId"] = value;
  String get iid => map["iid"];
  set iid(String value) => map["iid"] = value;
  LabelConnection get labels {
    if (map['labels'] is LabelConnection) return map['labels'];
    return map['labels'] = LabelConnection.fromMap(map['labels']);
  }

  set labels(LabelConnection value) => map["labels"] = value;
  Milestone get milestone {
    if (map['milestone'] is Milestone) return map['milestone'];
    return map['milestone'] = Milestone.fromMap(map['milestone']);
  }

  set milestone(Milestone value) => map["milestone"] = value;
  NoteConnection get notes {
    if (map['notes'] is NoteConnection) return map['notes'];
    return map['notes'] = NoteConnection.fromMap(map['notes']);
  }

  set notes(NoteConnection value) => map["notes"] = value;
  String get reference => map["reference"];
  set reference(String value) => map["reference"] = value;
  String get relationPath => map["relationPath"];
  set relationPath(String value) => map["relationPath"] = value;
  int get relativePosition => map["relativePosition"];
  set relativePosition(int value) => map["relativePosition"] = value;
  String get state => map["state"];
  set state(String value) => map["state"] = value;
  TaskCompletionStatus get taskCompletionStatus {
    if (map['taskCompletionStatus'] is TaskCompletionStatus)
      return map['taskCompletionStatus'];
    return map['taskCompletionStatus'] =
        TaskCompletionStatus.fromMap(map['taskCompletionStatus']);
  }

  set taskCompletionStatus(TaskCompletionStatus value) =>
      map["taskCompletionStatus"] = value;
  String get title => map["title"];
  set title(String value) => map["title"] = value;
  String get titleHtml => map["titleHtml"];
  set titleHtml(String value) => map["titleHtml"] = value;
  dynamic get updatedAt => map["updatedAt"];
  set updatedAt(dynamic value) => map["updatedAt"] = value;
  int get upvotes => map["upvotes"];
  set upvotes(int value) => map["upvotes"] = value;
  int get userNotesCount => map["userNotesCount"];
  set userNotesCount(int value) => map["userNotesCount"] = value;
  IssuePermissions get userPermissions {
    if (map['userPermissions'] is IssuePermissions)
      return map['userPermissions'];
    return map['userPermissions'] =
        IssuePermissions.fromMap(map['userPermissions']);
  }

  set userPermissions(IssuePermissions value) => map["userPermissions"] = value;
  String get webPath => map["webPath"];
  set webPath(String value) => map["webPath"] = value;
  String get webUrl => map["webUrl"];
  set webUrl(String value) => map["webUrl"] = value;
  int get weight => map["weight"];
  set weight(int value) => map["weight"] = value;
  static EpicIssue fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return EpicIssue()..map = map;
  }

  EpicIssue clone() => EpicIssue.fromMap(toJson(), true);
}

class EpicIssueEdge extends MapObject {
  String get cursor => map["cursor"];
  set cursor(String value) => map["cursor"] = value;
  EpicIssue get node {
    if (map['node'] is EpicIssue) return map['node'];
    return map['node'] = EpicIssue.fromMap(map['node']);
  }

  set node(EpicIssue value) => map["node"] = value;
  static EpicIssueEdge fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return EpicIssueEdge()..map = map;
  }

  EpicIssueEdge clone() => EpicIssueEdge.fromMap(toJson(), true);
}

class EpicIssueConnection extends MapObject {
  List<EpicIssueEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<EpicIssueEdge>)
      return map['edges'];

    List<EpicIssueEdge> items = [];
    for (dynamic aVar in map['edges']) items.add(EpicIssueEdge.fromMap(aVar));

    return map['edges'] = items;
  }

  set edges(List<EpicIssueEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'];
    return map['pageInfo'] = PageInfo.fromMap(map['pageInfo']);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static EpicIssueConnection fromMap(Map<String, dynamic> map,
      [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return EpicIssueConnection()..map = map;
  }

  EpicIssueConnection clone() => EpicIssueConnection.fromMap(toJson(), true);
}

class EpicPermissions extends MapObject {
  bool get adminEpic => map["adminEpic"];
  set adminEpic(bool value) => map["adminEpic"] = value;
  bool get awardEmoji => map["awardEmoji"];
  set awardEmoji(bool value) => map["awardEmoji"] = value;
  bool get createEpic => map["createEpic"];
  set createEpic(bool value) => map["createEpic"] = value;
  bool get createNote => map["createNote"];
  set createNote(bool value) => map["createNote"] = value;
  bool get destroyEpic => map["destroyEpic"];
  set destroyEpic(bool value) => map["destroyEpic"] = value;
  bool get readEpic => map["readEpic"];
  set readEpic(bool value) => map["readEpic"] = value;
  bool get readEpicIid => map["readEpicIid"];
  set readEpicIid(bool value) => map["readEpicIid"] = value;
  bool get updateEpic => map["updateEpic"];
  set updateEpic(bool value) => map["updateEpic"] = value;
  static EpicPermissions fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return EpicPermissions()..map = map;
  }

  EpicPermissions clone() => EpicPermissions.fromMap(toJson(), true);
}

class Epic extends MapObject {
  User get author {
    if (map['author'] is User) return map['author'];
    return map['author'] = User.fromMap(map['author']);
  }

  set author(User value) => map["author"] = value;
  EpicConnection get children {
    if (map['children'] is EpicConnection) return map['children'];
    return map['children'] = EpicConnection.fromMap(map['children']);
  }

  set children(EpicConnection value) => map["children"] = value;
  dynamic get closedAt => map["closedAt"];
  set closedAt(dynamic value) => map["closedAt"] = value;
  dynamic get createdAt => map["createdAt"];
  set createdAt(dynamic value) => map["createdAt"] = value;
  String get description => map["description"];
  set description(String value) => map["description"] = value;
  DiscussionConnection get discussions {
    if (map['discussions'] is DiscussionConnection) return map['discussions'];
    return map['discussions'] =
        DiscussionConnection.fromMap(map['discussions']);
  }

  set discussions(DiscussionConnection value) => map["discussions"] = value;
  dynamic get dueDate => map["dueDate"];
  set dueDate(dynamic value) => map["dueDate"] = value;
  dynamic get dueDateFixed => map["dueDateFixed"];
  set dueDateFixed(dynamic value) => map["dueDateFixed"] = value;
  dynamic get dueDateFromMilestones => map["dueDateFromMilestones"];
  set dueDateFromMilestones(dynamic value) =>
      map["dueDateFromMilestones"] = value;
  bool get dueDateIsFixed => map["dueDateIsFixed"];
  set dueDateIsFixed(bool value) => map["dueDateIsFixed"] = value;
  Group get group {
    if (map['group'] is Group) return map['group'];
    return map['group'] = Group.fromMap(map['group']);
  }

  set group(Group value) => map["group"] = value;
  bool get hasChildren => map["hasChildren"];
  set hasChildren(bool value) => map["hasChildren"] = value;
  bool get hasIssues => map["hasIssues"];
  set hasIssues(bool value) => map["hasIssues"] = value;
  String get id => map["id"];
  set id(String value) => map["id"] = value;
  String get iid => map["iid"];
  set iid(String value) => map["iid"] = value;
  EpicIssueConnection get issues {
    if (map['issues'] is EpicIssueConnection) return map['issues'];
    return map['issues'] = EpicIssueConnection.fromMap(map['issues']);
  }

  set issues(EpicIssueConnection value) => map["issues"] = value;
  NoteConnection get notes {
    if (map['notes'] is NoteConnection) return map['notes'];
    return map['notes'] = NoteConnection.fromMap(map['notes']);
  }

  set notes(NoteConnection value) => map["notes"] = value;
  Epic get parent {
    if (map['parent'] is Epic) return map['parent'];
    return map['parent'] = Epic.fromMap(map['parent']);
  }

  set parent(Epic value) => map["parent"] = value;
  String get reference => map["reference"];
  set reference(String value) => map["reference"] = value;
  String get relationPath => map["relationPath"];
  set relationPath(String value) => map["relationPath"] = value;
  dynamic get startDate => map["startDate"];
  set startDate(dynamic value) => map["startDate"] = value;
  dynamic get startDateFixed => map["startDateFixed"];
  set startDateFixed(dynamic value) => map["startDateFixed"] = value;
  dynamic get startDateFromMilestones => map["startDateFromMilestones"];
  set startDateFromMilestones(dynamic value) =>
      map["startDateFromMilestones"] = value;
  bool get startDateIsFixed => map["startDateIsFixed"];
  set startDateIsFixed(bool value) => map["startDateIsFixed"] = value;
  String get state => map["state"];
  set state(String value) => map["state"] = value;
  String get title => map["title"];
  set title(String value) => map["title"] = value;
  dynamic get updatedAt => map["updatedAt"];
  set updatedAt(dynamic value) => map["updatedAt"] = value;
  EpicPermissions get userPermissions {
    if (map['userPermissions'] is EpicPermissions)
      return map['userPermissions'];
    return map['userPermissions'] =
        EpicPermissions.fromMap(map['userPermissions']);
  }

  set userPermissions(EpicPermissions value) => map["userPermissions"] = value;
  String get webPath => map["webPath"];
  set webPath(String value) => map["webPath"] = value;
  String get webUrl => map["webUrl"];
  set webUrl(String value) => map["webUrl"] = value;
  static Epic fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return Epic()..map = map;
  }

  Epic clone() => Epic.fromMap(toJson(), true);
}

class ProjectEdge extends MapObject {
  String get cursor => map["cursor"];
  set cursor(String value) => map["cursor"] = value;
  Project get node {
    if (map['node'] is Project) return map['node'];
    return map['node'] = Project.fromMap(map['node']);
  }

  set node(Project value) => map["node"] = value;
  static ProjectEdge fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return ProjectEdge()..map = map;
  }

  ProjectEdge clone() => ProjectEdge.fromMap(toJson(), true);
}

class ProjectConnection extends MapObject {
  List<ProjectEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<ProjectEdge>)
      return map['edges'];

    List<ProjectEdge> items = [];
    for (dynamic aVar in map['edges']) items.add(ProjectEdge.fromMap(aVar));

    return map['edges'] = items;
  }

  set edges(List<ProjectEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'];
    return map['pageInfo'] = PageInfo.fromMap(map['pageInfo']);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static ProjectConnection fromMap(Map<String, dynamic> map,
      [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return ProjectConnection()..map = map;
  }

  ProjectConnection clone() => ProjectConnection.fromMap(toJson(), true);
}

class GroupPermissions extends MapObject {
  bool get readGroup => map["readGroup"];
  set readGroup(bool value) => map["readGroup"] = value;
  static GroupPermissions fromMap(Map<String, dynamic> map,
      [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return GroupPermissions()..map = map;
  }

  GroupPermissions clone() => GroupPermissions.fromMap(toJson(), true);
}

class Group extends MapObject {
  String get avatarUrl => map["avatarUrl"];
  set avatarUrl(String value) => map["avatarUrl"] = value;
  String get description => map["description"];
  set description(String value) => map["description"] = value;
  String get descriptionHtml => map["descriptionHtml"];
  set descriptionHtml(String value) => map["descriptionHtml"] = value;
  Epic get epic {
    if (map['epic'] is Epic) return map['epic'];
    return map['epic'] = Epic.fromMap(map['epic']);
  }

  set epic(Epic value) => map["epic"] = value;
  EpicConnection get epics {
    if (map['epics'] is EpicConnection) return map['epics'];
    return map['epics'] = EpicConnection.fromMap(map['epics']);
  }

  set epics(EpicConnection value) => map["epics"] = value;
  bool get epicsEnabled => map["epicsEnabled"];
  set epicsEnabled(bool value) => map["epicsEnabled"] = value;
  String get fullName => map["fullName"];
  set fullName(String value) => map["fullName"] = value;
  String get fullPath => map["fullPath"];
  set fullPath(String value) => map["fullPath"] = value;
  String get id => map["id"];
  set id(String value) => map["id"] = value;
  bool get lfsEnabled => map["lfsEnabled"];
  set lfsEnabled(bool value) => map["lfsEnabled"] = value;
  String get name => map["name"];
  set name(String value) => map["name"] = value;
  Group get parent {
    if (map['parent'] is Group) return map['parent'];
    return map['parent'] = Group.fromMap(map['parent']);
  }

  set parent(Group value) => map["parent"] = value;
  String get path => map["path"];
  set path(String value) => map["path"] = value;
  ProjectConnection get projects {
    if (map['projects'] is ProjectConnection) return map['projects'];
    return map['projects'] = ProjectConnection.fromMap(map['projects']);
  }

  set projects(ProjectConnection value) => map["projects"] = value;
  bool get requestAccessEnabled => map["requestAccessEnabled"];
  set requestAccessEnabled(bool value) => map["requestAccessEnabled"] = value;
  GroupPermissions get userPermissions {
    if (map['userPermissions'] is GroupPermissions)
      return map['userPermissions'];
    return map['userPermissions'] =
        GroupPermissions.fromMap(map['userPermissions']);
  }

  set userPermissions(GroupPermissions value) => map["userPermissions"] = value;
  String get visibility => map["visibility"];
  set visibility(String value) => map["visibility"] = value;
  String get webUrl => map["webUrl"];
  set webUrl(String value) => map["webUrl"] = value;
  static Group fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return Group()..map = map;
  }

  Group clone() => Group.fromMap(toJson(), true);
}

class IssueEdge extends MapObject {
  String get cursor => map["cursor"];
  set cursor(String value) => map["cursor"] = value;
  Issue get node {
    if (map['node'] is Issue) return map['node'];
    return map['node'] = Issue.fromMap(map['node']);
  }

  set node(Issue value) => map["node"] = value;
  static IssueEdge fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return IssueEdge()..map = map;
  }

  IssueEdge clone() => IssueEdge.fromMap(toJson(), true);
}

class IssueConnection extends MapObject {
  List<IssueEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<IssueEdge>)
      return map['edges'];

    List<IssueEdge> items = [];
    for (dynamic aVar in map['edges']) items.add(IssueEdge.fromMap(aVar));

    return map['edges'] = items;
  }

  set edges(List<IssueEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'];
    return map['pageInfo'] = PageInfo.fromMap(map['pageInfo']);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static IssueConnection fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return IssueConnection()..map = map;
  }

  IssueConnection clone() => IssueConnection.fromMap(toJson(), true);
}

class DetailedStatus extends MapObject {
  String get detailsPath => map["detailsPath"];
  set detailsPath(String value) => map["detailsPath"] = value;
  String get favicon => map["favicon"];
  set favicon(String value) => map["favicon"] = value;
  String get group => map["group"];
  set group(String value) => map["group"] = value;
  bool get hasDetails => map["hasDetails"];
  set hasDetails(bool value) => map["hasDetails"] = value;
  String get icon => map["icon"];
  set icon(String value) => map["icon"] = value;
  String get label => map["label"];
  set label(String value) => map["label"] = value;
  String get text => map["text"];
  set text(String value) => map["text"] = value;
  String get tooltip => map["tooltip"];
  set tooltip(String value) => map["tooltip"] = value;
  static DetailedStatus fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return DetailedStatus()..map = map;
  }

  DetailedStatus clone() => DetailedStatus.fromMap(toJson(), true);
}

class PipelinePermissions extends MapObject {
  bool get adminPipeline => map["adminPipeline"];
  set adminPipeline(bool value) => map["adminPipeline"] = value;
  bool get destroyPipeline => map["destroyPipeline"];
  set destroyPipeline(bool value) => map["destroyPipeline"] = value;
  bool get updatePipeline => map["updatePipeline"];
  set updatePipeline(bool value) => map["updatePipeline"] = value;
  static PipelinePermissions fromMap(Map<String, dynamic> map,
      [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return PipelinePermissions()..map = map;
  }

  PipelinePermissions clone() => PipelinePermissions.fromMap(toJson(), true);
}

class Pipeline extends MapObject {
  String get beforeSha => map["beforeSha"];
  set beforeSha(String value) => map["beforeSha"] = value;
  dynamic get committedAt => map["committedAt"];
  set committedAt(dynamic value) => map["committedAt"] = value;
  double get coverage => map["coverage"];
  set coverage(double value) => map["coverage"] = value;
  dynamic get createdAt => map["createdAt"];
  set createdAt(dynamic value) => map["createdAt"] = value;
  DetailedStatus get detailedStatus {
    if (map['detailedStatus'] is DetailedStatus) return map['detailedStatus'];
    return map['detailedStatus'] =
        DetailedStatus.fromMap(map['detailedStatus']);
  }

  set detailedStatus(DetailedStatus value) => map["detailedStatus"] = value;
  int get duration => map["duration"];
  set duration(int value) => map["duration"] = value;
  dynamic get finishedAt => map["finishedAt"];
  set finishedAt(dynamic value) => map["finishedAt"] = value;
  String get id => map["id"];
  set id(String value) => map["id"] = value;
  String get iid => map["iid"];
  set iid(String value) => map["iid"] = value;
  String get sha => map["sha"];
  set sha(String value) => map["sha"] = value;
  dynamic get startedAt => map["startedAt"];
  set startedAt(dynamic value) => map["startedAt"] = value;
  String get status => map["status"];
  set status(String value) => map["status"] = value;
  dynamic get updatedAt => map["updatedAt"];
  set updatedAt(dynamic value) => map["updatedAt"] = value;
  PipelinePermissions get userPermissions {
    if (map['userPermissions'] is PipelinePermissions)
      return map['userPermissions'];
    return map['userPermissions'] =
        PipelinePermissions.fromMap(map['userPermissions']);
  }

  set userPermissions(PipelinePermissions value) =>
      map["userPermissions"] = value;
  static Pipeline fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return Pipeline()..map = map;
  }

  Pipeline clone() => Pipeline.fromMap(toJson(), true);
}

class PipelineEdge extends MapObject {
  String get cursor => map["cursor"];
  set cursor(String value) => map["cursor"] = value;
  Pipeline get node {
    if (map['node'] is Pipeline) return map['node'];
    return map['node'] = Pipeline.fromMap(map['node']);
  }

  set node(Pipeline value) => map["node"] = value;
  static PipelineEdge fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return PipelineEdge()..map = map;
  }

  PipelineEdge clone() => PipelineEdge.fromMap(toJson(), true);
}

class PipelineConnection extends MapObject {
  List<PipelineEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<PipelineEdge>)
      return map['edges'];

    List<PipelineEdge> items = [];
    for (dynamic aVar in map['edges']) items.add(PipelineEdge.fromMap(aVar));

    return map['edges'] = items;
  }

  set edges(List<PipelineEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'];
    return map['pageInfo'] = PageInfo.fromMap(map['pageInfo']);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static PipelineConnection fromMap(Map<String, dynamic> map,
      [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return PipelineConnection()..map = map;
  }

  PipelineConnection clone() => PipelineConnection.fromMap(toJson(), true);
}

class MergeRequestPermissions extends MapObject {
  bool get adminMergeRequest => map["adminMergeRequest"];
  set adminMergeRequest(bool value) => map["adminMergeRequest"] = value;
  bool get cherryPickOnCurrentMergeRequest =>
      map["cherryPickOnCurrentMergeRequest"];
  set cherryPickOnCurrentMergeRequest(bool value) =>
      map["cherryPickOnCurrentMergeRequest"] = value;
  bool get createNote => map["createNote"];
  set createNote(bool value) => map["createNote"] = value;
  bool get pushToSourceBranch => map["pushToSourceBranch"];
  set pushToSourceBranch(bool value) => map["pushToSourceBranch"] = value;
  bool get readMergeRequest => map["readMergeRequest"];
  set readMergeRequest(bool value) => map["readMergeRequest"] = value;
  bool get removeSourceBranch => map["removeSourceBranch"];
  set removeSourceBranch(bool value) => map["removeSourceBranch"] = value;
  bool get revertOnCurrentMergeRequest => map["revertOnCurrentMergeRequest"];
  set revertOnCurrentMergeRequest(bool value) =>
      map["revertOnCurrentMergeRequest"] = value;
  bool get updateMergeRequest => map["updateMergeRequest"];
  set updateMergeRequest(bool value) => map["updateMergeRequest"] = value;
  static MergeRequestPermissions fromMap(Map<String, dynamic> map,
      [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return MergeRequestPermissions()..map = map;
  }

  MergeRequestPermissions clone() =>
      MergeRequestPermissions.fromMap(toJson(), true);
}

class MergeRequest extends MapObject {
  bool get allowCollaboration => map["allowCollaboration"];
  set allowCollaboration(bool value) => map["allowCollaboration"] = value;
  dynamic get createdAt => map["createdAt"];
  set createdAt(dynamic value) => map["createdAt"] = value;
  String get defaultMergeCommitMessage => map["defaultMergeCommitMessage"];
  set defaultMergeCommitMessage(String value) =>
      map["defaultMergeCommitMessage"] = value;
  String get description => map["description"];
  set description(String value) => map["description"] = value;
  String get descriptionHtml => map["descriptionHtml"];
  set descriptionHtml(String value) => map["descriptionHtml"] = value;
  String get diffHeadSha => map["diffHeadSha"];
  set diffHeadSha(String value) => map["diffHeadSha"] = value;
  DiffRefs get diffRefs {
    if (map['diffRefs'] is DiffRefs) return map['diffRefs'];
    return map['diffRefs'] = DiffRefs.fromMap(map['diffRefs']);
  }

  set diffRefs(DiffRefs value) => map["diffRefs"] = value;
  DiscussionConnection get discussions {
    if (map['discussions'] is DiscussionConnection) return map['discussions'];
    return map['discussions'] =
        DiscussionConnection.fromMap(map['discussions']);
  }

  set discussions(DiscussionConnection value) => map["discussions"] = value;
  int get downvotes => map["downvotes"];
  set downvotes(int value) => map["downvotes"] = value;
  bool get forceRemoveSourceBranch => map["forceRemoveSourceBranch"];
  set forceRemoveSourceBranch(bool value) =>
      map["forceRemoveSourceBranch"] = value;
  Pipeline get headPipeline {
    if (map['headPipeline'] is Pipeline) return map['headPipeline'];
    return map['headPipeline'] = Pipeline.fromMap(map['headPipeline']);
  }

  set headPipeline(Pipeline value) => map["headPipeline"] = value;
  String get id => map["id"];
  set id(String value) => map["id"] = value;
  String get iid => map["iid"];
  set iid(String value) => map["iid"] = value;
  String get inProgressMergeCommitSha => map["inProgressMergeCommitSha"];
  set inProgressMergeCommitSha(String value) =>
      map["inProgressMergeCommitSha"] = value;
  String get mergeCommitMessage => map["mergeCommitMessage"];
  set mergeCommitMessage(String value) => map["mergeCommitMessage"] = value;
  String get mergeCommitSha => map["mergeCommitSha"];
  set mergeCommitSha(String value) => map["mergeCommitSha"] = value;
  String get mergeError => map["mergeError"];
  set mergeError(String value) => map["mergeError"] = value;
  bool get mergeOngoing => map["mergeOngoing"];
  set mergeOngoing(bool value) => map["mergeOngoing"] = value;
  String get mergeStatus => map["mergeStatus"];
  set mergeStatus(String value) => map["mergeStatus"] = value;
  bool get mergeWhenPipelineSucceeds => map["mergeWhenPipelineSucceeds"];
  set mergeWhenPipelineSucceeds(bool value) =>
      map["mergeWhenPipelineSucceeds"] = value;
  bool get mergeableDiscussionsState => map["mergeableDiscussionsState"];
  set mergeableDiscussionsState(bool value) =>
      map["mergeableDiscussionsState"] = value;
  NoteConnection get notes {
    if (map['notes'] is NoteConnection) return map['notes'];
    return map['notes'] = NoteConnection.fromMap(map['notes']);
  }

  set notes(NoteConnection value) => map["notes"] = value;
  PipelineConnection get pipelines {
    if (map['pipelines'] is PipelineConnection) return map['pipelines'];
    return map['pipelines'] = PipelineConnection.fromMap(map['pipelines']);
  }

  set pipelines(PipelineConnection value) => map["pipelines"] = value;
  Project get project {
    if (map['project'] is Project) return map['project'];
    return map['project'] = Project.fromMap(map['project']);
  }

  set project(Project value) => map["project"] = value;
  int get projectId => map["projectId"];
  set projectId(int value) => map["projectId"] = value;
  String get rebaseCommitSha => map["rebaseCommitSha"];
  set rebaseCommitSha(String value) => map["rebaseCommitSha"] = value;
  bool get rebaseInProgress => map["rebaseInProgress"];
  set rebaseInProgress(bool value) => map["rebaseInProgress"] = value;
  bool get shouldBeRebased => map["shouldBeRebased"];
  set shouldBeRebased(bool value) => map["shouldBeRebased"] = value;
  bool get shouldRemoveSourceBranch => map["shouldRemoveSourceBranch"];
  set shouldRemoveSourceBranch(bool value) =>
      map["shouldRemoveSourceBranch"] = value;
  String get sourceBranch => map["sourceBranch"];
  set sourceBranch(String value) => map["sourceBranch"] = value;
  bool get sourceBranchExists => map["sourceBranchExists"];
  set sourceBranchExists(bool value) => map["sourceBranchExists"] = value;
  Project get sourceProject {
    if (map['sourceProject'] is Project) return map['sourceProject'];
    return map['sourceProject'] = Project.fromMap(map['sourceProject']);
  }

  set sourceProject(Project value) => map["sourceProject"] = value;
  int get sourceProjectId => map["sourceProjectId"];
  set sourceProjectId(int value) => map["sourceProjectId"] = value;
  String get state => map["state"];
  set state(String value) => map["state"] = value;
  bool get subscribed => map["subscribed"];
  set subscribed(bool value) => map["subscribed"] = value;
  String get targetBranch => map["targetBranch"];
  set targetBranch(String value) => map["targetBranch"] = value;
  Project get targetProject {
    if (map['targetProject'] is Project) return map['targetProject'];
    return map['targetProject'] = Project.fromMap(map['targetProject']);
  }

  set targetProject(Project value) => map["targetProject"] = value;
  int get targetProjectId => map["targetProjectId"];
  set targetProjectId(int value) => map["targetProjectId"] = value;
  TaskCompletionStatus get taskCompletionStatus {
    if (map['taskCompletionStatus'] is TaskCompletionStatus)
      return map['taskCompletionStatus'];
    return map['taskCompletionStatus'] =
        TaskCompletionStatus.fromMap(map['taskCompletionStatus']);
  }

  set taskCompletionStatus(TaskCompletionStatus value) =>
      map["taskCompletionStatus"] = value;
  String get title => map["title"];
  set title(String value) => map["title"] = value;
  String get titleHtml => map["titleHtml"];
  set titleHtml(String value) => map["titleHtml"] = value;
  dynamic get updatedAt => map["updatedAt"];
  set updatedAt(dynamic value) => map["updatedAt"] = value;
  int get upvotes => map["upvotes"];
  set upvotes(int value) => map["upvotes"] = value;
  int get userNotesCount => map["userNotesCount"];
  set userNotesCount(int value) => map["userNotesCount"] = value;
  MergeRequestPermissions get userPermissions {
    if (map['userPermissions'] is MergeRequestPermissions)
      return map['userPermissions'];
    return map['userPermissions'] =
        MergeRequestPermissions.fromMap(map['userPermissions']);
  }

  set userPermissions(MergeRequestPermissions value) =>
      map["userPermissions"] = value;
  String get webUrl => map["webUrl"];
  set webUrl(String value) => map["webUrl"] = value;
  bool get workInProgress => map["workInProgress"];
  set workInProgress(bool value) => map["workInProgress"] = value;
  static MergeRequest fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return MergeRequest()..map = map;
  }

  MergeRequest clone() => MergeRequest.fromMap(toJson(), true);
}

class MergeRequestEdge extends MapObject {
  String get cursor => map["cursor"];
  set cursor(String value) => map["cursor"] = value;
  MergeRequest get node {
    if (map['node'] is MergeRequest) return map['node'];
    return map['node'] = MergeRequest.fromMap(map['node']);
  }

  set node(MergeRequest value) => map["node"] = value;
  static MergeRequestEdge fromMap(Map<String, dynamic> map,
      [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return MergeRequestEdge()..map = map;
  }

  MergeRequestEdge clone() => MergeRequestEdge.fromMap(toJson(), true);
}

class MergeRequestConnection extends MapObject {
  List<MergeRequestEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<MergeRequestEdge>)
      return map['edges'];

    List<MergeRequestEdge> items = [];
    for (dynamic aVar in map['edges'])
      items.add(MergeRequestEdge.fromMap(aVar));

    return map['edges'] = items;
  }

  set edges(List<MergeRequestEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'];
    return map['pageInfo'] = PageInfo.fromMap(map['pageInfo']);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static MergeRequestConnection fromMap(Map<String, dynamic> map,
      [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return MergeRequestConnection()..map = map;
  }

  MergeRequestConnection clone() =>
      MergeRequestConnection.fromMap(toJson(), true);
}

class Namespace extends MapObject {
  String get description => map["description"];
  set description(String value) => map["description"] = value;
  String get descriptionHtml => map["descriptionHtml"];
  set descriptionHtml(String value) => map["descriptionHtml"] = value;
  String get fullName => map["fullName"];
  set fullName(String value) => map["fullName"] = value;
  String get fullPath => map["fullPath"];
  set fullPath(String value) => map["fullPath"] = value;
  String get id => map["id"];
  set id(String value) => map["id"] = value;
  bool get lfsEnabled => map["lfsEnabled"];
  set lfsEnabled(bool value) => map["lfsEnabled"] = value;
  String get name => map["name"];
  set name(String value) => map["name"] = value;
  String get path => map["path"];
  set path(String value) => map["path"] = value;
  ProjectConnection get projects {
    if (map['projects'] is ProjectConnection) return map['projects'];
    return map['projects'] = ProjectConnection.fromMap(map['projects']);
  }

  set projects(ProjectConnection value) => map["projects"] = value;
  bool get requestAccessEnabled => map["requestAccessEnabled"];
  set requestAccessEnabled(bool value) => map["requestAccessEnabled"] = value;
  String get visibility => map["visibility"];
  set visibility(String value) => map["visibility"] = value;
  static Namespace fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return Namespace()..map = map;
  }

  Namespace clone() => Namespace.fromMap(toJson(), true);
}

class Blob extends MapObject {
  String get flatPath => map["flatPath"];
  set flatPath(String value) => map["flatPath"] = value;
  String get id => map["id"];
  set id(String value) => map["id"] = value;
  String get lfsOid => map["lfsOid"];
  set lfsOid(String value) => map["lfsOid"] = value;
  String get name => map["name"];
  set name(String value) => map["name"] = value;
  String get path => map["path"];
  set path(String value) => map["path"] = value;
  String get type => map["type"];
  set type(String value) => map["type"] = value;
  String get webUrl => map["webUrl"];
  set webUrl(String value) => map["webUrl"] = value;
  static Blob fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return Blob()..map = map;
  }

  Blob clone() => Blob.fromMap(toJson(), true);
}

class BlobEdge extends MapObject {
  String get cursor => map["cursor"];
  set cursor(String value) => map["cursor"] = value;
  Blob get node {
    if (map['node'] is Blob) return map['node'];
    return map['node'] = Blob.fromMap(map['node']);
  }

  set node(Blob value) => map["node"] = value;
  static BlobEdge fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return BlobEdge()..map = map;
  }

  BlobEdge clone() => BlobEdge.fromMap(toJson(), true);
}

class BlobConnection extends MapObject {
  List<BlobEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<BlobEdge>)
      return map['edges'];

    List<BlobEdge> items = [];
    for (dynamic aVar in map['edges']) items.add(BlobEdge.fromMap(aVar));

    return map['edges'] = items;
  }

  set edges(List<BlobEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'];
    return map['pageInfo'] = PageInfo.fromMap(map['pageInfo']);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static BlobConnection fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return BlobConnection()..map = map;
  }

  BlobConnection clone() => BlobConnection.fromMap(toJson(), true);
}

class Commit extends MapObject {
  User get author {
    if (map['author'] is User) return map['author'];
    return map['author'] = User.fromMap(map['author']);
  }

  set author(User value) => map["author"] = value;
  dynamic get authoredDate => map["authoredDate"];
  set authoredDate(dynamic value) => map["authoredDate"] = value;
  String get description => map["description"];
  set description(String value) => map["description"] = value;
  String get id => map["id"];
  set id(String value) => map["id"] = value;
  Pipeline get latestPipeline {
    if (map['latestPipeline'] is Pipeline) return map['latestPipeline'];
    return map['latestPipeline'] = Pipeline.fromMap(map['latestPipeline']);
  }

  set latestPipeline(Pipeline value) => map["latestPipeline"] = value;
  String get message => map["message"];
  set message(String value) => map["message"] = value;
  String get sha => map["sha"];
  set sha(String value) => map["sha"] = value;
  String get title => map["title"];
  set title(String value) => map["title"] = value;
  String get webUrl => map["webUrl"];
  set webUrl(String value) => map["webUrl"] = value;
  static Commit fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return Commit()..map = map;
  }

  Commit clone() => Commit.fromMap(toJson(), true);
}

class Submodule extends MapObject {
  String get flatPath => map["flatPath"];
  set flatPath(String value) => map["flatPath"] = value;
  String get id => map["id"];
  set id(String value) => map["id"] = value;
  String get name => map["name"];
  set name(String value) => map["name"] = value;
  String get path => map["path"];
  set path(String value) => map["path"] = value;
  String get treeUrl => map["treeUrl"];
  set treeUrl(String value) => map["treeUrl"] = value;
  String get type => map["type"];
  set type(String value) => map["type"] = value;
  String get webUrl => map["webUrl"];
  set webUrl(String value) => map["webUrl"] = value;
  static Submodule fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return Submodule()..map = map;
  }

  Submodule clone() => Submodule.fromMap(toJson(), true);
}

class SubmoduleEdge extends MapObject {
  String get cursor => map["cursor"];
  set cursor(String value) => map["cursor"] = value;
  Submodule get node {
    if (map['node'] is Submodule) return map['node'];
    return map['node'] = Submodule.fromMap(map['node']);
  }

  set node(Submodule value) => map["node"] = value;
  static SubmoduleEdge fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return SubmoduleEdge()..map = map;
  }

  SubmoduleEdge clone() => SubmoduleEdge.fromMap(toJson(), true);
}

class SubmoduleConnection extends MapObject {
  List<SubmoduleEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<SubmoduleEdge>)
      return map['edges'];

    List<SubmoduleEdge> items = [];
    for (dynamic aVar in map['edges']) items.add(SubmoduleEdge.fromMap(aVar));

    return map['edges'] = items;
  }

  set edges(List<SubmoduleEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'];
    return map['pageInfo'] = PageInfo.fromMap(map['pageInfo']);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static SubmoduleConnection fromMap(Map<String, dynamic> map,
      [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return SubmoduleConnection()..map = map;
  }

  SubmoduleConnection clone() => SubmoduleConnection.fromMap(toJson(), true);
}

class TreeEntry extends MapObject {
  String get flatPath => map["flatPath"];
  set flatPath(String value) => map["flatPath"] = value;
  String get id => map["id"];
  set id(String value) => map["id"] = value;
  String get name => map["name"];
  set name(String value) => map["name"] = value;
  String get path => map["path"];
  set path(String value) => map["path"] = value;
  String get type => map["type"];
  set type(String value) => map["type"] = value;
  String get webUrl => map["webUrl"];
  set webUrl(String value) => map["webUrl"] = value;
  static TreeEntry fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return TreeEntry()..map = map;
  }

  TreeEntry clone() => TreeEntry.fromMap(toJson(), true);
}

class TreeEntryEdge extends MapObject {
  String get cursor => map["cursor"];
  set cursor(String value) => map["cursor"] = value;
  TreeEntry get node {
    if (map['node'] is TreeEntry) return map['node'];
    return map['node'] = TreeEntry.fromMap(map['node']);
  }

  set node(TreeEntry value) => map["node"] = value;
  static TreeEntryEdge fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return TreeEntryEdge()..map = map;
  }

  TreeEntryEdge clone() => TreeEntryEdge.fromMap(toJson(), true);
}

class TreeEntryConnection extends MapObject {
  List<TreeEntryEdge> get edges {
    if (map['edges'] == null || map['edges'] is List<TreeEntryEdge>)
      return map['edges'];

    List<TreeEntryEdge> items = [];
    for (dynamic aVar in map['edges']) items.add(TreeEntryEdge.fromMap(aVar));

    return map['edges'] = items;
  }

  set edges(List<TreeEntryEdge> value) => map["edges"] = value;
  PageInfo get pageInfo {
    if (map['pageInfo'] is PageInfo) return map['pageInfo'];
    return map['pageInfo'] = PageInfo.fromMap(map['pageInfo']);
  }

  set pageInfo(PageInfo value) => map["pageInfo"] = value;
  static TreeEntryConnection fromMap(Map<String, dynamic> map,
      [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return TreeEntryConnection()..map = map;
  }

  TreeEntryConnection clone() => TreeEntryConnection.fromMap(toJson(), true);
}

class Tree extends MapObject {
  BlobConnection get blobs {
    if (map['blobs'] is BlobConnection) return map['blobs'];
    return map['blobs'] = BlobConnection.fromMap(map['blobs']);
  }

  set blobs(BlobConnection value) => map["blobs"] = value;
  Commit get lastCommit {
    if (map['lastCommit'] is Commit) return map['lastCommit'];
    return map['lastCommit'] = Commit.fromMap(map['lastCommit']);
  }

  set lastCommit(Commit value) => map["lastCommit"] = value;
  SubmoduleConnection get submodules {
    if (map['submodules'] is SubmoduleConnection) return map['submodules'];
    return map['submodules'] = SubmoduleConnection.fromMap(map['submodules']);
  }

  set submodules(SubmoduleConnection value) => map["submodules"] = value;
  TreeEntryConnection get trees {
    if (map['trees'] is TreeEntryConnection) return map['trees'];
    return map['trees'] = TreeEntryConnection.fromMap(map['trees']);
  }

  set trees(TreeEntryConnection value) => map["trees"] = value;
  static Tree fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return Tree()..map = map;
  }

  Tree clone() => Tree.fromMap(toJson(), true);
}

class Repository extends MapObject {
  bool get empty => map["empty"];
  set empty(bool value) => map["empty"] = value;
  bool get exists => map["exists"];
  set exists(bool value) => map["exists"] = value;
  String get rootRef => map["rootRef"];
  set rootRef(String value) => map["rootRef"] = value;
  Tree get tree {
    if (map['tree'] is Tree) return map['tree'];
    return map['tree'] = Tree.fromMap(map['tree']);
  }

  set tree(Tree value) => map["tree"] = value;
  static Repository fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return Repository()..map = map;
  }

  Repository clone() => Repository.fromMap(toJson(), true);
}

class ProjectStatistics extends MapObject {
  int get buildArtifactsSize => map["buildArtifactsSize"];
  set buildArtifactsSize(int value) => map["buildArtifactsSize"] = value;
  int get commitCount => map["commitCount"];
  set commitCount(int value) => map["commitCount"] = value;
  int get lfsObjectsSize => map["lfsObjectsSize"];
  set lfsObjectsSize(int value) => map["lfsObjectsSize"] = value;
  int get packagesSize => map["packagesSize"];
  set packagesSize(int value) => map["packagesSize"] = value;
  int get repositorySize => map["repositorySize"];
  set repositorySize(int value) => map["repositorySize"] = value;
  int get storageSize => map["storageSize"];
  set storageSize(int value) => map["storageSize"] = value;
  int get wikiSize => map["wikiSize"];
  set wikiSize(int value) => map["wikiSize"] = value;
  static ProjectStatistics fromMap(Map<String, dynamic> map,
      [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return ProjectStatistics()..map = map;
  }

  ProjectStatistics clone() => ProjectStatistics.fromMap(toJson(), true);
}

class ProjectPermissions extends MapObject {
  bool get adminProject => map["adminProject"];
  set adminProject(bool value) => map["adminProject"] = value;
  bool get adminRemoteMirror => map["adminRemoteMirror"];
  set adminRemoteMirror(bool value) => map["adminRemoteMirror"] = value;
  bool get adminWiki => map["adminWiki"];
  set adminWiki(bool value) => map["adminWiki"] = value;
  bool get archiveProject => map["archiveProject"];
  set archiveProject(bool value) => map["archiveProject"] = value;
  bool get changeNamespace => map["changeNamespace"];
  set changeNamespace(bool value) => map["changeNamespace"] = value;
  bool get changeVisibilityLevel => map["changeVisibilityLevel"];
  set changeVisibilityLevel(bool value) => map["changeVisibilityLevel"] = value;
  bool get createDeployment => map["createDeployment"];
  set createDeployment(bool value) => map["createDeployment"] = value;
  bool get createDesign => map["createDesign"];
  set createDesign(bool value) => map["createDesign"] = value;
  bool get createIssue => map["createIssue"];
  set createIssue(bool value) => map["createIssue"] = value;
  bool get createLabel => map["createLabel"];
  set createLabel(bool value) => map["createLabel"] = value;
  bool get createMergeRequestFrom => map["createMergeRequestFrom"];
  set createMergeRequestFrom(bool value) =>
      map["createMergeRequestFrom"] = value;
  bool get createMergeRequestIn => map["createMergeRequestIn"];
  set createMergeRequestIn(bool value) => map["createMergeRequestIn"] = value;
  bool get createPages => map["createPages"];
  set createPages(bool value) => map["createPages"] = value;
  bool get createPipeline => map["createPipeline"];
  set createPipeline(bool value) => map["createPipeline"] = value;
  bool get createPipelineSchedule => map["createPipelineSchedule"];
  set createPipelineSchedule(bool value) =>
      map["createPipelineSchedule"] = value;
  bool get createProjectSnippet => map["createProjectSnippet"];
  set createProjectSnippet(bool value) => map["createProjectSnippet"] = value;
  bool get createWiki => map["createWiki"];
  set createWiki(bool value) => map["createWiki"] = value;
  bool get destroyDesign => map["destroyDesign"];
  set destroyDesign(bool value) => map["destroyDesign"] = value;
  bool get destroyPages => map["destroyPages"];
  set destroyPages(bool value) => map["destroyPages"] = value;
  bool get destroyWiki => map["destroyWiki"];
  set destroyWiki(bool value) => map["destroyWiki"] = value;
  bool get downloadCode => map["downloadCode"];
  set downloadCode(bool value) => map["downloadCode"] = value;
  bool get downloadWikiCode => map["downloadWikiCode"];
  set downloadWikiCode(bool value) => map["downloadWikiCode"] = value;
  bool get forkProject => map["forkProject"];
  set forkProject(bool value) => map["forkProject"] = value;
  bool get pushCode => map["pushCode"];
  set pushCode(bool value) => map["pushCode"] = value;
  bool get pushToDeleteProtectedBranch => map["pushToDeleteProtectedBranch"];
  set pushToDeleteProtectedBranch(bool value) =>
      map["pushToDeleteProtectedBranch"] = value;
  bool get readCommitStatus => map["readCommitStatus"];
  set readCommitStatus(bool value) => map["readCommitStatus"] = value;
  bool get readCycleAnalytics => map["readCycleAnalytics"];
  set readCycleAnalytics(bool value) => map["readCycleAnalytics"] = value;
  bool get readDesign => map["readDesign"];
  set readDesign(bool value) => map["readDesign"] = value;
  bool get readPagesContent => map["readPagesContent"];
  set readPagesContent(bool value) => map["readPagesContent"] = value;
  bool get readProject => map["readProject"];
  set readProject(bool value) => map["readProject"] = value;
  bool get readProjectMember => map["readProjectMember"];
  set readProjectMember(bool value) => map["readProjectMember"] = value;
  bool get readWiki => map["readWiki"];
  set readWiki(bool value) => map["readWiki"] = value;
  bool get removeForkProject => map["removeForkProject"];
  set removeForkProject(bool value) => map["removeForkProject"] = value;
  bool get removePages => map["removePages"];
  set removePages(bool value) => map["removePages"] = value;
  bool get removeProject => map["removeProject"];
  set removeProject(bool value) => map["removeProject"] = value;
  bool get renameProject => map["renameProject"];
  set renameProject(bool value) => map["renameProject"] = value;
  bool get requestAccess => map["requestAccess"];
  set requestAccess(bool value) => map["requestAccess"] = value;
  bool get updatePages => map["updatePages"];
  set updatePages(bool value) => map["updatePages"] = value;
  bool get updateWiki => map["updateWiki"];
  set updateWiki(bool value) => map["updateWiki"] = value;
  bool get uploadFile => map["uploadFile"];
  set uploadFile(bool value) => map["uploadFile"] = value;
  static ProjectPermissions fromMap(Map<String, dynamic> map,
      [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return ProjectPermissions()..map = map;
  }

  ProjectPermissions clone() => ProjectPermissions.fromMap(toJson(), true);
}

class Project extends MapObject {
  bool get archived => map["archived"];
  set archived(bool value) => map["archived"] = value;
  String get avatarUrl => map["avatarUrl"];
  set avatarUrl(String value) => map["avatarUrl"] = value;
  bool get containerRegistryEnabled => map["containerRegistryEnabled"];
  set containerRegistryEnabled(bool value) =>
      map["containerRegistryEnabled"] = value;
  dynamic get createdAt => map["createdAt"];
  set createdAt(dynamic value) => map["createdAt"] = value;
  String get description => map["description"];
  set description(String value) => map["description"] = value;
  String get descriptionHtml => map["descriptionHtml"];
  set descriptionHtml(String value) => map["descriptionHtml"] = value;
  int get forksCount => map["forksCount"];
  set forksCount(int value) => map["forksCount"] = value;
  String get fullPath => map["fullPath"];
  set fullPath(String value) => map["fullPath"] = value;
  Group get group {
    if (map['group'] is Group) return map['group'];
    return map['group'] = Group.fromMap(map['group']);
  }

  set group(Group value) => map["group"] = value;
  String get httpUrlToRepo => map["httpUrlToRepo"];
  set httpUrlToRepo(String value) => map["httpUrlToRepo"] = value;
  String get id => map["id"];
  set id(String value) => map["id"] = value;
  String get importStatus => map["importStatus"];
  set importStatus(String value) => map["importStatus"] = value;
  Issue get issue {
    if (map['issue'] is Issue) return map['issue'];
    return map['issue'] = Issue.fromMap(map['issue']);
  }

  set issue(Issue value) => map["issue"] = value;
  IssueConnection get issues {
    if (map['issues'] is IssueConnection) return map['issues'];
    return map['issues'] = IssueConnection.fromMap(map['issues']);
  }

  set issues(IssueConnection value) => map["issues"] = value;
  bool get issuesEnabled => map["issuesEnabled"];
  set issuesEnabled(bool value) => map["issuesEnabled"] = value;
  bool get jobsEnabled => map["jobsEnabled"];
  set jobsEnabled(bool value) => map["jobsEnabled"] = value;
  dynamic get lastActivityAt => map["lastActivityAt"];
  set lastActivityAt(dynamic value) => map["lastActivityAt"] = value;
  bool get lfsEnabled => map["lfsEnabled"];
  set lfsEnabled(bool value) => map["lfsEnabled"] = value;
  MergeRequest get mergeRequest {
    if (map['mergeRequest'] is MergeRequest) return map['mergeRequest'];
    return map['mergeRequest'] = MergeRequest.fromMap(map['mergeRequest']);
  }

  set mergeRequest(MergeRequest value) => map["mergeRequest"] = value;
  MergeRequestConnection get mergeRequests {
    if (map['mergeRequests'] is MergeRequestConnection)
      return map['mergeRequests'];
    return map['mergeRequests'] =
        MergeRequestConnection.fromMap(map['mergeRequests']);
  }

  set mergeRequests(MergeRequestConnection value) =>
      map["mergeRequests"] = value;
  bool get mergeRequestsEnabled => map["mergeRequestsEnabled"];
  set mergeRequestsEnabled(bool value) => map["mergeRequestsEnabled"] = value;
  bool get mergeRequestsFfOnlyEnabled => map["mergeRequestsFfOnlyEnabled"];
  set mergeRequestsFfOnlyEnabled(bool value) =>
      map["mergeRequestsFfOnlyEnabled"] = value;
  String get name => map["name"];
  set name(String value) => map["name"] = value;
  String get nameWithNamespace => map["nameWithNamespace"];
  set nameWithNamespace(String value) => map["nameWithNamespace"] = value;
  Namespace get namespace {
    if (map['namespace'] is Namespace) return map['namespace'];
    return map['namespace'] = Namespace.fromMap(map['namespace']);
  }

  set namespace(Namespace value) => map["namespace"] = value;
  bool get onlyAllowMergeIfAllDiscussionsAreResolved =>
      map["onlyAllowMergeIfAllDiscussionsAreResolved"];
  set onlyAllowMergeIfAllDiscussionsAreResolved(bool value) =>
      map["onlyAllowMergeIfAllDiscussionsAreResolved"] = value;
  bool get onlyAllowMergeIfPipelineSucceeds =>
      map["onlyAllowMergeIfPipelineSucceeds"];
  set onlyAllowMergeIfPipelineSucceeds(bool value) =>
      map["onlyAllowMergeIfPipelineSucceeds"] = value;
  int get openIssuesCount => map["openIssuesCount"];
  set openIssuesCount(int value) => map["openIssuesCount"] = value;
  String get path => map["path"];
  set path(String value) => map["path"] = value;
  PipelineConnection get pipelines {
    if (map['pipelines'] is PipelineConnection) return map['pipelines'];
    return map['pipelines'] = PipelineConnection.fromMap(map['pipelines']);
  }

  set pipelines(PipelineConnection value) => map["pipelines"] = value;
  bool get printingMergeRequestLinkEnabled =>
      map["printingMergeRequestLinkEnabled"];
  set printingMergeRequestLinkEnabled(bool value) =>
      map["printingMergeRequestLinkEnabled"] = value;
  bool get publicJobs => map["publicJobs"];
  set publicJobs(bool value) => map["publicJobs"] = value;
  Repository get repository {
    if (map['repository'] is Repository) return map['repository'];
    return map['repository'] = Repository.fromMap(map['repository']);
  }

  set repository(Repository value) => map["repository"] = value;
  bool get requestAccessEnabled => map["requestAccessEnabled"];
  set requestAccessEnabled(bool value) => map["requestAccessEnabled"] = value;
  bool get sharedRunnersEnabled => map["sharedRunnersEnabled"];
  set sharedRunnersEnabled(bool value) => map["sharedRunnersEnabled"] = value;
  bool get snippetsEnabled => map["snippetsEnabled"];
  set snippetsEnabled(bool value) => map["snippetsEnabled"] = value;
  String get sshUrlToRepo => map["sshUrlToRepo"];
  set sshUrlToRepo(String value) => map["sshUrlToRepo"] = value;
  int get starCount => map["starCount"];
  set starCount(int value) => map["starCount"] = value;
  ProjectStatistics get statistics {
    if (map['statistics'] is ProjectStatistics) return map['statistics'];
    return map['statistics'] = ProjectStatistics.fromMap(map['statistics']);
  }

  set statistics(ProjectStatistics value) => map["statistics"] = value;
  String get tagList => map["tagList"];
  set tagList(String value) => map["tagList"] = value;
  ProjectPermissions get userPermissions {
    if (map['userPermissions'] is ProjectPermissions)
      return map['userPermissions'];
    return map['userPermissions'] =
        ProjectPermissions.fromMap(map['userPermissions']);
  }

  set userPermissions(ProjectPermissions value) =>
      map["userPermissions"] = value;
  String get visibility => map["visibility"];
  set visibility(String value) => map["visibility"] = value;
  String get webUrl => map["webUrl"];
  set webUrl(String value) => map["webUrl"] = value;
  bool get wikiEnabled => map["wikiEnabled"];
  set wikiEnabled(bool value) => map["wikiEnabled"] = value;
  static Project fromMap(Map<String, dynamic> map, [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return Project()..map = map;
  }

  Project clone() => Project.fromMap(toJson(), true);
}

class GitlabCEIssueLabels_OperationResult extends MapObject {
  Project get project {
    if (map['project'] is Project) return map['project'];
    return map['project'] = Project.fromMap(map['project']);
  }

  set project(Project value) => map["project"] = value;
  static GitlabCEIssueLabels_OperationResult fromMap(Map<String, dynamic> map,
      [deepCopy = false]) {
    if (map == null) return null;
    if (deepCopy) map = jsonDecode(jsonEncode(map));
    return GitlabCEIssueLabels_OperationResult()..map = map;
  }

  GitlabCEIssueLabels_OperationResult clone() =>
      GitlabCEIssueLabels_OperationResult.fromMap(toJson(), true);
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
  return new GraphqlQuery(
      query, {"firstN": firstN}, GitlabCEIssueLabels_OperationResult.fromMap);
}
