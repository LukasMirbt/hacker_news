// ignore_for_file: prefer_const_constructors

import 'package:app/login/login.dart';
import 'package:flutter_test/flutter_test.dart';

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
