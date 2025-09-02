import 'package:app/feed/feed.dart';
import 'package:feed_repository/feed_repository.dart';

class PostFeedItemModelPlaceholder extends PostFeedItemModel {
  PostFeedItemModelPlaceholder()
    : super(
        PostFeedItemPlaceholder(
          title: 'Lorem ipsum dolor sit amet ellisis',
          url: 'https://example.com',
          age: DateTime(1),
          urlHost: 'example.com',
          score: 10,
          hnuser: const HnuserPlaceholder(
            id: 'Lorem',
          ),
        ),
      );
}
