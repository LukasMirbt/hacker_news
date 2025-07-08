import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';

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
