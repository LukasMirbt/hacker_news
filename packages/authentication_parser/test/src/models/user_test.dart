// ignore_for_file: prefer_const_constructors

import 'package:authentication_parser/authentication_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(User, () {
    group('fromParsed', () {
      test('returns $User with correct values '
          'when data is non-null', () {
        const id = 'id';
        const karma = 1;
        const profileUrl = 'profileUrl';
        const logoutUrl = 'logoutUrl';

        expect(
          User.fromParsed(
            id: id,
            karma: karma,
            profileUrl: profileUrl,
            logoutUrl: logoutUrl,
          ),
          User(
            id: id,
            karma: karma,
            profileUrl: profileUrl,
            logoutUrl: logoutUrl,
          ),
        );
      });

      test('returns $User with correct values '
          'when data is null', () {
        const id = 'id';

        expect(
          User.fromParsed(
            id: id,
            karma: null,
            profileUrl: null,
            logoutUrl: null,
          ),
          User(
            id: id,
            karma: 0,
            profileUrl: '',
            logoutUrl: '',
          ),
        );
      });
    });

    group('empty', () {
      test('returns $User', () {
        expect(User.empty, isA<User>());
      });
    });
  });
}
