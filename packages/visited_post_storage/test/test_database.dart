// test/database.dart
import 'package:drift/drift.dart';
import 'package:visited_post_storage/visited_post_storage.dart';

import 'test_database.drift.dart';

@DriftDatabase(tables: VisitedPostStorage.tables)
class TestDatabase extends $TestDatabase {
  TestDatabase(super.e);

  @override
  int get schemaVersion => 1;
}
