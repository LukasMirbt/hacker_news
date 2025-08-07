// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:draft_storage/src/tables/reply_drafts.drift.dart' as i1;
import 'package:draft_storage/src/tables/reply_drafts.dart' as i2;

typedef $$ReplyDraftsTableCreateCompanionBuilder =
    i1.ReplyDraftsCompanion Function({
      i0.Value<int> id,
      required String userId,
      required String parentId,
      i0.Value<DateTime> createdAt,
      required String url,
      required String parentUserId,
      required String parentHtmlText,
      required String draft,
    });
typedef $$ReplyDraftsTableUpdateCompanionBuilder =
    i1.ReplyDraftsCompanion Function({
      i0.Value<int> id,
      i0.Value<String> userId,
      i0.Value<String> parentId,
      i0.Value<DateTime> createdAt,
      i0.Value<String> url,
      i0.Value<String> parentUserId,
      i0.Value<String> parentHtmlText,
      i0.Value<String> draft,
    });

class $$ReplyDraftsTableFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$ReplyDraftsTable> {
  $$ReplyDraftsTableFilterComposer({
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

  i0.ColumnFilters<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get parentUserId => $composableBuilder(
    column: $table.parentUserId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get parentHtmlText => $composableBuilder(
    column: $table.parentHtmlText,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<String> get draft => $composableBuilder(
    column: $table.draft,
    builder: (column) => i0.ColumnFilters(column),
  );
}

class $$ReplyDraftsTableOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$ReplyDraftsTable> {
  $$ReplyDraftsTableOrderingComposer({
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

  i0.ColumnOrderings<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get parentUserId => $composableBuilder(
    column: $table.parentUserId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get parentHtmlText => $composableBuilder(
    column: $table.parentHtmlText,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get draft => $composableBuilder(
    column: $table.draft,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $$ReplyDraftsTableAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$ReplyDraftsTable> {
  $$ReplyDraftsTableAnnotationComposer({
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

  i0.GeneratedColumn<String> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  i0.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  i0.GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  i0.GeneratedColumn<String> get parentUserId => $composableBuilder(
    column: $table.parentUserId,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get parentHtmlText => $composableBuilder(
    column: $table.parentHtmlText,
    builder: (column) => column,
  );

  i0.GeneratedColumn<String> get draft =>
      $composableBuilder(column: $table.draft, builder: (column) => column);
}

class $$ReplyDraftsTableTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.$ReplyDraftsTable,
          i1.ReplyDraftData,
          i1.$$ReplyDraftsTableFilterComposer,
          i1.$$ReplyDraftsTableOrderingComposer,
          i1.$$ReplyDraftsTableAnnotationComposer,
          $$ReplyDraftsTableCreateCompanionBuilder,
          $$ReplyDraftsTableUpdateCompanionBuilder,
          (
            i1.ReplyDraftData,
            i0.BaseReferences<
              i0.GeneratedDatabase,
              i1.$ReplyDraftsTable,
              i1.ReplyDraftData
            >,
          ),
          i1.ReplyDraftData,
          i0.PrefetchHooks Function()
        > {
  $$ReplyDraftsTableTableManager(
    i0.GeneratedDatabase db,
    i1.$ReplyDraftsTable table,
  ) : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$$ReplyDraftsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$$ReplyDraftsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$$ReplyDraftsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                i0.Value<int> id = const i0.Value.absent(),
                i0.Value<String> userId = const i0.Value.absent(),
                i0.Value<String> parentId = const i0.Value.absent(),
                i0.Value<DateTime> createdAt = const i0.Value.absent(),
                i0.Value<String> url = const i0.Value.absent(),
                i0.Value<String> parentUserId = const i0.Value.absent(),
                i0.Value<String> parentHtmlText = const i0.Value.absent(),
                i0.Value<String> draft = const i0.Value.absent(),
              }) => i1.ReplyDraftsCompanion(
                id: id,
                userId: userId,
                parentId: parentId,
                createdAt: createdAt,
                url: url,
                parentUserId: parentUserId,
                parentHtmlText: parentHtmlText,
                draft: draft,
              ),
          createCompanionCallback:
              ({
                i0.Value<int> id = const i0.Value.absent(),
                required String userId,
                required String parentId,
                i0.Value<DateTime> createdAt = const i0.Value.absent(),
                required String url,
                required String parentUserId,
                required String parentHtmlText,
                required String draft,
              }) => i1.ReplyDraftsCompanion.insert(
                id: id,
                userId: userId,
                parentId: parentId,
                createdAt: createdAt,
                url: url,
                parentUserId: parentUserId,
                parentHtmlText: parentHtmlText,
                draft: draft,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReplyDraftsTableProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.$ReplyDraftsTable,
      i1.ReplyDraftData,
      i1.$$ReplyDraftsTableFilterComposer,
      i1.$$ReplyDraftsTableOrderingComposer,
      i1.$$ReplyDraftsTableAnnotationComposer,
      $$ReplyDraftsTableCreateCompanionBuilder,
      $$ReplyDraftsTableUpdateCompanionBuilder,
      (
        i1.ReplyDraftData,
        i0.BaseReferences<
          i0.GeneratedDatabase,
          i1.$ReplyDraftsTable,
          i1.ReplyDraftData
        >,
      ),
      i1.ReplyDraftData,
      i0.PrefetchHooks Function()
    >;

class $ReplyDraftsTable extends i2.ReplyDrafts
    with i0.TableInfo<$ReplyDraftsTable, i1.ReplyDraftData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReplyDraftsTable(this.attachedDatabase, [this._alias]);
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
  static const i0.VerificationMeta _parentIdMeta = const i0.VerificationMeta(
    'parentId',
  );
  @override
  late final i0.GeneratedColumn<String> parentId = i0.GeneratedColumn<String>(
    'parent_id',
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
  static const i0.VerificationMeta _urlMeta = const i0.VerificationMeta('url');
  @override
  late final i0.GeneratedColumn<String> url = i0.GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const i0.VerificationMeta _parentUserIdMeta =
      const i0.VerificationMeta('parentUserId');
  @override
  late final i0.GeneratedColumn<String> parentUserId =
      i0.GeneratedColumn<String>(
        'parent_user_id',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const i0.VerificationMeta _parentHtmlTextMeta =
      const i0.VerificationMeta('parentHtmlText');
  @override
  late final i0.GeneratedColumn<String> parentHtmlText =
      i0.GeneratedColumn<String>(
        'parent_html_text',
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
    id,
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
  i0.VerificationContext validateIntegrity(
    i0.Insertable<i1.ReplyDraftData> instance, {
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
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<i0.GeneratedColumn>> get uniqueKeys => [
    {userId, parentId},
  ];
  @override
  i1.ReplyDraftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.ReplyDraftData(
      id: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      url: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      parentUserId: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}parent_user_id'],
      )!,
      parentHtmlText: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}parent_html_text'],
      )!,
      draft: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}draft'],
      )!,
    );
  }

  @override
  $ReplyDraftsTable createAlias(String alias) {
    return $ReplyDraftsTable(attachedDatabase, alias);
  }
}

class ReplyDraftData extends i0.DataClass
    implements i0.Insertable<i1.ReplyDraftData> {
  final int id;
  final String userId;
  final String parentId;
  final DateTime createdAt;
  final String url;
  final String parentUserId;
  final String parentHtmlText;
  final String draft;
  const ReplyDraftData({
    required this.id,
    required this.userId,
    required this.parentId,
    required this.createdAt,
    required this.url,
    required this.parentUserId,
    required this.parentHtmlText,
    required this.draft,
  });
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    map['user_id'] = i0.Variable<String>(userId);
    map['parent_id'] = i0.Variable<String>(parentId);
    map['created_at'] = i0.Variable<DateTime>(createdAt);
    map['url'] = i0.Variable<String>(url);
    map['parent_user_id'] = i0.Variable<String>(parentUserId);
    map['parent_html_text'] = i0.Variable<String>(parentHtmlText);
    map['draft'] = i0.Variable<String>(draft);
    return map;
  }

  i1.ReplyDraftsCompanion toCompanion(bool nullToAbsent) {
    return i1.ReplyDraftsCompanion(
      id: i0.Value(id),
      userId: i0.Value(userId),
      parentId: i0.Value(parentId),
      createdAt: i0.Value(createdAt),
      url: i0.Value(url),
      parentUserId: i0.Value(parentUserId),
      parentHtmlText: i0.Value(parentHtmlText),
      draft: i0.Value(draft),
    );
  }

  factory ReplyDraftData.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return ReplyDraftData(
      id: serializer.fromJson<int>(json['id']),
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
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'parentId': serializer.toJson<String>(parentId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'url': serializer.toJson<String>(url),
      'parentUserId': serializer.toJson<String>(parentUserId),
      'parentHtmlText': serializer.toJson<String>(parentHtmlText),
      'draft': serializer.toJson<String>(draft),
    };
  }

  i1.ReplyDraftData copyWith({
    int? id,
    String? userId,
    String? parentId,
    DateTime? createdAt,
    String? url,
    String? parentUserId,
    String? parentHtmlText,
    String? draft,
  }) => i1.ReplyDraftData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    parentId: parentId ?? this.parentId,
    createdAt: createdAt ?? this.createdAt,
    url: url ?? this.url,
    parentUserId: parentUserId ?? this.parentUserId,
    parentHtmlText: parentHtmlText ?? this.parentHtmlText,
    draft: draft ?? this.draft,
  );
  ReplyDraftData copyWithCompanion(i1.ReplyDraftsCompanion data) {
    return ReplyDraftData(
      id: data.id.present ? data.id.value : this.id,
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
          ..write('id: $id, ')
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
    id,
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
      (other is i1.ReplyDraftData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.parentId == this.parentId &&
          other.createdAt == this.createdAt &&
          other.url == this.url &&
          other.parentUserId == this.parentUserId &&
          other.parentHtmlText == this.parentHtmlText &&
          other.draft == this.draft);
}

class ReplyDraftsCompanion extends i0.UpdateCompanion<i1.ReplyDraftData> {
  final i0.Value<int> id;
  final i0.Value<String> userId;
  final i0.Value<String> parentId;
  final i0.Value<DateTime> createdAt;
  final i0.Value<String> url;
  final i0.Value<String> parentUserId;
  final i0.Value<String> parentHtmlText;
  final i0.Value<String> draft;
  const ReplyDraftsCompanion({
    this.id = const i0.Value.absent(),
    this.userId = const i0.Value.absent(),
    this.parentId = const i0.Value.absent(),
    this.createdAt = const i0.Value.absent(),
    this.url = const i0.Value.absent(),
    this.parentUserId = const i0.Value.absent(),
    this.parentHtmlText = const i0.Value.absent(),
    this.draft = const i0.Value.absent(),
  });
  ReplyDraftsCompanion.insert({
    this.id = const i0.Value.absent(),
    required String userId,
    required String parentId,
    this.createdAt = const i0.Value.absent(),
    required String url,
    required String parentUserId,
    required String parentHtmlText,
    required String draft,
  }) : userId = i0.Value(userId),
       parentId = i0.Value(parentId),
       url = i0.Value(url),
       parentUserId = i0.Value(parentUserId),
       parentHtmlText = i0.Value(parentHtmlText),
       draft = i0.Value(draft);
  static i0.Insertable<i1.ReplyDraftData> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? userId,
    i0.Expression<String>? parentId,
    i0.Expression<DateTime>? createdAt,
    i0.Expression<String>? url,
    i0.Expression<String>? parentUserId,
    i0.Expression<String>? parentHtmlText,
    i0.Expression<String>? draft,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (parentId != null) 'parent_id': parentId,
      if (createdAt != null) 'created_at': createdAt,
      if (url != null) 'url': url,
      if (parentUserId != null) 'parent_user_id': parentUserId,
      if (parentHtmlText != null) 'parent_html_text': parentHtmlText,
      if (draft != null) 'draft': draft,
    });
  }

  i1.ReplyDraftsCompanion copyWith({
    i0.Value<int>? id,
    i0.Value<String>? userId,
    i0.Value<String>? parentId,
    i0.Value<DateTime>? createdAt,
    i0.Value<String>? url,
    i0.Value<String>? parentUserId,
    i0.Value<String>? parentHtmlText,
    i0.Value<String>? draft,
  }) {
    return i1.ReplyDraftsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      parentId: parentId ?? this.parentId,
      createdAt: createdAt ?? this.createdAt,
      url: url ?? this.url,
      parentUserId: parentUserId ?? this.parentUserId,
      parentHtmlText: parentHtmlText ?? this.parentHtmlText,
      draft: draft ?? this.draft,
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
    if (parentId.present) {
      map['parent_id'] = i0.Variable<String>(parentId.value);
    }
    if (createdAt.present) {
      map['created_at'] = i0.Variable<DateTime>(createdAt.value);
    }
    if (url.present) {
      map['url'] = i0.Variable<String>(url.value);
    }
    if (parentUserId.present) {
      map['parent_user_id'] = i0.Variable<String>(parentUserId.value);
    }
    if (parentHtmlText.present) {
      map['parent_html_text'] = i0.Variable<String>(parentHtmlText.value);
    }
    if (draft.present) {
      map['draft'] = i0.Variable<String>(draft.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReplyDraftsCompanion(')
          ..write('id: $id, ')
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
}
