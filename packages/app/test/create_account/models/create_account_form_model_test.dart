// ignore_for_file: prefer_const_constructors

import 'package:app/create_account/create_account.dart';
import 'package:app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockUsername extends Mock implements Username {}

class _MockPassword extends Mock implements Password {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(CreateAccountFormModel, () {
    late Username username;
    late Password password;

    setUp(() {
      username = _MockUsername();
      password = _MockPassword();
      when(() => username.isValid).thenReturn(true);
      when(() => password.isValid).thenReturn(true);
    });

    CreateAccountFormModel createSubject({
      CreateAccountStatus? status,
    }) {
      return CreateAccountFormModel(
        username: username,
        password: password,
        status: status ?? CreateAccountStatus.initial,
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
          '${CreateAccountStatus.initial}', () {
        final model = createSubject(
          status: CreateAccountStatus.initial,
        );
        expect(model.isLoading, false);
      });

      test('returns true when status is '
          '${CreateAccountStatus.loading}', () {
        final model = createSubject(
          status: CreateAccountStatus.loading,
        );
        expect(model.isLoading, true);
      });

      test('returns true when status is '
          '${CreateAccountStatus.success}', () {
        final model = createSubject(
          status: CreateAccountStatus.success,
        );
        expect(model.isLoading, true);
      });

      test('returns false when status is '
          '${CreateAccountStatus.failure}', () {
        final model = createSubject(
          status: CreateAccountStatus.failure,
        );
        expect(model.isLoading, false);
      });
    });

    group('usernameErrorText', () {
      test('returns correct value when status '
          'is ${CreateAccountStatus.invalid}', () {
        const errorText = 'errorText';
        when(
          () => username.validationErrorText(l10n),
        ).thenReturn(errorText);
        final model = createSubject(
          status: CreateAccountStatus.invalid,
        );
        expect(
          model.usernameErrorText(l10n),
          errorText,
        );
      });

      test('returns correct value when status '
          'is ${CreateAccountStatus.failure}', () {
        final model = createSubject(
          status: CreateAccountStatus.failure,
        );
        expect(
          model.usernameErrorText(l10n),
          l10n.generalServerError,
        );
      });

      test('returns null when status is not ${CreateAccountStatus.invalid} '
          'or ${CreateAccountStatus.failure} ', () {
        final model = createSubject(
          status: CreateAccountStatus.success,
        );
        expect(
          model.usernameErrorText(l10n),
          null,
        );
      });
    });

    group('passwordErrorText', () {
      test('returns correct value when status '
          'is ${CreateAccountStatus.invalid}', () {
        const errorText = 'errorText';
        when(
          () => password.validationErrorText(l10n),
        ).thenReturn(errorText);
        final model = createSubject(
          status: CreateAccountStatus.invalid,
        );
        expect(
          model.passwordErrorText(l10n),
          errorText,
        );
      });

      test('returns correct value when status '
          'is ${CreateAccountStatus.failure}', () {
        final model = createSubject(
          status: CreateAccountStatus.failure,
        );
        expect(
          model.passwordErrorText(l10n),
          l10n.generalServerError,
        );
      });

      test('returns null when status is not ${CreateAccountStatus.invalid} '
          'or ${CreateAccountStatus.failure} ', () {
        final model = createSubject(
          status: CreateAccountStatus.success,
        );
        expect(
          model.passwordErrorText(l10n),
          null,
        );
      });
    });
  });
}
