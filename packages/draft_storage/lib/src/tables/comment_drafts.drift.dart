// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:draft_storage/src/tables/comment_drafts.drift.dart' as i1;
import 'package:draft_storage/src/tables/comment_drafts.dart' as i2;

typedef $$CommentDraftsTableCreateCompanionBuilder =
    i1.CommentDraftsCompanion Function({
      required String userId,
      required String postId,
      i0.Value<DateTime> createdAt,
      required String postUserId,
      required String postTitle,
      required String draft,
      i0.Value<int> rowid,
    });
typedef $$CommentDraftsTableUpdateCompanionBuilder =
    i1.CommentDraftsCompanion Function({
      i0.Value<String> userId,
      i0.Value<String> postId,
      i0.Value<DateTime> createdAt,
      i0.Value<String> postUserId,
      i0.Value<String> postTitle,
      i0.Value<String> draft,
      i0.Value<int> rowid,
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
  i0.ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get postId => $composableBuilder(
    column: $table.postId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
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

  i0.ColumnFilters<String> get draft => $composableBuilder(
    column: $table.draft,
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
  i0.ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get postId => $composableBuilder(
    column: $table.postId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
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

  i0.ColumnOrderings<String> get draft => $composableBuilder(
    column: $table.draft,
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
  i0.GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  i0.GeneratedColumn<String> get postId =>
      $composableBuilder(column: $table.postId, builder: (column) => column);

  i0.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  i0.GeneratedColumn<String> get postUserId => $composableBuilder(
    column: $table.postUserId,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get postTitle =>
      $composableBuilder(column: $table.postTitle, builder: (column) => column);

  i0.GeneratedColumn<String> get draft =>
      $composableBuilder(column: $table.draft, builder: (column) => column);
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
                i0.Value<String> userId = const i0.Value.absent(),
                i0.Value<String> postId = const i0.Value.absent(),
                i0.Value<DateTime> createdAt = const i0.Value.absent(),
                i0.Value<String> postUserId = const i0.Value.absent(),
                i0.Value<String> postTitle = const i0.Value.absent(),
                i0.Value<String> draft = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.CommentDraftsCompanion(
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
                i0.Value<DateTime> createdAt = const i0.Value.absent(),
                required String postUserId,
                required String postTitle,
                required String draft,
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.CommentDraftsCompanion.insert(
                userId: userId,
                postId: postId,
                createdAt: createdAt,
                postUserId: postUserId,
                postTitle: postTitle,
                draft: draft,
                rowid: rowid,
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
  static const i0.VerificationMeta _createdAtMeta = const i0.VerificationMeta(
    'createdAt',
  );
  @override
  late final i0.GeneratedColumn<DateTime> createdAt =
      i0.GeneratedColumn<DateTime>(
        'created_at',
        aliasedName,
        false,
        type: i0.DriftSqlType.dateTime,
        requiredDuringInsert: false,
        clientDefault: DateTime.now,
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
  static const i0.VerificationMeta _draftMeta = const i0.VerificationMeta(
    'draft',
  );
  @override
  late final i0.GeneratedColumn<String> draft = i0.GeneratedColumn<String>(
    'draft',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<i0.GeneratedColumn> get $columns => [
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
  i0.VerificationContext validateIntegrity(
    i0.Insertable<i1.CommentDraftData> instance, {
    bool isInserting = false,
  }) {
    final context = i0.VerificationContext();
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
  Set<i0.GeneratedColumn> get $primaryKey => {userId, postId};
  @override
  i1.CommentDraftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.CommentDraftData(
      userId: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      postId: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}post_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      postUserId: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}post_user_id'],
      )!,
      postTitle: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}post_title'],
      )!,
      draft: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}draft'],
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
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['user_id'] = i0.Variable<String>(userId);
    map['post_id'] = i0.Variable<String>(postId);
    map['created_at'] = i0.Variable<DateTime>(createdAt);
    map['post_user_id'] = i0.Variable<String>(postUserId);
    map['post_title'] = i0.Variable<String>(postTitle);
    map['draft'] = i0.Variable<String>(draft);
    return map;
  }

  i1.CommentDraftsCompanion toCompanion(bool nullToAbsent) {
    return i1.CommentDraftsCompanion(
      userId: i0.Value(userId),
      postId: i0.Value(postId),
      createdAt: i0.Value(createdAt),
      postUserId: i0.Value(postUserId),
      postTitle: i0.Value(postTitle),
      draft: i0.Value(draft),
    );
  }

  factory CommentDraftData.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
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
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'postId': serializer.toJson<String>(postId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'postUserId': serializer.toJson<String>(postUserId),
      'postTitle': serializer.toJson<String>(postTitle),
      'draft': serializer.toJson<String>(draft),
    };
  }

  i1.CommentDraftData copyWith({
    String? userId,
    String? postId,
    DateTime? createdAt,
    String? postUserId,
    String? postTitle,
    String? draft,
  }) => i1.CommentDraftData(
    userId: userId ?? this.userId,
    postId: postId ?? this.postId,
    createdAt: createdAt ?? this.createdAt,
    postUserId: postUserId ?? this.postUserId,
    postTitle: postTitle ?? this.postTitle,
    draft: draft ?? this.draft,
  );
  CommentDraftData copyWithCompanion(i1.CommentDraftsCompanion data) {
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
      (other is i1.CommentDraftData &&
          other.userId == this.userId &&
          other.postId == this.postId &&
          other.createdAt == this.createdAt &&
          other.postUserId == this.postUserId &&
          other.postTitle == this.postTitle &&
          other.draft == this.draft);
}

class CommentDraftsCompanion extends i0.UpdateCompanion<i1.CommentDraftData> {
  final i0.Value<String> userId;
  final i0.Value<String> postId;
  final i0.Value<DateTime> createdAt;
  final i0.Value<String> postUserId;
  final i0.Value<String> postTitle;
  final i0.Value<String> draft;
  final i0.Value<int> rowid;
  const CommentDraftsCompanion({
    this.userId = const i0.Value.absent(),
    this.postId = const i0.Value.absent(),
    this.createdAt = const i0.Value.absent(),
    this.postUserId = const i0.Value.absent(),
    this.postTitle = const i0.Value.absent(),
    this.draft = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  CommentDraftsCompanion.insert({
    required String userId,
    required String postId,
    this.createdAt = const i0.Value.absent(),
    required String postUserId,
    required String postTitle,
    required String draft,
    this.rowid = const i0.Value.absent(),
  }) : userId = i0.Value(userId),
       postId = i0.Value(postId),
       postUserId = i0.Value(postUserId),
       postTitle = i0.Value(postTitle),
       draft = i0.Value(draft);
  static i0.Insertable<i1.CommentDraftData> custom({
    i0.Expression<String>? userId,
    i0.Expression<String>? postId,
    i0.Expression<DateTime>? createdAt,
    i0.Expression<String>? postUserId,
    i0.Expression<String>? postTitle,
    i0.Expression<String>? draft,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (postId != null) 'post_id': postId,
      if (createdAt != null) 'created_at': createdAt,
      if (postUserId != null) 'post_user_id': postUserId,
      if (postTitle != null) 'post_title': postTitle,
      if (draft != null) 'draft': draft,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.CommentDraftsCompanion copyWith({
    i0.Value<String>? userId,
    i0.Value<String>? postId,
    i0.Value<DateTime>? createdAt,
    i0.Value<String>? postUserId,
    i0.Value<String>? postTitle,
    i0.Value<String>? draft,
    i0.Value<int>? rowid,
  }) {
    return i1.CommentDraftsCompanion(
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
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (userId.present) {
      map['user_id'] = i0.Variable<String>(userId.value);
    }
    if (postId.present) {
      map['post_id'] = i0.Variable<String>(postId.value);
    }
    if (createdAt.present) {
      map['created_at'] = i0.Variable<DateTime>(createdAt.value);
    }
    if (postUserId.present) {
      map['post_user_id'] = i0.Variable<String>(postUserId.value);
    }
    if (postTitle.present) {
      map['post_title'] = i0.Variable<String>(postTitle.value);
    }
    if (draft.present) {
      map['draft'] = i0.Variable<String>(draft.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
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
