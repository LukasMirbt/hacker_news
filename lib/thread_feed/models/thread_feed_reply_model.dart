import 'package:hacker_client/thread_feed/thread_feed.dart' hide ThreadFeedItem;
import 'package:reply_repository/reply_repository.dart';

class ThreadFeedReplyModel {
  const ThreadFeedReplyModel();

  PaginatedThreadFeedModel updateFeed({
    required ReplyUpdate update,
    required PaginatedThreadFeedModel feed,
  }) {
    final form = update.form;
    final parent = feed.findById(form.parent);
    if (parent == null) return feed;

    final newItem = ThreadFeedItemModel(
      item: update.comment.toThreadFeedItem(),
    );

    final updatedFeed = feed.insertAfter(
      afterItem: parent,
      newItem: newItem,
    );

    return updatedFeed;
  }
}
