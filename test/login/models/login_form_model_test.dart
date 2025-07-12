// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/login/login.dart';
import 'package:mocktail/mocktail.dart';

class _MockUsername extends Mock implements Username {}

class _MockPassword extends Mock implements Password {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(LoginFormModel, () {
    late Username username;
    late Password password;

    setUp(() {
      username = _MockUsername();
      password = _MockPassword();
      when(() => username.isValid).thenReturn(true);
      when(() => password.isValid).thenReturn(true);
    });

    LoginFormModel createSubject({
      LoginStatus? status,
    }) {
      return LoginFormModel(
        username: username,
        password: password,
        status: status ?? LoginStatus.initial,
      );
    }

    group('isValid', () {
      test('returns false when !username.isValid', () {
        when(() => username.isValid).thenReturn(false);
        final model = createSubject();
        expect(model.isValid, false);
      });

      test('returns false when !password.isValid', () {
        when(() => password.isValid).thenReturn(false);
        final model = createSubject();
        expect(model.isValid, false);
      });

      test('returns true when username and password are valid', () {
        final model = createSubject();
        expect(model.isValid, true);
      });
    });

    group('isLoading', () {
      test('returns false when status is '
          '${LoginStatus.initial}', () {
        final model = createSubject(
          status: LoginStatus.initial,
        );
        expect(model.isLoading, false);
      });

      test('returns true when status is '
          '${LoginStatus.loading}', () {
        final model = createSubject(
          status: LoginStatus.loading,
        );
        expect(model.isLoading, true);
      });

      test('returns true when status is '
          '${LoginStatus.success}', () {
        final model = createSubject(
          status: LoginStatus.success,
        );
        expect(model.isLoading, true);
      });

      test('returns false when status is '
          '${LoginStatus.failure}', () {
        final model = createSubject(
          status: LoginStatus.failure,
        );
        expect(model.isLoading, false);
      });
    });

    group('usernameErrorText', () {
      test('returns correct value when status '
          'is ${LoginStatus.invalid}', () {
        const errorText = 'errorText';
        when(
          () => username.validationErrorText(l10n),
        ).thenReturn(errorText);
        final model = createSubject(
          status: LoginStatus.invalid,
        );
        expect(
          model.usernameErrorText(l10n),
          errorText,
        );
      });

      test('returns correct value when status '
          'is ${LoginStatus.failure}', () {
        final model = createSubject(
          status: LoginStatus.failure,
        );
        expect(
          model.usernameErrorText(l10n),
          l10n.generalServerError,
        );
      });

      test('returns null when status is not ${LoginStatus.invalid} '
          'or ${LoginStatus.failure} ', () {
        final model = createSubject(
          status: LoginStatus.success,
        );
        expect(
          model.usernameErrorText(l10n),
          null,
        );
      });
    });

    group('passwordErrorText', () {
      test('returns correct value when status '
          'is ${LoginStatus.invalid}', () {
        const errorText = 'errorText';
        when(
          () => password.validationErrorText(l10n),
        ).thenReturn(errorText);
        final model = createSubject(
          status: LoginStatus.invalid,
        );
        expect(
          model.passwordErrorText(l10n),
          errorText,
        );
      });

      test('returns correct value when status '
          'is ${LoginStatus.failure}', () {
        final model = createSubject(
          status: LoginStatus.failure,
        );
        expect(
          model.passwordErrorText(l10n),
          l10n.generalServerError,
        );
      });

      test('returns null when status is not ${LoginStatus.invalid} '
          'or ${LoginStatus.failure} ', () {
        final model = createSubject(
          status: LoginStatus.success,
        );
        expect(
          model.passwordErrorText(l10n),
          null,
        );
      });
    });
  });
}
