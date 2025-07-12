// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/create_account/create_account.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:mocktail/mocktail.dart';

class _MockUsernameValidator extends Mock implements UsernameValidator {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  const value = 'value';

  group(Username, () {
    late UsernameValidator validator;

    setUp(() {
      validator = _MockUsernameValidator();
    });

    Username createSubject() {
      return Username(value, validator);
    }

    group('isValid', () {
      test('returns true when validate returns null', () {
        final model = createSubject();
        expect(model.isValid, true);
      });

      test('returns false when validate returns error', () {
        when(
          () => validator.validate(value),
        ).thenReturn(UsernameValidationError.empty);
        final model = createSubject();
        expect(model.isValid, false);
      });
    });

    group('validationErrorText', () {
      test('returns null when validate returns null', () {
        final model = createSubject();
        expect(model.validationErrorText(l10n), null);
      });

      test('returns correct value when error '
          'is ${UsernameValidationError.empty}', () {
        when(
          () => validator.validate(value),
        ).thenReturn(UsernameValidationError.empty);
        final model = createSubject();
        expect(
          model.validationErrorText(l10n),
          l10n.createAccount_usernameEmptyError,
        );
      });
    });
  });
}
