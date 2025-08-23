import 'package:app/feed/feed.dart';
import 'package:feed_repository/feed_repository.dart';

class PaginatedFeedModelPlaceholder extends PaginatedFeedModel {
  PaginatedFeedModelPlaceholder()
    : super(
        feed: PaginatedFeed.initial(FeedType.jobs),
        items: List.filled(
          10,
          FeedItemModel(
            FeedItemPlaceholder(
              title: 'Lorem ipsum dolor sit amet',
              url: 'https://example.com',
              age: DateTime(1),
              urlHost: 'example.com',
              score: 10,
              hnuser: const HnuserPlaceholder(
                id: 'Lorem',
              ),
            ),
          ),
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
