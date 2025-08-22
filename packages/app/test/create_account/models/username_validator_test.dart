// ignore_for_file: prefer_const_constructors

import 'package:app/create_account/create_account.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(UsernameValidator, () {
    UsernameValidator createSubject() => UsernameValidator();

    group('validate', () {
      test('returns ${UsernameValidationError.empty} '
          'when value is empty', () {
        final validator = createSubject();
        final error = validator.validate('');
        expect(error, UsernameValidationError.empty);
      });

      test('returns null when value is not empty', () {
        final validator = createSubject();
        final error = validator.validate('value');
        expect(error, null);
      });
    });
  });
}
