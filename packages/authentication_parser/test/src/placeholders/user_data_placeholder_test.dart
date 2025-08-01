// ignore_for_file: prefer_const_constructors

import 'package:authentication_parser/authentication_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(UserDataPlaceholder, () {
    test('returns $UserData', () {
      expect(
        UserDataPlaceholder(),
        isA<UserData>(),
      );
    });
  });
}
