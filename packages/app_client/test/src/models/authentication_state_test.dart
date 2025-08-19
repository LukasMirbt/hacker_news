import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(AuthenticationState, () {
    group('initial', () {
      test('returns $AuthenticationState', () {
        final baseUrl = Uri.parse('https://example.com');
        expect(
          AuthenticationState.initial(baseUrl: baseUrl),
          AuthenticationState(
            baseUrl: baseUrl,
            webRedirect: WebRedirect.empty,
          ),
        );
      });
    });
  });
}
