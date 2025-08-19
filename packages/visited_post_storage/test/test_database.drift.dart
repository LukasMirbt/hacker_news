// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:visited_post_storage/src/tables/visited_posts.drift.dart' as i1;

abstract class $TestDatabase extends i0.GeneratedDatabase {
  $TestDatabase(i0.QueryExecutor e) : super(e);
  $TestDatabaseManager get managers => $TestDatabaseManager(this);
  late final i1.$VisitedPostsTable visitedPosts = i1.$VisitedPostsTable(this);
  @override
  Iterable<i0.TableInfo<i0.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<i0.TableInfo<i0.Table, Object?>>();
  @override
  List<i0.DatabaseSchemaEntity> get allSchemaEntities => [visitedPosts];
  @override
  i0.DriftDatabaseOptions get options =>
      const i0.DriftDatabaseOptions(storeDateTimeAsText: true);
}

class $TestDatabaseManager {
  final $TestDatabase _db;
  $TestDatabaseManager(this._db);
  i1.$$VisitedPostsTableTableManager get visitedPosts =>
      i1.$$VisitedPostsTableTableManager(_db, _db.visitedPosts);
}
