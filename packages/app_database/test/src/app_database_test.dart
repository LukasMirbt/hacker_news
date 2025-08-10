import 'package:app_database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group(AppDatabase, () {
    AppDatabase createSubject() => AppDatabase();

    group('constructor', () {
      test('returns normally', () {
        expect(createSubject, returnsNormally);
      });
    });

    group('schemaVersion', () {
      test('returns correct value', () {
        final database = createSubject();
        expect(database.schemaVersion, 1);
      });
    });
  });
}
