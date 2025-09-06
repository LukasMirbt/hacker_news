import 'package:app/feed/feed.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const type = FeedType.top;
  const id = 'id';
  final visitedPosts = {id};

  group(FeedState, () {
    FeedState createSubject({
      required Set<String> visitedPosts,
    }) {
      return FeedState(
        type: type,
        visitedPosts: visitedPosts,
        feed: PaginatedFeedModelPlaceholder(),
      );
    }

    group('initial', () {
      test('returns $FeedState', () {
        const type = FeedType.top;
        expect(
          FeedState.initial(
            type: type,
            visitedPosts: visitedPosts,
          ),
          FeedState(
            type: type,
            visitedPosts: visitedPosts,
            feed: PaginatedFeedModelPlaceholder(),
          ),
        );
      });
    });

    group('hasBeenVisited', () {
      final item = PostFeedItemModel(
        PostFeedItemPlaceholder(id: id),
      );

      test('returns true when visitedPosts '
          'contains item.id', () {
        final state = createSubject(
          visitedPosts: visitedPosts,
        );
        expect(state.hasBeenVisited(item), true);
      });

      test('returns false when visitedPosts '
          'does not contain item.id', () {
        final state = createSubject(
          visitedPosts: {},
        );
        expect(state.hasBeenVisited(item), false);
      });
    });
  });
}
