import 'package:app/feed/feed.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(PostFeedItemModelPlaceholder, () {
    group('constructor', () {
      test('returns $PostFeedItemModel', () {
        expect(
          PostFeedItemModelPlaceholder(),
          isA<PostFeedItemModel>(),
        );
      });
    });
  });
}
