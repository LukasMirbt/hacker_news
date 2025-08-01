// ignore_for_file: prefer_const_constructors

import 'package:authentication_parser/authentication_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(UserData, () {
    group('fromParsed', () {
      test('returns $UserData with correct values '
          'when data is non-null', () {
        const id = 'id';
        const karma = 1;
        const profileUrl = 'profileUrl';
        const logoutUrl = 'logoutUrl';

        expect(
          UserData.fromParsed(
            id: id,
            karma: karma,
            profileUrl: profileUrl,
            logoutUrl: logoutUrl,
          ),
          UserData(
            id: id,
            karma: karma,
            profileUrl: profileUrl,
            logoutUrl: logoutUrl,
          ),
        );
      });

      test('returns $UserData with correct values '
          'when data is null', () {
        const id = 'id';

        expect(
          UserData.fromParsed(
            id: id,
            karma: null,
            profileUrl: null,
            logoutUrl: null,
          ),
          UserData(
            id: id,
            karma: 0,
            profileUrl: '',
            logoutUrl: '',
          ),
        );
      });
    });

    group('empty', () {
      test('returns $UserData', () {
        expect(UserData.empty, isA<UserData>());
      });
    });
  });
}
