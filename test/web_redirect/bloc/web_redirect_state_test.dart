import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';
import 'package:mocktail/mocktail.dart';

class _MockWebRedirectModel extends Mock implements WebRedirectModel {}

void main() {
  group(WebRedirectState, () {
    WebRedirectState createSubject() {
      return WebRedirectState(
        redirect: _MockWebRedirectModel(),
      );
    }

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

    group('progressValue', () {
      test('returns progress divided by 100', () {
        final state = createSubject();
        final progressState = state.copyWith(
          progress: 50,
        );
        expect(progressState.progressValue, 0.5);
      });
    });
  });
}
