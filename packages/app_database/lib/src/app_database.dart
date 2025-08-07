import 'package:app_database/app_database.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    CommentDrafts,
    ReplyDrafts,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase({QueryExecutor? executor})
    : super(
        executor ?? _openConnection(),
      );

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'app_database');
  }

  @override
  int get schemaVersion => 1;
}
