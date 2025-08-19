import 'package:flutter_test/flutter_test.dart';
import 'package:redirect_validator/redirect_validator.dart';

void main() {
  group(RedirectValidationOptions, () {
    group('extraKey', () {
      test('returns correct value', () {
        expect(
          RedirectValidationOptions.extraKey,
          'validate_redirect',
        );
      });
    });

    group('extra', () {
      test('returns correct value', () {
        final options = RedirectValidationOptions();
        expect(
          options.extra,
          {RedirectValidationOptions.extraKey: true},
        );
      });
    });
  });
}
