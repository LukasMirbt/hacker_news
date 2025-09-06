import 'package:app/app_web_view/app_web_view.dart';
import 'package:app/web_redirect/web_redirect.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final url = Uri.parse('url');
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
        expect(configuration.initialUrl, url);
      });
    });

    group('initialHtml', () {
      test('has correct value', () {
        final configuration = createSubject();
        expect(configuration.initialHtml, html);
      });
    });
  });
}
