// ignore_for_file: prefer_const_constructors

import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(UserPlaceholder, () {
    test('returns $User', () {
      expect(
        UserPlaceholder(),
        isA<User>(),
      );
    });
  });
}
