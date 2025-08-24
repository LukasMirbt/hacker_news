// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:web_links/web_links.dart';

void main() {
  const baseUrl = 'https://news.ycombinator.com';

  group(WebLinks, () {
    const id = 'id';

    WebLinks createSubject() => WebLinks();

    group('resolve', () {
      test('returns url when isAbsolute', () {
        final links = createSubject();
        const url = 'https://www.example.com';
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
          Uri.parse('$baseUrl/$url'),
        );
      });
    });

    group('commentUrl', () {
      test('returns correct $Uri', () {
        final links = createSubject();
        expect(
          links.commentUrl(id),
          Uri.parse('$baseUrl/item?id=$id'),
        );
      });
    });

    group('feedItemUrl', () {
      test('returns correct $Uri', () {
        final links = createSubject();
        expect(
          links.feedItemUrl(id),
          Uri.parse('$baseUrl/item?id=$id'),
        );
      });
    });

    group('postUrl', () {
      test('returns correct $Uri', () {
        final links = createSubject();
        expect(
          links.postUrl(id),
          Uri.parse('$baseUrl/item?id=$id'),
        );
      });
    });

    group('searchUrl', () {
      test('returns correct $Uri', () {
        const search = 'C++';
        final links = createSubject();
        expect(
          links.searchUrl(search),
          Uri.parse('https://hn.algolia.com/?q=C%2B%2B'),
        );
      });
    });
  });
}
