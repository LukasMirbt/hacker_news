// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:draft_storage/src/tables/comment_drafts.drift.dart' as i1;
import 'package:draft_storage/src/tables/comment_drafts.dart' as i2;
import 'package:clock/src/default.dart' as i3;

typedef $$CommentDraftsTableCreateCompanionBuilder =
    i1.CommentDraftsCompanion Function({
      i0.Value<int> id,
      required String userId,
      required String postId,
      i0.Value<DateTime> updatedAt,
      required String postUserId,
      required String postTitle,
      required String content,
    });
typedef $$CommentDraftsTableUpdateCompanionBuilder =
    i1.CommentDraftsCompanion Function({
      i0.Value<int> id,
      i0.Value<String> userId,
      i0.Value<String> postId,
      i0.Value<DateTime> updatedAt,
      i0.Value<String> postUserId,
      i0.Value<String> postTitle,
      i0.Value<String> content,
    });

class $$CommentDraftsTableFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$CommentDraftsTable> {
  $$CommentDraftsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get postId => $composableBuilder(
    column: $table.postId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get postUserId => $composableBuilder(
    column: $table.postUserId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get postTitle => $composableBuilder(
    column: $table.postTitle,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => i0.ColumnFilters(column),
  );
}

class $$CommentDraftsTableOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$CommentDraftsTable> {
  $$CommentDraftsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get postId => $composableBuilder(
    column: $table.postId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get postUserId => $composableBuilder(
    column: $table.postUserId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get postTitle => $composableBuilder(
    column: $table.postTitle,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $$CommentDraftsTableAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$CommentDraftsTable> {
  $$CommentDraftsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  i0.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  i0.GeneratedColumn<String> get postId =>
      $composableBuilder(column: $table.postId, builder: (column) => column);

  i0.GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  i0.GeneratedColumn<String> get postUserId => $composableBuilder(
    column: $table.postUserId,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get postTitle =>
      $composableBuilder(column: $table.postTitle, builder: (column) => column);

  i0.GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);
}

class $$CommentDraftsTableTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.$CommentDraftsTable,
          i1.CommentDraftData,
          i1.$$CommentDraftsTableFilterComposer,
          i1.$$CommentDraftsTableOrderingComposer,
          i1.$$CommentDraftsTableAnnotationComposer,
          $$CommentDraftsTableCreateCompanionBuilder,
          $$CommentDraftsTableUpdateCompanionBuilder,
          (
            i1.CommentDraftData,
            i0.BaseReferences<
              i0.GeneratedDatabase,
              i1.$CommentDraftsTable,
              i1.CommentDraftData
            >,
          ),
          i1.CommentDraftData,
          i0.PrefetchHooks Function()
        > {
  $$CommentDraftsTableTableManager(
    i0.GeneratedDatabase db,
    i1.$CommentDraftsTable table,
  ) : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$$CommentDraftsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$$CommentDraftsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$$CommentDraftsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                i0.Value<int> id = const i0.Value.absent(),
                i0.Value<String> userId = const i0.Value.absent(),
                i0.Value<String> postId = const i0.Value.absent(),
                i0.Value<DateTime> updatedAt = const i0.Value.absent(),
                i0.Value<String> postUserId = const i0.Value.absent(),
                i0.Value<String> postTitle = const i0.Value.absent(),
                i0.Value<String> content = const i0.Value.absent(),
              }) => i1.CommentDraftsCompanion(
                id: id,
                userId: userId,
                postId: postId,
                updatedAt: updatedAt,
                postUserId: postUserId,
                postTitle: postTitle,
                content: content,
              ),
          createCompanionCallback:
              ({
                i0.Value<int> id = const i0.Value.absent(),
                required String userId,
                required String postId,
                i0.Value<DateTime> updatedAt = const i0.Value.absent(),
                required String postUserId,
                required String postTitle,
                required String content,
              }) => i1.CommentDraftsCompanion.insert(
                id: id,
                userId: userId,
                postId: postId,
                updatedAt: updatedAt,
                postUserId: postUserId,
                postTitle: postTitle,
                content: content,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CommentDraftsTableProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.$CommentDraftsTable,
      i1.CommentDraftData,
      i1.$$CommentDraftsTableFilterComposer,
      i1.$$CommentDraftsTableOrderingComposer,
      i1.$$CommentDraftsTableAnnotationComposer,
      $$CommentDraftsTableCreateCompanionBuilder,
      $$CommentDraftsTableUpdateCompanionBuilder,
      (
        i1.CommentDraftData,
        i0.BaseReferences<
          i0.GeneratedDatabase,
          i1.$CommentDraftsTable,
          i1.CommentDraftData
        >,
      ),
      i1.CommentDraftData,
      i0.PrefetchHooks Function()
    >;

class $CommentDraftsTable extends i2.CommentDrafts
    with i0.TableInfo<$CommentDraftsTable, i1.CommentDraftData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CommentDraftsTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  @override
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: i0.DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: i0.GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const i0.VerificationMeta _userIdMeta = const i0.VerificationMeta(
    'userId',
  );
  @override
  late final i0.GeneratedColumn<String> userId = i0.GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const i0.VerificationMeta _postIdMeta = const i0.VerificationMeta(
    'postId',
  );
  @override
  late final i0.GeneratedColumn<String> postId = i0.GeneratedColumn<String>(
    'post_id',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const i0.VerificationMeta _updatedAtMeta = const i0.VerificationMeta(
    'updatedAt',
  );
  @override
  late final i0.GeneratedColumn<DateTime> updatedAt =
      i0.GeneratedColumn<DateTime>(
        'updated_at',
        aliasedName,
        false,
        type: i0.DriftSqlType.dateTime,
        requiredDuringInsert: false,
        clientDefault: () => i3.clock.now().toUtc(),
      );
  static const i0.VerificationMeta _postUserIdMeta = const i0.VerificationMeta(
    'postUserId',
  );
  @override
  late final i0.GeneratedColumn<String> postUserId = i0.GeneratedColumn<String>(
    'post_user_id',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const i0.VerificationMeta _postTitleMeta = const i0.VerificationMeta(
    'postTitle',
  );
  @override
  late final i0.GeneratedColumn<String> postTitle = i0.GeneratedColumn<String>(
    'post_title',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const i0.VerificationMeta _contentMeta = const i0.VerificationMeta(
    'content',
  );
  @override
  late final i0.GeneratedColumn<String> content = i0.GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<i0.GeneratedColumn> get $columns => [
    id,
    userId,
    postId,
    updatedAt,
    postUserId,
    postTitle,
    content,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'comment_drafts';
  @override
  i0.VerificationContext validateIntegrity(
    i0.Insertable<i1.CommentDraftData> instance, {
    bool isInserting = false,
  }) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
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
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
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
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<i0.GeneratedColumn>> get uniqueKeys => [
    {userId, postId},
  ];
  @override
  i1.CommentDraftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CommentDraftData(
      id: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      postId: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}post_id'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      postUserId: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}post_user_id'],
      )!,
      postTitle: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}post_title'],
      )!,
      content: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
    );
  }

  @override
  $CommentDraftsTable createAlias(String alias) {
    return $CommentDraftsTable(attachedDatabase, alias);
  }
}

class CommentDraftData extends i0.DataClass
    implements i0.Insertable<i1.CommentDraftData> {
  final int id;
  final String userId;
  final String postId;
  final DateTime updatedAt;
  final String postUserId;
  final String postTitle;
  final String content;
  const CommentDraftData({
    required this.id,
    required this.userId,
    required this.postId,
    required this.updatedAt,
    required this.postUserId,
    required this.postTitle,
    required this.content,
  });
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    map['user_id'] = i0.Variable<String>(userId);
    map['post_id'] = i0.Variable<String>(postId);
    map['updated_at'] = i0.Variable<DateTime>(updatedAt);
    map['post_user_id'] = i0.Variable<String>(postUserId);
    map['post_title'] = i0.Variable<String>(postTitle);
    map['content'] = i0.Variable<String>(content);
    return map;
  }

  i1.CommentDraftsCompanion toCompanion(bool nullToAbsent) {
    return i1.CommentDraftsCompanion(
      id: i0.Value(id),
      userId: i0.Value(userId),
      postId: i0.Value(postId),
      updatedAt: i0.Value(updatedAt),
      postUserId: i0.Value(postUserId),
      postTitle: i0.Value(postTitle),
      content: i0.Value(content),
    );
  }

  factory CommentDraftData.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return CommentDraftData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      postId: serializer.fromJson<String>(json['postId']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      postUserId: serializer.fromJson<String>(json['postUserId']),
      postTitle: serializer.fromJson<String>(json['postTitle']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'postId': serializer.toJson<String>(postId),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'postUserId': serializer.toJson<String>(postUserId),
      'postTitle': serializer.toJson<String>(postTitle),
      'content': serializer.toJson<String>(content),
    };
  }

  i1.CommentDraftData copyWith({
    int? id,
    String? userId,
    String? postId,
    DateTime? updatedAt,
    String? postUserId,
    String? postTitle,
    String? content,
  }) => i1.CommentDraftData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    postId: postId ?? this.postId,
    updatedAt: updatedAt ?? this.updatedAt,
    postUserId: postUserId ?? this.postUserId,
    postTitle: postTitle ?? this.postTitle,
    content: content ?? this.content,
  );
  CommentDraftData copyWithCompanion(i1.CommentDraftsCompanion data) {
    return CommentDraftData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      postId: data.postId.present ? data.postId.value : this.postId,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      postUserId: data.postUserId.present
          ? data.postUserId.value
          : this.postUserId,
      postTitle: data.postTitle.present ? data.postTitle.value : this.postTitle,
      content: data.content.present ? data.content.value : this.content,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CommentDraftData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('postId: $postId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('postUserId: $postUserId, ')
          ..write('postTitle: $postTitle, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    postId,
    updatedAt,
    postUserId,
    postTitle,
    content,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.CommentDraftData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.postId == this.postId &&
          other.updatedAt == this.updatedAt &&
          other.postUserId == this.postUserId &&
          other.postTitle == this.postTitle &&
          other.content == this.content);
}

class CommentDraftsCompanion extends i0.UpdateCompanion<i1.CommentDraftData> {
  final i0.Value<int> id;
  final i0.Value<String> userId;
  final i0.Value<String> postId;
  final i0.Value<DateTime> updatedAt;
  final i0.Value<String> postUserId;
  final i0.Value<String> postTitle;
  final i0.Value<String> content;
  const CommentDraftsCompanion({
    this.id = const i0.Value.absent(),
    this.userId = const i0.Value.absent(),
    this.postId = const i0.Value.absent(),
    this.updatedAt = const i0.Value.absent(),
    this.postUserId = const i0.Value.absent(),
    this.postTitle = const i0.Value.absent(),
    this.content = const i0.Value.absent(),
  });
  CommentDraftsCompanion.insert({
    this.id = const i0.Value.absent(),
    required String userId,
    required String postId,
    this.updatedAt = const i0.Value.absent(),
    required String postUserId,
    required String postTitle,
    required String content,
  }) : userId = i0.Value(userId),
       postId = i0.Value(postId),
       postUserId = i0.Value(postUserId),
       postTitle = i0.Value(postTitle),
       content = i0.Value(content);
  static i0.Insertable<i1.CommentDraftData> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? userId,
    i0.Expression<String>? postId,
    i0.Expression<DateTime>? updatedAt,
    i0.Expression<String>? postUserId,
    i0.Expression<String>? postTitle,
    i0.Expression<String>? content,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (postId != null) 'post_id': postId,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (postUserId != null) 'post_user_id': postUserId,
      if (postTitle != null) 'post_title': postTitle,
      if (content != null) 'content': content,
    });
  }

  i1.CommentDraftsCompanion copyWith({
    i0.Value<int>? id,
    i0.Value<String>? userId,
    i0.Value<String>? postId,
    i0.Value<DateTime>? updatedAt,
    i0.Value<String>? postUserId,
    i0.Value<String>? postTitle,
    i0.Value<String>? content,
  }) {
    return i1.CommentDraftsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      postId: postId ?? this.postId,
      updatedAt: updatedAt ?? this.updatedAt,
      postUserId: postUserId ?? this.postUserId,
      postTitle: postTitle ?? this.postTitle,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = i0.Variable<String>(userId.value);
    }
    if (postId.present) {
      map['post_id'] = i0.Variable<String>(postId.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = i0.Variable<DateTime>(updatedAt.value);
    }
    if (postUserId.present) {
      map['post_user_id'] = i0.Variable<String>(postUserId.value);
    }
    if (postTitle.present) {
      map['post_title'] = i0.Variable<String>(postTitle.value);
    }
    if (content.present) {
      map['content'] = i0.Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommentDraftsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('postId: $postId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('postUserId: $postUserId, ')
          ..write('postTitle: $postTitle, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}
