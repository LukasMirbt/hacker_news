import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/feed/feed.dart';

void main() {
  group(ItemPress, () {
    group('constructor', () {
      ItemPress createSubject() {
        return ItemPress(
          id: 'id',
          url: 'urlHost',
          urlHost: 'url',
        );
      }

      test('is not equatable', () {
        final first = createSubject();
        final second = createSubject();
        expect(first == second, false);
      });
    });

    group('initial', () {
      ItemPress createSubject() => ItemPress.initial;

      test('is equatable', () {
        final first = createSubject();
        final second = createSubject();
        expect(first == second, true);
      });
    });
  });
}
