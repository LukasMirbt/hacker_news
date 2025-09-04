import 'package:app/app_web_view/app_web_view.dart';
import 'package:app/web_redirect/web_redirect.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const url = 'url';
  const html = 'html';

  group(WebRedirectWebViewConfiguration, () {
    WebRedirectWebViewConfiguration createSubject() {
      return WebRedirectWebViewConfiguration(
        url: url,
        html: html,
      );
    }

    test('is an $AppWebViewConfiguration', () {
      final configuration = createSubject();
      expect(configuration, isA<AppWebViewConfiguration>());
    });

    group('initialUrl', () {
      test('has correct value', () {
        final configuration = createSubject();
        expect(
          configuration.initialUrl,
          Uri.parse(url),
        );
      });
    });

    group('initialHtml', () {
      test('has correct value', () {
        final configuration = createSubject();
        expect(
          configuration.initialHtml,
          html,
        );
      });
    });
  });
}
