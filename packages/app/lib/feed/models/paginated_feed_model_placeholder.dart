import 'package:app/feed/feed.dart';
import 'package:feed_repository/feed_repository.dart';

class PaginatedFeedModelPlaceholder extends PaginatedFeedModel {
  PaginatedFeedModelPlaceholder()
    : super(
        feed: PaginatedFeed.initial(FeedType.jobs),
        items: List.filled(
          10,
          PostFeedItemModelPlaceholder(),
        ),
      );

  @override
  bool get isPlaceholder => true;

  @override
  bool get hasReachedMax => true;

  @override
  bool get isEmpty => false;

  @override
  PaginatedFeed toRepository() => throw UnimplementedError();
}
