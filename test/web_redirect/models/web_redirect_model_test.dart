import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';

void main() {
  final redirect = WebRedirectPlaceholder();

  group(WebRedirectModel, () {
    WebRedirectModel createSubject() {
      return WebRedirectModel(
        redirect: redirect,
      );
    }

    group('initialUrlRequest', () {
      test('returns correct value', () {
        final model = createSubject();
        expect(
          model.initialUrlRequest,
          isA<URLRequest>().having(
            (request) => request.url,
            'url',
            WebUri.uri(redirect.url),
          ),
        );
      });
    });

    group('url', () {
      test('returns correct value', () {
        final model = createSubject();
        expect(model.url, redirect.url);
      });
    });
  });
}
