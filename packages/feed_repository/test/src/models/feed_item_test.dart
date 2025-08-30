import 'package:feed_repository/feed_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(FeedItem, () {
    group('from', () {
      test('returns $PostFeedItem when data '
          'is $PostFeedItemData', () {
        final data = PostFeedItemDataPlaceholder();
        expect(
          FeedItem.from(data),
          PostFeedItem.from(data),
        );
      });

      test('returns $JobFeedItem when data '
          'is $JobFeedItemData', () {
        final data = JobFeedItemDataPlaceholder();
        expect(
          FeedItem.from(data),
          JobFeedItem.from(data),
        );
      });
    });
  });
}
