import 'package:feed_repository/feed_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(PostFeedItem, () {
    group('from', () {
      final data = PostFeedItemDataPlaceholder();
      final titleRowData = data.titleRowData;
      final subtitleRowData = data.subtitleRowData;

      test('returns $PostFeedItem', () {
        expect(
          PostFeedItem.from(data),
          PostFeedItem(
            id: titleRowData.base.id,
            rank: titleRowData.base.rank,
            title: titleRowData.base.title,
            url: titleRowData.base.url,
            urlHost: titleRowData.base.urlHost,
            upvoteUrl: titleRowData.upvoteUrl,
            hasBeenUpvoted: titleRowData.hasBeenUpvoted,
            score: subtitleRowData.score,
            hnuser: subtitleRowData.hnuser,
            commentCount: subtitleRowData.commentCount,
            age: subtitleRowData.age,
          ),
        );
      });
    });

    group('upvote', () {
      test('returns updated $PostFeedItem', () {
        const score = 1;
        const hasBeenUpvoted = false;

        final item = PostFeedItemPlaceholder(
          score: score,
          hasBeenUpvoted: hasBeenUpvoted,
        );

        expect(
          item.upvote(),
          item.copyWith(
            hasBeenUpvoted: true,
            score: score + 1,
          ),
        );
      });
    });

    group('unvote', () {
      test('returns updated $PostFeedItem', () {
        const score = 1;
        const hasBeenUpvoted = true;

        final item = PostFeedItemPlaceholder(
          score: score,
          hasBeenUpvoted: hasBeenUpvoted,
        );

        expect(
          item.unvote(),
          item.copyWith(
            hasBeenUpvoted: false,
            score: score - 1,
          ),
        );
      });
    });
  });
}
