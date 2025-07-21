import 'package:flutter_test/flutter_test.dart';
import 'package:thread_repository/thread_repository.dart';

void main() {
  group(ThreadFeedItem, () {
    group('from', () {
      final data = ThreadFeedItemDataPlaceholder();

      test('returns $ThreadFeedItem', () {
        expect(
          ThreadFeedItem.from(data),
          ThreadFeedItem(
            id: data.id,
            hnuser: data.hnuser,
            age: data.age,
            htmlText: data.htmlText,
            indent: data.indent,
            score: data.score,
            hasBeenUpvoted: data.hasBeenUpvoted,
            upvoteUrl: data.upvoteUrl,
            parentUrl: data.parentUrl,
            contextUrl: data.contextUrl,
            onUrl: data.onUrl,
          ),
        );
      });
    });

    group('unvote', () {
      test('returns updated $ThreadFeedItem', () {
        const score = 1;
        const hasBeenUpvoted = true;

        final item = ThreadFeedItemPlaceholder(
          score: score,
          hasBeenUpvoted: hasBeenUpvoted,
        );

        expect(
          item.unvote(),
          item.copyWith(
            hasBeenUpvoted: false,
          ),
        );
      });
    });

    group('upvote', () {
      test('returns updated $ThreadFeedItem', () {
        const score = 1;
        const hasBeenUpvoted = false;

        final item = ThreadFeedItemPlaceholder(
          score: score,
          hasBeenUpvoted: hasBeenUpvoted,
        );

        expect(
          item.upvote(),
          item.copyWith(
            hasBeenUpvoted: true,
          ),
        );
      });
    });
  });
}
