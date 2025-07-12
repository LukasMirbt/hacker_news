import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(AuthenticationStatePlaceholder, () {
    test('returns $AuthenticationState', () {
      expect(
        AuthenticationStatePlaceholder(),
        isA<AuthenticationState>(),
      );
    });
  });
}
