import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';

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
