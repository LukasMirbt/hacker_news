import 'package:authentication_repository/authentication_repository.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:thread_repository/thread_repository.dart';

class PaginatedThreadFeedModelPlaceholder extends PaginatedThreadFeedModel {
  PaginatedThreadFeedModelPlaceholder()
    : super(
        feed: PaginatedThreadFeed.initial(User.empty),
        items: List.generate(
          10,
          (index) => ThreadFeedItemModel(
            item: ThreadFeedItemPlaceholder(
              indent: index % 3,
              age: DateTime(1),
              score: 10,
              hnuser: const HnuserPlaceholder(),
              htmlText:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Praesent vel urna vitae sapien ullamcorper facilisis. '
                  'Phasellus sit amet sapien non elit tincidunt euismod.',
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
  PaginatedThreadFeed toRepository() => throw UnimplementedError();
}
