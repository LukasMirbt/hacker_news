import 'package:feed_repository/feed_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(PostFeedItemPlaceholder, () {
    test('returns $PostFeedItem', () {
      expect(
        PostFeedItemPlaceholder(),
        isA<PostFeedItem>(),
      );
    });
  });
}
