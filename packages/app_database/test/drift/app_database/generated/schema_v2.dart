// dart format width=80
// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
import 'package:drift/drift.dart';

class ReplyDrafts extends Table with TableInfo<ReplyDrafts, ReplyDraftsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ReplyDrafts(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> parentHtmlText = GeneratedColumn<String>(
    'parent_html_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    parentId,
    userId,
    updatedAt,
    url,
    parentHtmlText,
    content,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reply_drafts';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {userId, parentId},
  ];
  @override
  ReplyDraftsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReplyDraftsData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      parentHtmlText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_html_text'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
    );
  }

  @override
  ReplyDrafts createAlias(String alias) {
    return ReplyDrafts(attachedDatabase, alias);
  }
}

class ReplyDraftsData extends DataClass implements Insertable<ReplyDraftsData> {
  final int id;
  final String parentId;
  final String userId;
  final DateTime updatedAt;
  final String url;
  final String parentHtmlText;
  final String content;
  const ReplyDraftsData({
    required this.id,
    required this.parentId,
    required this.userId,
    required this.updatedAt,
    required this.url,
    required this.parentHtmlText,
    required this.content,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['parent_id'] = Variable<String>(parentId);
    map['user_id'] = Variable<String>(userId);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['url'] = Variable<String>(url);
    map['parent_html_text'] = Variable<String>(parentHtmlText);
    map['content'] = Variable<String>(content);
    return map;
  }

  ReplyDraftsCompanion toCompanion(bool nullToAbsent) {
    return ReplyDraftsCompanion(
      id: Value(id),
      parentId: Value(parentId),
      userId: Value(userId),
      updatedAt: Value(updatedAt),
      url: Value(url),
      parentHtmlText: Value(parentHtmlText),
      content: Value(content),
    );
  }

  factory ReplyDraftsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReplyDraftsData(
      id: serializer.fromJson<int>(json['id']),
      parentId: serializer.fromJson<String>(json['parentId']),
      userId: serializer.fromJson<String>(json['userId']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      url: serializer.fromJson<String>(json['url']),
      parentHtmlText: serializer.fromJson<String>(json['parentHtmlText']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'parentId': serializer.toJson<String>(parentId),
      'userId': serializer.toJson<String>(userId),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'url': serializer.toJson<String>(url),
      'parentHtmlText': serializer.toJson<String>(parentHtmlText),
      'content': serializer.toJson<String>(content),
    };
  }

  ReplyDraftsData copyWith({
    int? id,
    String? parentId,
    String? userId,
    DateTime? updatedAt,
    String? url,
    String? parentHtmlText,
    String? content,
  }) => ReplyDraftsData(
    id: id ?? this.id,
    parentId: parentId ?? this.parentId,
    userId: userId ?? this.userId,
    updatedAt: updatedAt ?? this.updatedAt,
    url: url ?? this.url,
    parentHtmlText: parentHtmlText ?? this.parentHtmlText,
    content: content ?? this.content,
  );
  ReplyDraftsData copyWithCompanion(ReplyDraftsCompanion data) {
    return ReplyDraftsData(
      id: data.id.present ? data.id.value : this.id,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      userId: data.userId.present ? data.userId.value : this.userId,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      url: data.url.present ? data.url.value : this.url,
      parentHtmlText: data.parentHtmlText.present
          ? data.parentHtmlText.value
          : this.parentHtmlText,
      content: data.content.present ? data.content.value : this.content,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReplyDraftsData(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('userId: $userId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('url: $url, ')
          ..write('parentHtmlText: $parentHtmlText, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    parentId,
    userId,
    updatedAt,
    url,
    parentHtmlText,
    content,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReplyDraftsData &&
          other.id == this.id &&
          other.parentId == this.parentId &&
          other.userId == this.userId &&
          other.updatedAt == this.updatedAt &&
          other.url == this.url &&
          other.parentHtmlText == this.parentHtmlText &&
          other.content == this.content);
}

class ReplyDraftsCompanion extends UpdateCompanion<ReplyDraftsData> {
  final Value<int> id;
  final Value<String> parentId;
  final Value<String> userId;
  final Value<DateTime> updatedAt;
  final Value<String> url;
  final Value<String> parentHtmlText;
  final Value<String> content;
  const ReplyDraftsCompanion({
    this.id = const Value.absent(),
    this.parentId = const Value.absent(),
    this.userId = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.url = const Value.absent(),
    this.parentHtmlText = const Value.absent(),
    this.content = const Value.absent(),
  });
  ReplyDraftsCompanion.insert({
    this.id = const Value.absent(),
    required String parentId,
    required String userId,
    required DateTime updatedAt,
    required String url,
    required String parentHtmlText,
    required String content,
  }) : parentId = Value(parentId),
       userId = Value(userId),
       updatedAt = Value(updatedAt),
       url = Value(url),
       parentHtmlText = Value(parentHtmlText),
       content = Value(content);
  static Insertable<ReplyDraftsData> custom({
    Expression<int>? id,
    Expression<String>? parentId,
    Expression<String>? userId,
    Expression<DateTime>? updatedAt,
    Expression<String>? url,
    Expression<String>? parentHtmlText,
    Expression<String>? content,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentId != null) 'parent_id': parentId,
      if (userId != null) 'user_id': userId,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (url != null) 'url': url,
      if (parentHtmlText != null) 'parent_html_text': parentHtmlText,
      if (content != null) 'content': content,
    });
  }

  ReplyDraftsCompanion copyWith({
    Value<int>? id,
    Value<String>? parentId,
    Value<String>? userId,
    Value<DateTime>? updatedAt,
    Value<String>? url,
    Value<String>? parentHtmlText,
    Value<String>? content,
  }) {
    return ReplyDraftsCompanion(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      userId: userId ?? this.userId,
      updatedAt: updatedAt ?? this.updatedAt,
      url: url ?? this.url,
      parentHtmlText: parentHtmlText ?? this.parentHtmlText,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (parentHtmlText.present) {
      map['parent_html_text'] = Variable<String>(parentHtmlText.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReplyDraftsCompanion(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('userId: $userId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('url: $url, ')
          ..write('parentHtmlText: $parentHtmlText, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

class CommentDrafts extends Table
    with TableInfo<CommentDrafts, CommentDraftsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CommentDrafts(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> postTitle = GeneratedColumn<String>(
    'post_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    parentId,
    userId,
    updatedAt,
    postTitle,
    content,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'comment_drafts';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {userId, parentId},
  ];
  @override
  CommentDraftsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CommentDraftsData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      postTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}post_title'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
    );
  }

  @override
  CommentDrafts createAlias(String alias) {
    return CommentDrafts(attachedDatabase, alias);
  }
}

class CommentDraftsData extends DataClass
    implements Insertable<CommentDraftsData> {
  final int id;
  final String parentId;
  final String userId;
  final DateTime updatedAt;
  final String postTitle;
  final String content;
  const CommentDraftsData({
    required this.id,
    required this.parentId,
    required this.userId,
    required this.updatedAt,
    required this.postTitle,
    required this.content,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['parent_id'] = Variable<String>(parentId);
    map['user_id'] = Variable<String>(userId);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['post_title'] = Variable<String>(postTitle);
    map['content'] = Variable<String>(content);
    return map;
  }

  CommentDraftsCompanion toCompanion(bool nullToAbsent) {
    return CommentDraftsCompanion(
      id: Value(id),
      parentId: Value(parentId),
      userId: Value(userId),
      updatedAt: Value(updatedAt),
      postTitle: Value(postTitle),
      content: Value(content),
    );
  }

  factory CommentDraftsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CommentDraftsData(
      id: serializer.fromJson<int>(json['id']),
      parentId: serializer.fromJson<String>(json['parentId']),
      userId: serializer.fromJson<String>(json['userId']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      postTitle: serializer.fromJson<String>(json['postTitle']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'parentId': serializer.toJson<String>(parentId),
      'userId': serializer.toJson<String>(userId),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'postTitle': serializer.toJson<String>(postTitle),
      'content': serializer.toJson<String>(content),
    };
  }

  CommentDraftsData copyWith({
    int? id,
    String? parentId,
    String? userId,
    DateTime? updatedAt,
    String? postTitle,
    String? content,
  }) => CommentDraftsData(
    id: id ?? this.id,
    parentId: parentId ?? this.parentId,
    userId: userId ?? this.userId,
    updatedAt: updatedAt ?? this.updatedAt,
    postTitle: postTitle ?? this.postTitle,
    content: content ?? this.content,
  );
  CommentDraftsData copyWithCompanion(CommentDraftsCompanion data) {
    return CommentDraftsData(
      id: data.id.present ? data.id.value : this.id,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      userId: data.userId.present ? data.userId.value : this.userId,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      postTitle: data.postTitle.present ? data.postTitle.value : this.postTitle,
      content: data.content.present ? data.content.value : this.content,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CommentDraftsData(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('userId: $userId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('postTitle: $postTitle, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, parentId, userId, updatedAt, postTitle, content);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CommentDraftsData &&
          other.id == this.id &&
          other.parentId == this.parentId &&
          other.userId == this.userId &&
          other.updatedAt == this.updatedAt &&
          other.postTitle == this.postTitle &&
          other.content == this.content);
}

class CommentDraftsCompanion extends UpdateCompanion<CommentDraftsData> {
  final Value<int> id;
  final Value<String> parentId;
  final Value<String> userId;
  final Value<DateTime> updatedAt;
  final Value<String> postTitle;
  final Value<String> content;
  const CommentDraftsCompanion({
    this.id = const Value.absent(),
    this.parentId = const Value.absent(),
    this.userId = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.postTitle = const Value.absent(),
    this.content = const Value.absent(),
  });
  CommentDraftsCompanion.insert({
    this.id = const Value.absent(),
    required String parentId,
    required String userId,
    required DateTime updatedAt,
    required String postTitle,
    required String content,
  }) : parentId = Value(parentId),
       userId = Value(userId),
       updatedAt = Value(updatedAt),
       postTitle = Value(postTitle),
       content = Value(content);
  static Insertable<CommentDraftsData> custom({
    Expression<int>? id,
    Expression<String>? parentId,
    Expression<String>? userId,
    Expression<DateTime>? updatedAt,
    Expression<String>? postTitle,
    Expression<String>? content,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentId != null) 'parent_id': parentId,
      if (userId != null) 'user_id': userId,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (postTitle != null) 'post_title': postTitle,
      if (content != null) 'content': content,
    });
  }

  CommentDraftsCompanion copyWith({
    Value<int>? id,
    Value<String>? parentId,
    Value<String>? userId,
    Value<DateTime>? updatedAt,
    Value<String>? postTitle,
    Value<String>? content,
  }) {
    return CommentDraftsCompanion(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      userId: userId ?? this.userId,
      updatedAt: updatedAt ?? this.updatedAt,
      postTitle: postTitle ?? this.postTitle,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (postTitle.present) {
      map['post_title'] = Variable<String>(postTitle.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommentDraftsCompanion(')
          ..write('id: $id, ')
          ..write('parentId: $parentId, ')
          ..write('userId: $userId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('postTitle: $postTitle, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

class VisitedPosts extends Table
    with TableInfo<VisitedPosts, VisitedPostsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  VisitedPosts(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> postId = GeneratedColumn<String>(
    'post_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [postId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'visited_posts';
  @override
  Set<GeneratedColumn> get $primaryKey => {postId};
  @override
  VisitedPostsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VisitedPostsData(
      postId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}post_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  VisitedPosts createAlias(String alias) {
    return VisitedPosts(attachedDatabase, alias);
  }
}

class VisitedPostsData extends DataClass
    implements Insertable<VisitedPostsData> {
  final String postId;
  final DateTime createdAt;
  const VisitedPostsData({required this.postId, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['post_id'] = Variable<String>(postId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  VisitedPostsCompanion toCompanion(bool nullToAbsent) {
    return VisitedPostsCompanion(
      postId: Value(postId),
      createdAt: Value(createdAt),
    );
  }

  factory VisitedPostsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VisitedPostsData(
      postId: serializer.fromJson<String>(json['postId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'postId': serializer.toJson<String>(postId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  VisitedPostsData copyWith({String? postId, DateTime? createdAt}) =>
      VisitedPostsData(
        postId: postId ?? this.postId,
        createdAt: createdAt ?? this.createdAt,
      );
  VisitedPostsData copyWithCompanion(VisitedPostsCompanion data) {
    return VisitedPostsData(
      postId: data.postId.present ? data.postId.value : this.postId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VisitedPostsData(')
          ..write('postId: $postId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(postId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VisitedPostsData &&
          other.postId == this.postId &&
          other.createdAt == this.createdAt);
}

class VisitedPostsCompanion extends UpdateCompanion<VisitedPostsData> {
  final Value<String> postId;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const VisitedPostsCompanion({
    this.postId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VisitedPostsCompanion.insert({
    required String postId,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : postId = Value(postId),
       createdAt = Value(createdAt);
  static Insertable<VisitedPostsData> custom({
    Expression<String>? postId,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (postId != null) 'post_id': postId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VisitedPostsCompanion copyWith({
    Value<String>? postId,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return VisitedPostsCompanion(
      postId: postId ?? this.postId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (postId.present) {
      map['post_id'] = Variable<String>(postId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VisitedPostsCompanion(')
          ..write('postId: $postId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV2 extends GeneratedDatabase {
  DatabaseAtV2(QueryExecutor e) : super(e);
  late final ReplyDrafts replyDrafts = ReplyDrafts(this);
  late final CommentDrafts commentDrafts = CommentDrafts(this);
  late final VisitedPosts visitedPosts = VisitedPosts(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    replyDrafts,
    commentDrafts,
    visitedPosts,
  ];
  @override
  int get schemaVersion => 2;
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}
