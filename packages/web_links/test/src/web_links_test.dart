// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:web_links/web_links.dart';

void main() {
  group(WebLinks, () {
    const id = 'id';

    WebLinks createSubject() => WebLinks();

    group('searchUrl', () {
      test('returns correct value', () {
        final links = createSubject();
        expect(
          links.searchUrl.toString(),
          'https://hn.algolia.com/?dateRange=pastMonth',
        );
      });
    });

    group('isPost', () {
      test('returns true when url matches expected value', () {
        final links = createSubject();
        final url = Uri.parse(
          'https://news.ycombinator.com/item?id=id',
        );
        expect(links.isPost(url), true);
      });

      test('returns false when url does not match expected value', () {
        final links = createSubject();
        final url = Uri.parse(
          'https://news.ycombinator.com/user?id=id',
        );
        expect(links.isPost(url), false);
      });
    });

    group('isHackerNews', () {
      test('returns true when url matches expected value', () {
        final links = createSubject();
        final url = Uri.parse('https://news.ycombinator.com/news');
        expect(links.isHackerNews(url), true);
      });

      test('returns false when url does not match expected value', () {
        final links = createSubject();
        final url = Uri.parse('https://www.example.com');
        expect(links.isHackerNews(url), false);
      });
    });

    group('isSearch', () {
      test('returns true when url matches expected value', () {
        final links = createSubject();
        final url = Uri.parse('https://hn.algolia.com/');
        expect(links.isSearch(url), true);
      });

      test('returns false when url does not match expected value', () {
        final links = createSubject();
        final url = Uri.parse('https://www.example.com');
        expect(links.isSearch(url), false);
      });
    });

    group('resolve', () {
      test('returns url when isAbsolute', () {
        final links = createSubject();
        const url = 'https://example.com';
        expect(
          links.resolve(url),
          Uri.parse(url),
        );
      });

      test('returns resolved url when !isAbsolute', () {
        final links = createSubject();
        const url = 'item?id=id';
        expect(
          links.resolve(url),
          WebLinks.baseUrl.resolveUri(
            Uri.parse(url),
          ),
        );
      });
    });

    group('commentUrl', () {
      test('returns correct $Uri', () {
        final links = createSubject();
        expect(
          links.commentUrl(id),
          WebLinks.baseUrl.replace(
            path: 'item',
            queryParameters: {'id': id},
          ),
        );
      });
    });

    group('feedItemUrl', () {
      test('returns correct $Uri', () {
        final links = createSubject();
        expect(
          links.feedItemUrl(id),
          WebLinks.baseUrl.replace(
            path: 'item',
            queryParameters: {'id': id},
          ),
        );
      });
    });

    group('postUrl', () {
      test('returns correct $Uri', () {
        final links = createSubject();
        expect(
          links.postUrl(id),
          WebLinks.baseUrl.replace(
            path: 'item',
            queryParameters: {'id': id},
          ),
        );
      });
    });

    group('profileUrl', () {
      test('returns correct $Uri', () {
        final links = createSubject();
        expect(
          links.profileUrl(id),
          WebLinks.baseUrl.replace(
            path: 'user',
            queryParameters: {'id': id},
          ),
        );
      });
    });
  });
}
