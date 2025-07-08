// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:web_links/web_links.dart';

void main() {
  group(WebLinks, () {
    const id = 'id';

    WebLinks createSubject() => WebLinks();

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
  });
}
