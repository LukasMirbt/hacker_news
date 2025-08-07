// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CommentDraftsTable extends CommentDrafts
    with TableInfo<$CommentDraftsTable, CommentDraftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CommentDraftsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _postIdMeta = const VerificationMeta('postId');
  @override
  late final GeneratedColumn<String> postId = GeneratedColumn<String>(
    'post_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _postUserIdMeta = const VerificationMeta(
    'postUserId',
  );
  @override
  late final GeneratedColumn<String> postUserId = GeneratedColumn<String>(
    'post_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _postTitleMeta = const VerificationMeta(
    'postTitle',
  );
  @override
  late final GeneratedColumn<String> postTitle = GeneratedColumn<String>(
    'post_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _draftMeta = const VerificationMeta('draft');
  @override
  late final GeneratedColumn<String> draft = GeneratedColumn<String>(
    'draft',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    userId,
    postId,
    createdAt,
    postUserId,
    postTitle,
    draft,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'comment_drafts';
  @override
  VerificationContext validateIntegrity(
    Insertable<CommentDraftData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('post_id')) {
      context.handle(
        _postIdMeta,
        postId.isAcceptableOrUnknown(data['post_id']!, _postIdMeta),
      );
    } else if (isInserting) {
      context.missing(_postIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('post_user_id')) {
      context.handle(
        _postUserIdMeta,
        postUserId.isAcceptableOrUnknown(
          data['post_user_id']!,
          _postUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_postUserIdMeta);
    }
    if (data.containsKey('post_title')) {
      context.handle(
        _postTitleMeta,
        postTitle.isAcceptableOrUnknown(data['post_title']!, _postTitleMeta),
      );
    } else if (isInserting) {
      context.missing(_postTitleMeta);
    }
    if (data.containsKey('draft')) {
      context.handle(
        _draftMeta,
        draft.isAcceptableOrUnknown(data['draft']!, _draftMeta),
      );
    } else if (isInserting) {
      context.missing(_draftMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId, postId};
  @override
  CommentDraftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CommentDraftData(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      postId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}post_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      postUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}post_user_id'],
      )!,
      postTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}post_title'],
      )!,
      draft: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}draft'],
      )!,
    );
  }

  @override
  $CommentDraftsTable createAlias(String alias) {
    return $CommentDraftsTable(attachedDatabase, alias);
  }
}

class CommentDraftData extends DataClass
    implements Insertable<CommentDraftData> {
  final String userId;
  final String postId;
  final DateTime createdAt;
  final String postUserId;
  final String postTitle;
  final String draft;
  const CommentDraftData({
    required this.userId,
    required this.postId,
    required this.createdAt,
    required this.postUserId,
    required this.postTitle,
    required this.draft,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['post_id'] = Variable<String>(postId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['post_user_id'] = Variable<String>(postUserId);
    map['post_title'] = Variable<String>(postTitle);
    map['draft'] = Variable<String>(draft);
    return map;
  }

  CommentDraftsCompanion toCompanion(bool nullToAbsent) {
    return CommentDraftsCompanion(
      userId: Value(userId),
      postId: Value(postId),
      createdAt: Value(createdAt),
      postUserId: Value(postUserId),
      postTitle: Value(postTitle),
      draft: Value(draft),
    );
  }

  factory CommentDraftData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CommentDraftData(
      userId: serializer.fromJson<String>(json['userId']),
      postId: serializer.fromJson<String>(json['postId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      postUserId: serializer.fromJson<String>(json['postUserId']),
      postTitle: serializer.fromJson<String>(json['postTitle']),
      draft: serializer.fromJson<String>(json['draft']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'postId': serializer.toJson<String>(postId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'postUserId': serializer.toJson<String>(postUserId),
      'postTitle': serializer.toJson<String>(postTitle),
      'draft': serializer.toJson<String>(draft),
    };
  }

  CommentDraftData copyWith({
    String? userId,
    String? postId,
    DateTime? createdAt,
    String? postUserId,
    String? postTitle,
    String? draft,
  }) => CommentDraftData(
    userId: userId ?? this.userId,
    postId: postId ?? this.postId,
    createdAt: createdAt ?? this.createdAt,
    postUserId: postUserId ?? this.postUserId,
    postTitle: postTitle ?? this.postTitle,
    draft: draft ?? this.draft,
  );
  CommentDraftData copyWithCompanion(CommentDraftsCompanion data) {
    return CommentDraftData(
      userId: data.userId.present ? data.userId.value : this.userId,
      postId: data.postId.present ? data.postId.value : this.postId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      postUserId: data.postUserId.present
          ? data.postUserId.value
          : this.postUserId,
      postTitle: data.postTitle.present ? data.postTitle.value : this.postTitle,
      draft: data.draft.present ? data.draft.value : this.draft,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CommentDraftData(')
          ..write('userId: $userId, ')
          ..write('postId: $postId, ')
          ..write('createdAt: $createdAt, ')
          ..write('postUserId: $postUserId, ')
          ..write('postTitle: $postTitle, ')
          ..write('draft: $draft')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(userId, postId, createdAt, postUserId, postTitle, draft);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CommentDraftData &&
          other.userId == this.userId &&
          other.postId == this.postId &&
          other.createdAt == this.createdAt &&
          other.postUserId == this.postUserId &&
          other.postTitle == this.postTitle &&
          other.draft == this.draft);
}

class CommentDraftsCompanion extends UpdateCompanion<CommentDraftData> {
  final Value<String> userId;
  final Value<String> postId;
  final Value<DateTime> createdAt;
  final Value<String> postUserId;
  final Value<String> postTitle;
  final Value<String> draft;
  final Value<int> rowid;
  const CommentDraftsCompanion({
    this.userId = const Value.absent(),
    this.postId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.postUserId = const Value.absent(),
    this.postTitle = const Value.absent(),
    this.draft = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CommentDraftsCompanion.insert({
    required String userId,
    required String postId,
    this.createdAt = const Value.absent(),
    required String postUserId,
    required String postTitle,
    required String draft,
    this.rowid = const Value.absent(),
  }) : userId = Value(userId),
       postId = Value(postId),
       postUserId = Value(postUserId),
       postTitle = Value(postTitle),
       draft = Value(draft);
  static Insertable<CommentDraftData> custom({
    Expression<String>? userId,
    Expression<String>? postId,
    Expression<DateTime>? createdAt,
    Expression<String>? postUserId,
    Expression<String>? postTitle,
    Expression<String>? draft,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (postId != null) 'post_id': postId,
      if (createdAt != null) 'created_at': createdAt,
      if (postUserId != null) 'post_user_id': postUserId,
      if (postTitle != null) 'post_title': postTitle,
      if (draft != null) 'draft': draft,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CommentDraftsCompanion copyWith({
    Value<String>? userId,
    Value<String>? postId,
    Value<DateTime>? createdAt,
    Value<String>? postUserId,
    Value<String>? postTitle,
    Value<String>? draft,
    Value<int>? rowid,
  }) {
    return CommentDraftsCompanion(
      userId: userId ?? this.userId,
      postId: postId ?? this.postId,
      createdAt: createdAt ?? this.createdAt,
      postUserId: postUserId ?? this.postUserId,
      postTitle: postTitle ?? this.postTitle,
      draft: draft ?? this.draft,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (postId.present) {
      map['post_id'] = Variable<String>(postId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (postUserId.present) {
      map['post_user_id'] = Variable<String>(postUserId.value);
    }
    if (postTitle.present) {
      map['post_title'] = Variable<String>(postTitle.value);
    }
    if (draft.present) {
      map['draft'] = Variable<String>(draft.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommentDraftsCompanion(')
          ..write('userId: $userId, ')
          ..write('postId: $postId, ')
          ..write('createdAt: $createdAt, ')
          ..write('postUserId: $postUserId, ')
          ..write('postTitle: $postTitle, ')
          ..write('draft: $draft, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReplyDraftsTable extends ReplyDrafts
    with TableInfo<$ReplyDraftsTable, ReplyDraftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReplyDraftsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parentUserIdMeta = const VerificationMeta(
    'parentUserId',
  );
  @override
  late final GeneratedColumn<String> parentUserId = GeneratedColumn<String>(
    'parent_user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parentHtmlTextMeta = const VerificationMeta(
    'parentHtmlText',
  );
  @override
  late final GeneratedColumn<String> parentHtmlText = GeneratedColumn<String>(
    'parent_html_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _draftMeta = const VerificationMeta('draft');
  @override
  late final GeneratedColumn<String> draft = GeneratedColumn<String>(
    'draft',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    userId,
    parentId,
    createdAt,
    url,
    parentUserId,
    parentHtmlText,
    draft,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reply_drafts';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReplyDraftData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_parentIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('parent_user_id')) {
      context.handle(
        _parentUserIdMeta,
        parentUserId.isAcceptableOrUnknown(
          data['parent_user_id']!,
          _parentUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_parentUserIdMeta);
    }
    if (data.containsKey('parent_html_text')) {
      context.handle(
        _parentHtmlTextMeta,
        parentHtmlText.isAcceptableOrUnknown(
          data['parent_html_text']!,
          _parentHtmlTextMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_parentHtmlTextMeta);
    }
    if (data.containsKey('draft')) {
      context.handle(
        _draftMeta,
        draft.isAcceptableOrUnknown(data['draft']!, _draftMeta),
      );
    } else if (isInserting) {
      context.missing(_draftMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId, parentId};
  @override
  ReplyDraftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReplyDraftData(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      parentUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_user_id'],
      )!,
      parentHtmlText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_html_text'],
      )!,
      draft: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}draft'],
      )!,
    );
  }

  @override
  $ReplyDraftsTable createAlias(String alias) {
    return $ReplyDraftsTable(attachedDatabase, alias);
  }
}

class ReplyDraftData extends DataClass implements Insertable<ReplyDraftData> {
  final String userId;
  final String parentId;
  final DateTime createdAt;
  final String url;
  final String parentUserId;
  final String parentHtmlText;
  final String draft;
  const ReplyDraftData({
    required this.userId,
    required this.parentId,
    required this.createdAt,
    required this.url,
    required this.parentUserId,
    required this.parentHtmlText,
    required this.draft,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['parent_id'] = Variable<String>(parentId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['url'] = Variable<String>(url);
    map['parent_user_id'] = Variable<String>(parentUserId);
    map['parent_html_text'] = Variable<String>(parentHtmlText);
    map['draft'] = Variable<String>(draft);
    return map;
  }

  ReplyDraftsCompanion toCompanion(bool nullToAbsent) {
    return ReplyDraftsCompanion(
      userId: Value(userId),
      parentId: Value(parentId),
      createdAt: Value(createdAt),
      url: Value(url),
      parentUserId: Value(parentUserId),
      parentHtmlText: Value(parentHtmlText),
      draft: Value(draft),
    );
  }

  factory ReplyDraftData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReplyDraftData(
      userId: serializer.fromJson<String>(json['userId']),
      parentId: serializer.fromJson<String>(json['parentId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      url: serializer.fromJson<String>(json['url']),
      parentUserId: serializer.fromJson<String>(json['parentUserId']),
      parentHtmlText: serializer.fromJson<String>(json['parentHtmlText']),
      draft: serializer.fromJson<String>(json['draft']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'parentId': serializer.toJson<String>(parentId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'url': serializer.toJson<String>(url),
      'parentUserId': serializer.toJson<String>(parentUserId),
      'parentHtmlText': serializer.toJson<String>(parentHtmlText),
      'draft': serializer.toJson<String>(draft),
    };
  }

  ReplyDraftData copyWith({
    String? userId,
    String? parentId,
    DateTime? createdAt,
    String? url,
    String? parentUserId,
    String? parentHtmlText,
    String? draft,
  }) => ReplyDraftData(
    userId: userId ?? this.userId,
    parentId: parentId ?? this.parentId,
    createdAt: createdAt ?? this.createdAt,
    url: url ?? this.url,
    parentUserId: parentUserId ?? this.parentUserId,
    parentHtmlText: parentHtmlText ?? this.parentHtmlText,
    draft: draft ?? this.draft,
  );
  ReplyDraftData copyWithCompanion(ReplyDraftsCompanion data) {
    return ReplyDraftData(
      userId: data.userId.present ? data.userId.value : this.userId,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      url: data.url.present ? data.url.value : this.url,
      parentUserId: data.parentUserId.present
          ? data.parentUserId.value
          : this.parentUserId,
      parentHtmlText: data.parentHtmlText.present
          ? data.parentHtmlText.value
          : this.parentHtmlText,
      draft: data.draft.present ? data.draft.value : this.draft,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReplyDraftData(')
          ..write('userId: $userId, ')
          ..write('parentId: $parentId, ')
          ..write('createdAt: $createdAt, ')
          ..write('url: $url, ')
          ..write('parentUserId: $parentUserId, ')
          ..write('parentHtmlText: $parentHtmlText, ')
          ..write('draft: $draft')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    userId,
    parentId,
    createdAt,
    url,
    parentUserId,
    parentHtmlText,
    draft,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReplyDraftData &&
          other.userId == this.userId &&
          other.parentId == this.parentId &&
          other.createdAt == this.createdAt &&
          other.url == this.url &&
          other.parentUserId == this.parentUserId &&
          other.parentHtmlText == this.parentHtmlText &&
          other.draft == this.draft);
}

class ReplyDraftsCompanion extends UpdateCompanion<ReplyDraftData> {
  final Value<String> userId;
  final Value<String> parentId;
  final Value<DateTime> createdAt;
  final Value<String> url;
  final Value<String> parentUserId;
  final Value<String> parentHtmlText;
  final Value<String> draft;
  final Value<int> rowid;
  const ReplyDraftsCompanion({
    this.userId = const Value.absent(),
    this.parentId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.url = const Value.absent(),
    this.parentUserId = const Value.absent(),
    this.parentHtmlText = const Value.absent(),
    this.draft = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReplyDraftsCompanion.insert({
    required String userId,
    required String parentId,
    this.createdAt = const Value.absent(),
    required String url,
    required String parentUserId,
    required String parentHtmlText,
    required String draft,
    this.rowid = const Value.absent(),
  }) : userId = Value(userId),
       parentId = Value(parentId),
       url = Value(url),
       parentUserId = Value(parentUserId),
       parentHtmlText = Value(parentHtmlText),
       draft = Value(draft);
  static Insertable<ReplyDraftData> custom({
    Expression<String>? userId,
    Expression<String>? parentId,
    Expression<DateTime>? createdAt,
    Expression<String>? url,
    Expression<String>? parentUserId,
    Expression<String>? parentHtmlText,
    Expression<String>? draft,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (parentId != null) 'parent_id': parentId,
      if (createdAt != null) 'created_at': createdAt,
      if (url != null) 'url': url,
      if (parentUserId != null) 'parent_user_id': parentUserId,
      if (parentHtmlText != null) 'parent_html_text': parentHtmlText,
      if (draft != null) 'draft': draft,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReplyDraftsCompanion copyWith({
    Value<String>? userId,
    Value<String>? parentId,
    Value<DateTime>? createdAt,
    Value<String>? url,
    Value<String>? parentUserId,
    Value<String>? parentHtmlText,
    Value<String>? draft,
    Value<int>? rowid,
  }) {
    return ReplyDraftsCompanion(
      userId: userId ?? this.userId,
      parentId: parentId ?? this.parentId,
      createdAt: createdAt ?? this.createdAt,
      url: url ?? this.url,
      parentUserId: parentUserId ?? this.parentUserId,
      parentHtmlText: parentHtmlText ?? this.parentHtmlText,
      draft: draft ?? this.draft,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (parentUserId.present) {
      map['parent_user_id'] = Variable<String>(parentUserId.value);
    }
    if (parentHtmlText.present) {
      map['parent_html_text'] = Variable<String>(parentHtmlText.value);
    }
    if (draft.present) {
      map['draft'] = Variable<String>(draft.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReplyDraftsCompanion(')
          ..write('userId: $userId, ')
          ..write('parentId: $parentId, ')
          ..write('createdAt: $createdAt, ')
          ..write('url: $url, ')
          ..write('parentUserId: $parentUserId, ')
          ..write('parentHtmlText: $parentHtmlText, ')
          ..write('draft: $draft, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CommentDraftsTable commentDrafts = $CommentDraftsTable(this);
  late final $ReplyDraftsTable replyDrafts = $ReplyDraftsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    commentDrafts,
    replyDrafts,
  ];
}

typedef $$CommentDraftsTableCreateCompanionBuilder =
    CommentDraftsCompanion Function({
      required String userId,
      required String postId,
      Value<DateTime> createdAt,
      required String postUserId,
      required String postTitle,
      required String draft,
      Value<int> rowid,
    });
typedef $$CommentDraftsTableUpdateCompanionBuilder =
    CommentDraftsCompanion Function({
      Value<String> userId,
      Value<String> postId,
      Value<DateTime> createdAt,
      Value<String> postUserId,
      Value<String> postTitle,
      Value<String> draft,
      Value<int> rowid,
    });

class $$CommentDraftsTableFilterComposer
    extends Composer<_$AppDatabase, $CommentDraftsTable> {
  $$CommentDraftsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get postId => $composableBuilder(
    column: $table.postId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get postUserId => $composableBuilder(
    column: $table.postUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get postTitle => $composableBuilder(
    column: $table.postTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get draft => $composableBuilder(
    column: $table.draft,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CommentDraftsTableOrderingComposer
    extends Composer<_$AppDatabase, $CommentDraftsTable> {
  $$CommentDraftsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get postId => $composableBuilder(
    column: $table.postId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get postUserId => $composableBuilder(
    column: $table.postUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get postTitle => $composableBuilder(
    column: $table.postTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get draft => $composableBuilder(
    column: $table.draft,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CommentDraftsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CommentDraftsTable> {
  $$CommentDraftsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get postId =>
      $composableBuilder(column: $table.postId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get postUserId => $composableBuilder(
    column: $table.postUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get postTitle =>
      $composableBuilder(column: $table.postTitle, builder: (column) => column);

  GeneratedColumn<String> get draft =>
      $composableBuilder(column: $table.draft, builder: (column) => column);
}

class $$CommentDraftsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CommentDraftsTable,
          CommentDraftData,
          $$CommentDraftsTableFilterComposer,
          $$CommentDraftsTableOrderingComposer,
          $$CommentDraftsTableAnnotationComposer,
          $$CommentDraftsTableCreateCompanionBuilder,
          $$CommentDraftsTableUpdateCompanionBuilder,
          (
            CommentDraftData,
            BaseReferences<
              _$AppDatabase,
              $CommentDraftsTable,
              CommentDraftData
            >,
          ),
          CommentDraftData,
          PrefetchHooks Function()
        > {
  $$CommentDraftsTableTableManager(_$AppDatabase db, $CommentDraftsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CommentDraftsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CommentDraftsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CommentDraftsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> userId = const Value.absent(),
                Value<String> postId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> postUserId = const Value.absent(),
                Value<String> postTitle = const Value.absent(),
                Value<String> draft = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CommentDraftsCompanion(
                userId: userId,
                postId: postId,
                createdAt: createdAt,
                postUserId: postUserId,
                postTitle: postTitle,
                draft: draft,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String userId,
                required String postId,
                Value<DateTime> createdAt = const Value.absent(),
                required String postUserId,
                required String postTitle,
                required String draft,
                Value<int> rowid = const Value.absent(),
              }) => CommentDraftsCompanion.insert(
                userId: userId,
                postId: postId,
                createdAt: createdAt,
                postUserId: postUserId,
                postTitle: postTitle,
                draft: draft,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CommentDraftsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CommentDraftsTable,
      CommentDraftData,
      $$CommentDraftsTableFilterComposer,
      $$CommentDraftsTableOrderingComposer,
      $$CommentDraftsTableAnnotationComposer,
      $$CommentDraftsTableCreateCompanionBuilder,
      $$CommentDraftsTableUpdateCompanionBuilder,
      (
        CommentDraftData,
        BaseReferences<_$AppDatabase, $CommentDraftsTable, CommentDraftData>,
      ),
      CommentDraftData,
      PrefetchHooks Function()
    >;
typedef $$ReplyDraftsTableCreateCompanionBuilder =
    ReplyDraftsCompanion Function({
      required String userId,
      required String parentId,
      Value<DateTime> createdAt,
      required String url,
      required String parentUserId,
      required String parentHtmlText,
      required String draft,
      Value<int> rowid,
    });
typedef $$ReplyDraftsTableUpdateCompanionBuilder =
    ReplyDraftsCompanion Function({
      Value<String> userId,
      Value<String> parentId,
      Value<DateTime> createdAt,
      Value<String> url,
      Value<String> parentUserId,
      Value<String> parentHtmlText,
      Value<String> draft,
      Value<int> rowid,
    });

class $$ReplyDraftsTableFilterComposer
    extends Composer<_$AppDatabase, $ReplyDraftsTable> {
  $$ReplyDraftsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentUserId => $composableBuilder(
    column: $table.parentUserId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentHtmlText => $composableBuilder(
    column: $table.parentHtmlText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get draft => $composableBuilder(
    column: $table.draft,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReplyDraftsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReplyDraftsTable> {
  $$ReplyDraftsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentUserId => $composableBuilder(
    column: $table.parentUserId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentHtmlText => $composableBuilder(
    column: $table.parentHtmlText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get draft => $composableBuilder(
    column: $table.draft,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReplyDraftsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReplyDraftsTable> {
  $$ReplyDraftsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get parentUserId => $composableBuilder(
    column: $table.parentUserId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get parentHtmlText => $composableBuilder(
    column: $table.parentHtmlText,
    builder: (column) => column,
  );

  GeneratedColumn<String> get draft =>
      $composableBuilder(column: $table.draft, builder: (column) => column);
}

class $$ReplyDraftsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReplyDraftsTable,
          ReplyDraftData,
          $$ReplyDraftsTableFilterComposer,
          $$ReplyDraftsTableOrderingComposer,
          $$ReplyDraftsTableAnnotationComposer,
          $$ReplyDraftsTableCreateCompanionBuilder,
          $$ReplyDraftsTableUpdateCompanionBuilder,
          (
            ReplyDraftData,
            BaseReferences<_$AppDatabase, $ReplyDraftsTable, ReplyDraftData>,
          ),
          ReplyDraftData,
          PrefetchHooks Function()
        > {
  $$ReplyDraftsTableTableManager(_$AppDatabase db, $ReplyDraftsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReplyDraftsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReplyDraftsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReplyDraftsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> userId = const Value.absent(),
                Value<String> parentId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<String> parentUserId = const Value.absent(),
                Value<String> parentHtmlText = const Value.absent(),
                Value<String> draft = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReplyDraftsCompanion(
                userId: userId,
                parentId: parentId,
                createdAt: createdAt,
                url: url,
                parentUserId: parentUserId,
                parentHtmlText: parentHtmlText,
                draft: draft,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String userId,
                required String parentId,
                Value<DateTime> createdAt = const Value.absent(),
                required String url,
                required String parentUserId,
                required String parentHtmlText,
                required String draft,
                Value<int> rowid = const Value.absent(),
              }) => ReplyDraftsCompanion.insert(
                userId: userId,
                parentId: parentId,
                createdAt: createdAt,
                url: url,
                parentUserId: parentUserId,
                parentHtmlText: parentHtmlText,
                draft: draft,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReplyDraftsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReplyDraftsTable,
      ReplyDraftData,
      $$ReplyDraftsTableFilterComposer,
      $$ReplyDraftsTableOrderingComposer,
      $$ReplyDraftsTableAnnotationComposer,
      $$ReplyDraftsTableCreateCompanionBuilder,
      $$ReplyDraftsTableUpdateCompanionBuilder,
      (
        ReplyDraftData,
        BaseReferences<_$AppDatabase, $ReplyDraftsTable, ReplyDraftData>,
      ),
      ReplyDraftData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CommentDraftsTableTableManager get commentDrafts =>
      $$CommentDraftsTableTableManager(_db, _db.commentDrafts);
  $$ReplyDraftsTableTableManager get replyDrafts =>
      $$ReplyDraftsTableTableManager(_db, _db.replyDrafts);
}
