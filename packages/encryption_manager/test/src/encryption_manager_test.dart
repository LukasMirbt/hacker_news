// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:encryption_manager/encryption_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EncryptionManager', () {
    test('can be instantiated', () {
      expect(EncryptionManager(), isNotNull);
    });
  });
}
