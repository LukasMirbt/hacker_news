import 'package:feed_repository/feed_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(FeedItem, () {
    group('from', () {
      final data = FeedItemDataPlaceholder();
      final titleRowData = data.titleRowData;
      final subtitleRowData = data.subtitleRowData;

      test('returns $FeedItem', () {
        expect(
          FeedItem.from(data),
          FeedItem(
            id: titleRowData.id,
            rank: titleRowData.rank,
            title: titleRowData.title,
            url: titleRowData.url,
            urlHost: titleRowData.urlHost,
            upvoteUrl: titleRowData.upvoteUrl,
            hasBeenUpvoted: titleRowData.hasBeenUpvoted,
            score: subtitleRowData.score,
            hnuser: subtitleRowData.hnuser,
            age: subtitleRowData.age,
            commentCount: subtitleRowData.commentCount,
          ),
        );
      });
    });

    group('unvote', () {
      test('returns updated $FeedItem', () {
        const score = 1;
        const hasBeenUpvoted = true;

        final item = FeedItemPlaceholder(
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

    group('upvote', () {
      test('returns updated $FeedItem', () {
        const score = 1;
        const hasBeenUpvoted = false;

        final item = FeedItemPlaceholder(
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
  });
}
