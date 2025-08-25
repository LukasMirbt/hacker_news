import 'package:app/web_redirect/web_redirect.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(WebRedirectState, () {
    group('from', () {
      test('returns $WebRedirectState', () {
        final redirect = WebRedirectPlaceholder();
        expect(
          WebRedirectState.from(redirect),
          isA<WebRedirectState>().having(
            (state) => state.redirect,
            'redirect',
            isA<WebRedirectModel>(),
          ),
        );
      });
    });
  });
}
