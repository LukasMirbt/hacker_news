// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:draft_storage/draft_storage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DraftStorage', () {
    test('can be instantiated', () {
      expect(DraftStorage(), isNotNull);
    });
  });
}
