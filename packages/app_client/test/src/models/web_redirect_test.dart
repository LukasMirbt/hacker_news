import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:web_links/web_links.dart';

class _MockWebLinks extends Mock implements WebLinks {}

void main() {
  final url = Uri.parse('https://example.com/');

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
      );
    }

    group('constructor', () {
      test('returns $WebRedirect with resolved url', () {
        final redirect = createSubject();
        expect(redirect.url, url);
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
          WebRedirect.from(urlString),
          isA<WebRedirect>().having(
            (redirect) => redirect.url,
            'url',
            url,
          ),
        );
      });
    });

    group('urlString', () {
      test('returns correct string', () {
        final redirect = createSubject();
        expect(
          redirect.urlString,
          url.toString(),
        );
      });
    });
  });
}
