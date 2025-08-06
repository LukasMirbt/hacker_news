// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:draft_repository/draft_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DraftRepository', () {
    test('can be instantiated', () {
      expect(DraftRepository(), isNotNull);
    });
  });
}
