import 'package:app_database/app_database.dart';
import 'package:draft_storage/draft_storage.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:visited_post_storage/visited_post_storage.dart';

@DriftDatabase(
  tables: [
    ...DraftStorage.tables,
    ...VisitedPostStorage.tables,
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
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: stepByStep(
        from1To2: (migrator, schema) async {
          await migrator.createTable(schema.visitedPosts);
        },
      ),
    );
  }
}
