import 'package:app/feed/feed.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(PostFeedItemModelPlaceholder, () {
    group('constructor', () {
      test('returns $PostFeedItemModel when index.isEven', () {
        expect(
          PostFeedItemModelPlaceholder(0),
          isA<PostFeedItemModel>(),
        );
      });

      test('returns $PostFeedItemModel when !index.isEven', () {
        expect(
          PostFeedItemModelPlaceholder(1),
          isA<PostFeedItemModel>(),
        );
      });
    });
  });
}
