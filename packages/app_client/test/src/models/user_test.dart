// ignore_for_file: prefer_const_constructors

import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(User, () {
    group('initial', () {
      test('returns $User', () {
        const userId = 'userId';
        expect(
          User.initial(userId),
          User(
            id: userId,
            karma: 0,
            profileUrl: '',
            logoutUrl: '',
          ),
        );
      });
    });

    group('fromData', () {
      test('returns $User', () {
        final data = UserDataPlaceholder();
        expect(
          User.fromData(data),
          User(
            id: data.id,
            karma: data.karma,
            profileUrl: data.profileUrl,
            logoutUrl: data.logoutUrl,
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
