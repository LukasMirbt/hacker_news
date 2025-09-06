import 'package:app/feed/feed.dart';
import 'package:feed_repository/feed_repository.dart';

class PostFeedItemModelPlaceholder extends PostFeedItemModel {
  PostFeedItemModelPlaceholder(int index)
    : super(
        PostFeedItemPlaceholder(
          title: index.isEven
              ? 'Lorem ipsum dolor sit amet amet\n elit, sed do eiusmod'
              : 'Lorem ipsum dolor sit amet amet',
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
