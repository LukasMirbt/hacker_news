// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/create_account/create_account.dart';

void main() {
  group(PasswordValidator, () {
    PasswordValidator createSubject() => PasswordValidator();

    group('validate', () {
      test('returns ${PasswordValidationError.empty} '
          'when value is empty', () {
        final validator = createSubject();
        final error = validator.validate('');
        expect(error, PasswordValidationError.empty);
      });

      test('returns null when value is not empty', () {
        final validator = createSubject();
        final error = validator.validate('value');
        expect(error, null);
      });
    });
  });
}
