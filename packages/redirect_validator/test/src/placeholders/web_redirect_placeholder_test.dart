import 'package:flutter_test/flutter_test.dart';
import 'package:redirect_validator/redirect_validator.dart';

void main() {
  group(WebRedirectPlaceholder, () {
    test('returns $WebRedirect', () {
      expect(
        WebRedirectPlaceholder(),
        isA<WebRedirect>(),
      );
    });
  });
}
