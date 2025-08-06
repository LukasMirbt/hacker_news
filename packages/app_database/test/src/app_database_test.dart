// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:app_database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppDatabase', () {
    test('can be instantiated', () {
      expect(AppDatabase(), isNotNull);
    });
  });
}
