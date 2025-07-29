import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:reply_repository/reply_repository.dart';

class ThreadFeedReplyModel {
  const ThreadFeedReplyModel();

  PaginatedThreadFeedModel updateFeed({
    required ReplyUpdate update,
    required PaginatedThreadFeedModel feed,
  }) {
    final form = update.form;
    final parent = feed.findById(form.parentId);
    if (parent == null) return feed;

    final newItem = ThreadCommentModel(
      item: update.comment.toThread(),
    );

    final updatedFeed = feed.insertAfter(
      afterItem: parent,
      newItem: newItem,
    );

    return updatedFeed;
  }
}
