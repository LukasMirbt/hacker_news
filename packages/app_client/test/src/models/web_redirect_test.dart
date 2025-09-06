import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:web_links/web_links.dart';

class _MockWebLinks extends Mock implements WebLinks {}

void main() {
  final url = Uri.parse('https://example.com/');
  const html = 'html';

  group(WebRedirect, () {
    late WebLinks webLinks;

    setUp(() {
      webLinks = _MockWebLinks();
      when(() => webLinks.resolve(any())).thenReturn(url);
    });

    WebRedirect createSubject() {
      return WebRedirect(
        url: url,
        webLinks: webLinks,
        html: html,
      );
    }

    group('constructor', () {
      test('returns $WebRedirect with resolved url', () {
        final redirect = createSubject();
        expect(redirect.url, url);
        expect(redirect.html, html);
        verify(
          () => webLinks.resolve(
            url.toString(),
          ),
        ).called(1);
      });
    });

    group('from', () {
      test('returns $WebRedirect', () {
        final urlString = url.toString();
        expect(
          WebRedirect.from(
            urlString,
            html: html,
          ),
          isA<WebRedirect>()
              .having(
                (redirect) => redirect.url,
                'url',
                url,
              )
              .having(
                (redirect) => redirect.html,
                'html',
                html,
              ),
        );
      });
    });
  });
}
