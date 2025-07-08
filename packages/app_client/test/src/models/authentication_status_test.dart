import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(AuthenticationStatus, () {
    group('isUnknown', () {
      test('returns true when status '
          'is ${AuthenticationStatus.unknown}', () {
        const status = AuthenticationStatus.unknown;
        expect(status.isUnknown, true);
      });

      test('returns false when status '
          'is ${AuthenticationStatus.authenticated}', () {
        const status = AuthenticationStatus.authenticated;
        expect(status.isUnknown, false);
      });
    });

    group('isAuthenticated', () {
      test('returns true when status '
          'is ${AuthenticationStatus.authenticated}', () {
        const status = AuthenticationStatus.authenticated;
        expect(status.isAuthenticated, true);
      });

      test('returns false when status '
          'is ${AuthenticationStatus.unauthenticated}', () {
        const status = AuthenticationStatus.unauthenticated;
        expect(status.isAuthenticated, false);
      });
    });

    group('isUnauthenticated', () {
      test('returns true when status '
          'is ${AuthenticationStatus.unauthenticated}', () {
        const status = AuthenticationStatus.unauthenticated;
        expect(status.isUnauthenticated, true);
      });

      test('returns false when status '
          'is ${AuthenticationStatus.authenticated}', () {
        const status = AuthenticationStatus.authenticated;
        expect(status.isUnauthenticated, false);
      });
    });
  });
}
