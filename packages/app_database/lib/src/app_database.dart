import 'package:app_database/app_database.dart';
import 'package:draft_storage/draft_storage.dart';
import 'package:drift_flutter/drift_flutter.dart';

@DriftDatabase(
  tables: [
    ...DraftStorage.tables,
  ],
)
class AppDatabase extends $AppDatabase {
  AppDatabase([QueryExecutor? executor])
    : super(
        executor ?? _openConnection(),
      );

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'app_database');
  }

  @override
  int get schemaVersion => 1;
}
