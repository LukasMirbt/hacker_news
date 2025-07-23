import 'package:authentication_repository/authentication_repository.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart' hide ThreadFeedItem;
import 'package:reply_repository/reply_repository.dart';
import 'package:thread_repository/thread_repository.dart';

class ThreadFeedReplyModel {
  const ThreadFeedReplyModel();

  PaginatedThreadFeedModel updateFeed({
    required User user,
    required ReplyUpdate update,
    required PaginatedThreadFeedModel feed,
  }) {
    final form = update.form;
    final parent = feed.findById(form.parent);
    if (parent == null) return feed;

    final CommentData(
      :id,
      :indent,
      :hasBeenUpvoted,
      :score,
      :hnuser,
      :age,
      :htmlText,
      :replyUrl,
    ) = update.comment;

    final newItem = ThreadFeedItemModel(
      item: ThreadFeedItem(
        id: id,
        indent: indent,
        hasBeenUpvoted: hasBeenUpvoted,
        score: score,
        hnuser: hnuser,
        age: age,
        htmlText: htmlText,
        upvoteUrl: null,
        parentUrl: null,
        contextUrl: null,
        onUrl: null,
        onTitle: null,
        replyUrl: replyUrl,
      ),
    );

    final updatedFeed = feed.insertAfter(
      afterItem: parent,
      newItem: newItem,
    );

    return updatedFeed;
  }
}
