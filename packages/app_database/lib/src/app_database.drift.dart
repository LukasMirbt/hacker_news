// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:draft_storage/src/tables/reply_drafts.drift.dart' as i1;
import 'package:draft_storage/src/tables/comment_drafts.drift.dart' as i2;

abstract class $AppDatabase extends i0.GeneratedDatabase {
  $AppDatabase(i0.QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final i1.$ReplyDraftsTable replyDrafts = i1.$ReplyDraftsTable(this);
  late final i2.$CommentDraftsTable commentDrafts = i2.$CommentDraftsTable(
    this,
  );
  @override
  Iterable<i0.TableInfo<i0.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<i0.TableInfo<i0.Table, Object?>>();
  @override
  List<i0.DatabaseSchemaEntity> get allSchemaEntities => [
    replyDrafts,
    commentDrafts,
  ];
  @override
  i0.DriftDatabaseOptions get options =>
      const i0.DriftDatabaseOptions(storeDateTimeAsText: true);
}

class $AppDatabaseManager {
  final $AppDatabase _db;
  $AppDatabaseManager(this._db);
  i1.$$ReplyDraftsTableTableManager get replyDrafts =>
      i1.$$ReplyDraftsTableTableManager(_db, _db.replyDrafts);
  i2.$$CommentDraftsTableTableManager get commentDrafts =>
      i2.$$CommentDraftsTableTableManager(_db, _db.commentDrafts);
}
