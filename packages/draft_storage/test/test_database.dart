// test/database.dart
import 'package:draft_storage/draft_storage.dart';
import 'package:drift/drift.dart';

import 'test_database.drift.dart';

@DriftDatabase(tables: DraftStorage.tables)
class TestDatabase extends $TestDatabase {
  TestDatabase(super.e);

  @override
  int get schemaVersion => 1;
}
