import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/login/login.dart';

void main() {
  group(LoginState, () {
    LoginState createSubject({
      LoginStatus? status,
    }) {
      return LoginState(
        from: 'from',
        status: status ?? LoginStatus.initial,
      );
    }

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
