import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/login/login.dart';

void main() {
  group(LoginState, () {
    LoginState createSubject({
      LoginStatus? status,
      String? username,
      String? password,
    }) {
      return LoginState(
        from: 'from',
        username: username ?? 'username',
        password: password ?? 'password',
        status: status ?? LoginStatus.initial,
      );
    }

    group('isValid', () {
      test('returns false when username is empty', () {
        final state = createSubject(username: '');
        expect(state.isValid, false);
      });

      test('returns false when password is empty', () {
        final state = createSubject(password: '');
        expect(state.isValid, false);
      });

      test('returns true when username and password '
          'are not empty', () {
        final state = createSubject();
        expect(state.isValid, true);
      });
    });

    group('isLoading', () {
      test('returns false when status is '
          '${LoginStatus.initial}', () {
        final state = createSubject(
          status: LoginStatus.initial,
        );
        expect(state.isLoading, false);
      });

      test('returns true when status is '
          '${LoginStatus.loading}', () {
        final state = createSubject(
          status: LoginStatus.loading,
        );
        expect(state.isLoading, true);
      });

      test('returns true when status is '
          '${LoginStatus.success}', () {
        final state = createSubject(
          status: LoginStatus.success,
        );
        expect(state.isLoading, true);
      });

      test('returns false when status is '
          '${LoginStatus.failure}', () {
        final state = createSubject(
          status: LoginStatus.failure,
        );
        expect(state.isLoading, false);
      });
    });
  });
}
