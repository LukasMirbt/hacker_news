import 'dart:io';

import 'package:app_database/app_database.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(AppDatabase, () {
    group('constructor', () {
      const testDbPath = 'test/test_db';

      setUpAll(() {
        TestWidgetsFlutterBinding.ensureInitialized();

        const channel = MethodChannel('plugins.flutter.io/path_provider');

        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(channel, (MethodCall call) async {
              if (call.method == 'getTemporaryDirectory' ||
                  call.method == 'getApplicationDocumentsDirectory') {
                final dir = Directory(testDbPath);
                await dir.create(recursive: true);
                return dir.path;
              }

              return null;
            });
      });

      tearDownAll(() async {
        final dir = Directory(testDbPath);
        if (dir.existsSync()) {
          await dir.delete(recursive: true);
        }
      });

      AppDatabase createSubject() => AppDatabase();

      test('returns normally', () async {
        final database = createSubject();
        await database.close();
      });
    });

    group('members', () {
      late AppDatabase database;

      setUp(() {
        database = AppDatabase(
          DatabaseConnection(
            NativeDatabase.memory(),
            closeStreamsSynchronously: true,
          ),
        );
      });

      tearDown(() async {
        await database.close();
      });

      group('schemaVersion', () {
        test('returns correct value', () {
          expect(database.schemaVersion, 1);
        });
      });
    });
  });
}
