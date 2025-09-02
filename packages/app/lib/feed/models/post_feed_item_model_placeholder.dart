import 'package:app/feed/feed.dart';
import 'package:feed_repository/feed_repository.dart';

// justifyMultiline
class PostFeedItemModelPlaceholder1 extends PostFeedItemModel {
  PostFeedItemModelPlaceholder1()
    : super(
        PostFeedItemPlaceholder(
          title: 'Lorem ipsum dolor sit amet amet',
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

class PostFeedItemModelPlaceholder2 extends PostFeedItemModel {
  PostFeedItemModelPlaceholder2()
    : super(
        PostFeedItemPlaceholder(
          title: 'Lorem ipsum dolor sit amet amet\n elit, sed do eiusmod',
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
