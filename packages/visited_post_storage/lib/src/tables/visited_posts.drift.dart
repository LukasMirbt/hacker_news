// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:visited_post_storage/src/tables/visited_posts.drift.dart' as i1;
import 'package:visited_post_storage/src/tables/visited_posts.dart' as i2;
import 'package:clock/src/default.dart' as i3;

typedef $$VisitedPostsTableCreateCompanionBuilder =
    i1.VisitedPostsCompanion Function({
      required String postId,
      i0.Value<DateTime> createdAt,
      i0.Value<int> rowid,
    });
typedef $$VisitedPostsTableUpdateCompanionBuilder =
    i1.VisitedPostsCompanion Function({
      i0.Value<String> postId,
      i0.Value<DateTime> createdAt,
      i0.Value<int> rowid,
    });

class $$VisitedPostsTableFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$VisitedPostsTable> {
  $$VisitedPostsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<String> get postId => $composableBuilder(
    column: $table.postId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => i0.ColumnFilters(column),
  );
}

class $$VisitedPostsTableOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$VisitedPostsTable> {
  $$VisitedPostsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get postId => $composableBuilder(
    column: $table.postId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $$VisitedPostsTableAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$VisitedPostsTable> {
  $$VisitedPostsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<String> get postId =>
      $composableBuilder(column: $table.postId, builder: (column) => column);

  i0.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$VisitedPostsTableTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.$VisitedPostsTable,
          i1.VisitedPostData,
          i1.$$VisitedPostsTableFilterComposer,
          i1.$$VisitedPostsTableOrderingComposer,
          i1.$$VisitedPostsTableAnnotationComposer,
          $$VisitedPostsTableCreateCompanionBuilder,
          $$VisitedPostsTableUpdateCompanionBuilder,
          (
            i1.VisitedPostData,
            i0.BaseReferences<
              i0.GeneratedDatabase,
              i1.$VisitedPostsTable,
              i1.VisitedPostData
            >,
          ),
          i1.VisitedPostData,
          i0.PrefetchHooks Function()
        > {
  $$VisitedPostsTableTableManager(
    i0.GeneratedDatabase db,
    i1.$VisitedPostsTable table,
  ) : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$$VisitedPostsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$$VisitedPostsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$$VisitedPostsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                i0.Value<String> postId = const i0.Value.absent(),
                i0.Value<DateTime> createdAt = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.VisitedPostsCompanion(
                postId: postId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String postId,
                i0.Value<DateTime> createdAt = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.VisitedPostsCompanion.insert(
                postId: postId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$VisitedPostsTableProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.$VisitedPostsTable,
      i1.VisitedPostData,
      i1.$$VisitedPostsTableFilterComposer,
      i1.$$VisitedPostsTableOrderingComposer,
      i1.$$VisitedPostsTableAnnotationComposer,
      $$VisitedPostsTableCreateCompanionBuilder,
      $$VisitedPostsTableUpdateCompanionBuilder,
      (
        i1.VisitedPostData,
        i0.BaseReferences<
          i0.GeneratedDatabase,
          i1.$VisitedPostsTable,
          i1.VisitedPostData
        >,
      ),
      i1.VisitedPostData,
      i0.PrefetchHooks Function()
    >;

class $VisitedPostsTable extends i2.VisitedPosts
    with i0.TableInfo<$VisitedPostsTable, i1.VisitedPostData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VisitedPostsTable(this.attachedDatabase, [this._alias]);
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
        clientDefault: () => i3.clock.now().toUtc(),
      );
  @override
  List<i0.GeneratedColumn> get $columns => [postId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'visited_posts';
  @override
  i0.VerificationContext validateIntegrity(
    i0.Insertable<i1.VisitedPostData> instance, {
    bool isInserting = false,
  }) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
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
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {postId};
  @override
  i1.VisitedPostData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.VisitedPostData(
      postId: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}post_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $VisitedPostsTable createAlias(String alias) {
    return $VisitedPostsTable(attachedDatabase, alias);
  }
}

class VisitedPostData extends i0.DataClass
    implements i0.Insertable<i1.VisitedPostData> {
  final String postId;
  final DateTime createdAt;
  const VisitedPostData({required this.postId, required this.createdAt});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['post_id'] = i0.Variable<String>(postId);
    map['created_at'] = i0.Variable<DateTime>(createdAt);
    return map;
  }

  i1.VisitedPostsCompanion toCompanion(bool nullToAbsent) {
    return i1.VisitedPostsCompanion(
      postId: i0.Value(postId),
      createdAt: i0.Value(createdAt),
    );
  }

  factory VisitedPostData.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return VisitedPostData(
      postId: serializer.fromJson<String>(json['postId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'postId': serializer.toJson<String>(postId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  i1.VisitedPostData copyWith({String? postId, DateTime? createdAt}) =>
      i1.VisitedPostData(
        postId: postId ?? this.postId,
        createdAt: createdAt ?? this.createdAt,
      );
  VisitedPostData copyWithCompanion(i1.VisitedPostsCompanion data) {
    return VisitedPostData(
      postId: data.postId.present ? data.postId.value : this.postId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VisitedPostData(')
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
      (other is i1.VisitedPostData &&
          other.postId == this.postId &&
          other.createdAt == this.createdAt);
}

class VisitedPostsCompanion extends i0.UpdateCompanion<i1.VisitedPostData> {
  final i0.Value<String> postId;
  final i0.Value<DateTime> createdAt;
  final i0.Value<int> rowid;
  const VisitedPostsCompanion({
    this.postId = const i0.Value.absent(),
    this.createdAt = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  VisitedPostsCompanion.insert({
    required String postId,
    this.createdAt = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  }) : postId = i0.Value(postId);
  static i0.Insertable<i1.VisitedPostData> custom({
    i0.Expression<String>? postId,
    i0.Expression<DateTime>? createdAt,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (postId != null) 'post_id': postId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.VisitedPostsCompanion copyWith({
    i0.Value<String>? postId,
    i0.Value<DateTime>? createdAt,
    i0.Value<int>? rowid,
  }) {
    return i1.VisitedPostsCompanion(
      postId: postId ?? this.postId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (postId.present) {
      map['post_id'] = i0.Variable<String>(postId.value);
    }
    if (createdAt.present) {
      map['created_at'] = i0.Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
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
