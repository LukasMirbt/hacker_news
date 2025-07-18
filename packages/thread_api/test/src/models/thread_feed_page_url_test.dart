// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:thread_api/thread_api.dart';

void main() {
  group(ThreadFeedPageUrl, () {
    group(InitialPageUrl, () {
      const id = 'id';

      InitialPageUrl createSubject() {
        return InitialPageUrl(id: id);
      }

      group('url', () {
        test('returns correct value', () {
          final pageUrl = createSubject();
          expect(pageUrl.url, 'threads?id=$id');
        });
      });

      test('is equatable', () {
        final first = createSubject();
        final second = createSubject();
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
