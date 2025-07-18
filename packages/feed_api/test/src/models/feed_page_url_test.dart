// ignore_for_file: prefer_const_constructors

import 'package:feed_api/feed_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(FeedPageUrl, () {
    group(InitialPageUrl, () {
      InitialPageUrl createSubject(FeedType type) {
        return InitialPageUrl(type);
      }

      group('url', () {
        test('returns correct value for ${FeedType.top}', () {
          final pageUrl = createSubject(FeedType.top);
          expect(pageUrl.url, 'news');
        });

        test('returns correct value for ${FeedType.newest}', () {
          final pageUrl = createSubject(FeedType.newest);
          expect(pageUrl.url, 'newest');
        });

        test('returns correct value for ${FeedType.past}', () {
          final pageUrl = createSubject(FeedType.past);
          expect(pageUrl.url, 'front');
        });

        test('returns correct value for ${FeedType.ask}', () {
          final pageUrl = createSubject(FeedType.ask);
          expect(pageUrl.url, 'ask');
        });

        test('returns correct value for ${FeedType.show}', () {
          final pageUrl = createSubject(FeedType.show);
          expect(pageUrl.url, 'show');
        });

        test('returns correct value for ${FeedType.jobs}', () {
          final pageUrl = createSubject(FeedType.jobs);
          expect(pageUrl.url, 'jobs');
        });

        test('returns correct value for ${FeedType.whoIsHiring}', () {
          final pageUrl = createSubject(FeedType.whoIsHiring);
          expect(pageUrl.url, 'submitted?id=whoishiring');
        });
      });

      test('is equatable', () {
        const type = FeedType.top;
        final first = createSubject(type);
        final second = createSubject(type);
        expect(first == second, true);
      });
    });

    group(NextPageUrl, () {
      NextPageUrl createSubject() {
        return NextPageUrl(url: 'url');
      }

      test('is equatable', () {
        final first = createSubject();
        final second = createSubject();
        expect(first == second, true);
      });
    });
  });
}
