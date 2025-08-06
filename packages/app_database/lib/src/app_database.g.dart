// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CommentDraftTableTable extends CommentDraftTable
    with TableInfo<$CommentDraftTableTable, CommentDraftTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CommentDraftTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
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
  static const VerificationMeta _postIdMeta = const VerificationMeta('postId');
  @override
  late final GeneratedColumn<String> postId = GeneratedColumn<String>(
    'post_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _postUserMeta = const VerificationMeta(
    'postUser',
  );
  @override
  late final GeneratedColumn<String> postUser = GeneratedColumn<String>(
    'post_user',
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
    id,
    createdAt,
    postId,
    postUser,
    postTitle,
    draft,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'comment_draft_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CommentDraftTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('post_id')) {
      context.handle(
        _postIdMeta,
        postId.isAcceptableOrUnknown(data['post_id']!, _postIdMeta),
      );
    } else if (isInserting) {
      context.missing(_postIdMeta);
    }
    if (data.containsKey('post_user')) {
      context.handle(
        _postUserMeta,
        postUser.isAcceptableOrUnknown(data['post_user']!, _postUserMeta),
      );
    } else if (isInserting) {
      context.missing(_postUserMeta);
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CommentDraftTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CommentDraftTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      postId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}post_id'],
      )!,
      postUser: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}post_user'],
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
  $CommentDraftTableTable createAlias(String alias) {
    return $CommentDraftTableTable(attachedDatabase, alias);
  }
}

class CommentDraftTableData extends DataClass
    implements Insertable<CommentDraftTableData> {
  final int id;
  final DateTime createdAt;
  final String postId;
  final String postUser;
  final String postTitle;
  final String draft;
  const CommentDraftTableData({
    required this.id,
    required this.createdAt,
    required this.postId,
    required this.postUser,
    required this.postTitle,
    required this.draft,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['post_id'] = Variable<String>(postId);
    map['post_user'] = Variable<String>(postUser);
    map['post_title'] = Variable<String>(postTitle);
    map['draft'] = Variable<String>(draft);
    return map;
  }

  CommentDraftTableCompanion toCompanion(bool nullToAbsent) {
    return CommentDraftTableCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      postId: Value(postId),
      postUser: Value(postUser),
      postTitle: Value(postTitle),
      draft: Value(draft),
    );
  }

  factory CommentDraftTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CommentDraftTableData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      postId: serializer.fromJson<String>(json['postId']),
      postUser: serializer.fromJson<String>(json['postUser']),
      postTitle: serializer.fromJson<String>(json['postTitle']),
      draft: serializer.fromJson<String>(json['draft']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'postId': serializer.toJson<String>(postId),
      'postUser': serializer.toJson<String>(postUser),
      'postTitle': serializer.toJson<String>(postTitle),
      'draft': serializer.toJson<String>(draft),
    };
  }

  CommentDraftTableData copyWith({
    int? id,
    DateTime? createdAt,
    String? postId,
    String? postUser,
    String? postTitle,
    String? draft,
  }) => CommentDraftTableData(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    postId: postId ?? this.postId,
    postUser: postUser ?? this.postUser,
    postTitle: postTitle ?? this.postTitle,
    draft: draft ?? this.draft,
  );
  CommentDraftTableData copyWithCompanion(CommentDraftTableCompanion data) {
    return CommentDraftTableData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      postId: data.postId.present ? data.postId.value : this.postId,
      postUser: data.postUser.present ? data.postUser.value : this.postUser,
      postTitle: data.postTitle.present ? data.postTitle.value : this.postTitle,
      draft: data.draft.present ? data.draft.value : this.draft,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CommentDraftTableData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('postId: $postId, ')
          ..write('postUser: $postUser, ')
          ..write('postTitle: $postTitle, ')
          ..write('draft: $draft')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, postId, postUser, postTitle, draft);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CommentDraftTableData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.postId == this.postId &&
          other.postUser == this.postUser &&
          other.postTitle == this.postTitle &&
          other.draft == this.draft);
}

class CommentDraftTableCompanion
    extends UpdateCompanion<CommentDraftTableData> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<String> postId;
  final Value<String> postUser;
  final Value<String> postTitle;
  final Value<String> draft;
  const CommentDraftTableCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.postId = const Value.absent(),
    this.postUser = const Value.absent(),
    this.postTitle = const Value.absent(),
    this.draft = const Value.absent(),
  });
  CommentDraftTableCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required String postId,
    required String postUser,
    required String postTitle,
    required String draft,
  }) : postId = Value(postId),
       postUser = Value(postUser),
       postTitle = Value(postTitle),
       draft = Value(draft);
  static Insertable<CommentDraftTableData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<String>? postId,
    Expression<String>? postUser,
    Expression<String>? postTitle,
    Expression<String>? draft,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (postId != null) 'post_id': postId,
      if (postUser != null) 'post_user': postUser,
      if (postTitle != null) 'post_title': postTitle,
      if (draft != null) 'draft': draft,
    });
  }

  CommentDraftTableCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? createdAt,
    Value<String>? postId,
    Value<String>? postUser,
    Value<String>? postTitle,
    Value<String>? draft,
  }) {
    return CommentDraftTableCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      postId: postId ?? this.postId,
      postUser: postUser ?? this.postUser,
      postTitle: postTitle ?? this.postTitle,
      draft: draft ?? this.draft,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (postId.present) {
      map['post_id'] = Variable<String>(postId.value);
    }
    if (postUser.present) {
      map['post_user'] = Variable<String>(postUser.value);
    }
    if (postTitle.present) {
      map['post_title'] = Variable<String>(postTitle.value);
    }
    if (draft.present) {
      map['draft'] = Variable<String>(draft.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommentDraftTableCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('postId: $postId, ')
          ..write('postUser: $postUser, ')
          ..write('postTitle: $postTitle, ')
          ..write('draft: $draft')
          ..write(')'))
        .toString();
  }
}

class $ReplyDraftsTable extends ReplyDrafts
    with TableInfo<$ReplyDraftsTable, ReplyDraft> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReplyDraftsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
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
  static const VerificationMeta _parentUserMeta = const VerificationMeta(
    'parentUser',
  );
  @override
  late final GeneratedColumn<String> parentUser = GeneratedColumn<String>(
    'parent_user',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parentTextMeta = const VerificationMeta(
    'parentText',
  );
  @override
  late final GeneratedColumn<String> parentText = GeneratedColumn<String>(
    'parent_text',
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
    id,
    createdAt,
    url,
    parentUser,
    parentText,
    draft,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reply_drafts';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReplyDraft> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('parent_user')) {
      context.handle(
        _parentUserMeta,
        parentUser.isAcceptableOrUnknown(data['parent_user']!, _parentUserMeta),
      );
    } else if (isInserting) {
      context.missing(_parentUserMeta);
    }
    if (data.containsKey('parent_text')) {
      context.handle(
        _parentTextMeta,
        parentText.isAcceptableOrUnknown(data['parent_text']!, _parentTextMeta),
      );
    } else if (isInserting) {
      context.missing(_parentTextMeta);
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReplyDraft map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReplyDraft(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      parentUser: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_user'],
      )!,
      parentText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_text'],
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

class ReplyDraft extends DataClass implements Insertable<ReplyDraft> {
  final int id;
  final DateTime createdAt;
  final String url;
  final String parentUser;
  final String parentText;
  final String draft;
  const ReplyDraft({
    required this.id,
    required this.createdAt,
    required this.url,
    required this.parentUser,
    required this.parentText,
    required this.draft,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['url'] = Variable<String>(url);
    map['parent_user'] = Variable<String>(parentUser);
    map['parent_text'] = Variable<String>(parentText);
    map['draft'] = Variable<String>(draft);
    return map;
  }

  ReplyDraftsCompanion toCompanion(bool nullToAbsent) {
    return ReplyDraftsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      url: Value(url),
      parentUser: Value(parentUser),
      parentText: Value(parentText),
      draft: Value(draft),
    );
  }

  factory ReplyDraft.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReplyDraft(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      url: serializer.fromJson<String>(json['url']),
      parentUser: serializer.fromJson<String>(json['parentUser']),
      parentText: serializer.fromJson<String>(json['parentText']),
      draft: serializer.fromJson<String>(json['draft']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'url': serializer.toJson<String>(url),
      'parentUser': serializer.toJson<String>(parentUser),
      'parentText': serializer.toJson<String>(parentText),
      'draft': serializer.toJson<String>(draft),
    };
  }

  ReplyDraft copyWith({
    int? id,
    DateTime? createdAt,
    String? url,
    String? parentUser,
    String? parentText,
    String? draft,
  }) => ReplyDraft(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    url: url ?? this.url,
    parentUser: parentUser ?? this.parentUser,
    parentText: parentText ?? this.parentText,
    draft: draft ?? this.draft,
  );
  ReplyDraft copyWithCompanion(ReplyDraftsCompanion data) {
    return ReplyDraft(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      url: data.url.present ? data.url.value : this.url,
      parentUser: data.parentUser.present
          ? data.parentUser.value
          : this.parentUser,
      parentText: data.parentText.present
          ? data.parentText.value
          : this.parentText,
      draft: data.draft.present ? data.draft.value : this.draft,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReplyDraft(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('url: $url, ')
          ..write('parentUser: $parentUser, ')
          ..write('parentText: $parentText, ')
          ..write('draft: $draft')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, url, parentUser, parentText, draft);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReplyDraft &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.url == this.url &&
          other.parentUser == this.parentUser &&
          other.parentText == this.parentText &&
          other.draft == this.draft);
}

class ReplyDraftsCompanion extends UpdateCompanion<ReplyDraft> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<String> url;
  final Value<String> parentUser;
  final Value<String> parentText;
  final Value<String> draft;
  const ReplyDraftsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.url = const Value.absent(),
    this.parentUser = const Value.absent(),
    this.parentText = const Value.absent(),
    this.draft = const Value.absent(),
  });
  ReplyDraftsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required String url,
    required String parentUser,
    required String parentText,
    required String draft,
  }) : url = Value(url),
       parentUser = Value(parentUser),
       parentText = Value(parentText),
       draft = Value(draft);
  static Insertable<ReplyDraft> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<String>? url,
    Expression<String>? parentUser,
    Expression<String>? parentText,
    Expression<String>? draft,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (url != null) 'url': url,
      if (parentUser != null) 'parent_user': parentUser,
      if (parentText != null) 'parent_text': parentText,
      if (draft != null) 'draft': draft,
    });
  }

  ReplyDraftsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? createdAt,
    Value<String>? url,
    Value<String>? parentUser,
    Value<String>? parentText,
    Value<String>? draft,
  }) {
    return ReplyDraftsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      url: url ?? this.url,
      parentUser: parentUser ?? this.parentUser,
      parentText: parentText ?? this.parentText,
      draft: draft ?? this.draft,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (parentUser.present) {
      map['parent_user'] = Variable<String>(parentUser.value);
    }
    if (parentText.present) {
      map['parent_text'] = Variable<String>(parentText.value);
    }
    if (draft.present) {
      map['draft'] = Variable<String>(draft.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReplyDraftsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('url: $url, ')
          ..write('parentUser: $parentUser, ')
          ..write('parentText: $parentText, ')
          ..write('draft: $draft')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CommentDraftTableTable commentDraftTable =
      $CommentDraftTableTable(this);
  late final $ReplyDraftsTable replyDrafts = $ReplyDraftsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    commentDraftTable,
    replyDrafts,
  ];
}

typedef $$CommentDraftTableTableCreateCompanionBuilder =
    CommentDraftTableCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      required String postId,
      required String postUser,
      required String postTitle,
      required String draft,
    });
typedef $$CommentDraftTableTableUpdateCompanionBuilder =
    CommentDraftTableCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      Value<String> postId,
      Value<String> postUser,
      Value<String> postTitle,
      Value<String> draft,
    });

class $$CommentDraftTableTableFilterComposer
    extends Composer<_$AppDatabase, $CommentDraftTableTable> {
  $$CommentDraftTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get postId => $composableBuilder(
    column: $table.postId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get postUser => $composableBuilder(
    column: $table.postUser,
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

class $$CommentDraftTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CommentDraftTableTable> {
  $$CommentDraftTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get postId => $composableBuilder(
    column: $table.postId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get postUser => $composableBuilder(
    column: $table.postUser,
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

class $$CommentDraftTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CommentDraftTableTable> {
  $$CommentDraftTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get postId =>
      $composableBuilder(column: $table.postId, builder: (column) => column);

  GeneratedColumn<String> get postUser =>
      $composableBuilder(column: $table.postUser, builder: (column) => column);

  GeneratedColumn<String> get postTitle =>
      $composableBuilder(column: $table.postTitle, builder: (column) => column);

  GeneratedColumn<String> get draft =>
      $composableBuilder(column: $table.draft, builder: (column) => column);
}

class $$CommentDraftTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CommentDraftTableTable,
          CommentDraftTableData,
          $$CommentDraftTableTableFilterComposer,
          $$CommentDraftTableTableOrderingComposer,
          $$CommentDraftTableTableAnnotationComposer,
          $$CommentDraftTableTableCreateCompanionBuilder,
          $$CommentDraftTableTableUpdateCompanionBuilder,
          (
            CommentDraftTableData,
            BaseReferences<
              _$AppDatabase,
              $CommentDraftTableTable,
              CommentDraftTableData
            >,
          ),
          CommentDraftTableData,
          PrefetchHooks Function()
        > {
  $$CommentDraftTableTableTableManager(
    _$AppDatabase db,
    $CommentDraftTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CommentDraftTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CommentDraftTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CommentDraftTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> postId = const Value.absent(),
                Value<String> postUser = const Value.absent(),
                Value<String> postTitle = const Value.absent(),
                Value<String> draft = const Value.absent(),
              }) => CommentDraftTableCompanion(
                id: id,
                createdAt: createdAt,
                postId: postId,
                postUser: postUser,
                postTitle: postTitle,
                draft: draft,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                required String postId,
                required String postUser,
                required String postTitle,
                required String draft,
              }) => CommentDraftTableCompanion.insert(
                id: id,
                createdAt: createdAt,
                postId: postId,
                postUser: postUser,
                postTitle: postTitle,
                draft: draft,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CommentDraftTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CommentDraftTableTable,
      CommentDraftTableData,
      $$CommentDraftTableTableFilterComposer,
      $$CommentDraftTableTableOrderingComposer,
      $$CommentDraftTableTableAnnotationComposer,
      $$CommentDraftTableTableCreateCompanionBuilder,
      $$CommentDraftTableTableUpdateCompanionBuilder,
      (
        CommentDraftTableData,
        BaseReferences<
          _$AppDatabase,
          $CommentDraftTableTable,
          CommentDraftTableData
        >,
      ),
      CommentDraftTableData,
      PrefetchHooks Function()
    >;
typedef $$ReplyDraftsTableCreateCompanionBuilder =
    ReplyDraftsCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      required String url,
      required String parentUser,
      required String parentText,
      required String draft,
    });
typedef $$ReplyDraftsTableUpdateCompanionBuilder =
    ReplyDraftsCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      Value<String> url,
      Value<String> parentUser,
      Value<String> parentText,
      Value<String> draft,
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
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
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

  ColumnFilters<String> get parentUser => $composableBuilder(
    column: $table.parentUser,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentText => $composableBuilder(
    column: $table.parentText,
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
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
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

  ColumnOrderings<String> get parentUser => $composableBuilder(
    column: $table.parentUser,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentText => $composableBuilder(
    column: $table.parentText,
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
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get parentUser => $composableBuilder(
    column: $table.parentUser,
    builder: (column) => column,
  );

  GeneratedColumn<String> get parentText => $composableBuilder(
    column: $table.parentText,
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
          ReplyDraft,
          $$ReplyDraftsTableFilterComposer,
          $$ReplyDraftsTableOrderingComposer,
          $$ReplyDraftsTableAnnotationComposer,
          $$ReplyDraftsTableCreateCompanionBuilder,
          $$ReplyDraftsTableUpdateCompanionBuilder,
          (
            ReplyDraft,
            BaseReferences<_$AppDatabase, $ReplyDraftsTable, ReplyDraft>,
          ),
          ReplyDraft,
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
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<String> parentUser = const Value.absent(),
                Value<String> parentText = const Value.absent(),
                Value<String> draft = const Value.absent(),
              }) => ReplyDraftsCompanion(
                id: id,
                createdAt: createdAt,
                url: url,
                parentUser: parentUser,
                parentText: parentText,
                draft: draft,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                required String url,
                required String parentUser,
                required String parentText,
                required String draft,
              }) => ReplyDraftsCompanion.insert(
                id: id,
                createdAt: createdAt,
                url: url,
                parentUser: parentUser,
                parentText: parentText,
                draft: draft,
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
      ReplyDraft,
      $$ReplyDraftsTableFilterComposer,
      $$ReplyDraftsTableOrderingComposer,
      $$ReplyDraftsTableAnnotationComposer,
      $$ReplyDraftsTableCreateCompanionBuilder,
      $$ReplyDraftsTableUpdateCompanionBuilder,
      (
        ReplyDraft,
        BaseReferences<_$AppDatabase, $ReplyDraftsTable, ReplyDraft>,
      ),
      ReplyDraft,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CommentDraftTableTableTableManager get commentDraftTable =>
      $$CommentDraftTableTableTableManager(_db, _db.commentDraftTable);
  $$ReplyDraftsTableTableManager get replyDrafts =>
      $$ReplyDraftsTableTableManager(_db, _db.replyDrafts);
}
