import 'package:reply_repository/reply_repository.dart';
import 'package:thread_repository/thread_repository.dart';

extension CommentDataExtension on CommentData {
  ThreadFeedItem toThreadFeedItem() {
    final comment = this;

    return ThreadFeedItem(
      id: base.id,
      indent: base.indent,
      hasBeenUpvoted: comment is OtherUserCommentData && comment.hasBeenUpvoted,
      score: comment is CurrentUserCommentData ? comment.score : 0,
      hnuser: base.hnuser,
      age: base.age,
      htmlText: base.htmlText,
      upvoteUrl: comment is OtherUserCommentData ? comment.upvoteUrl : null,
      parentUrl: null,
      contextUrl: null,
      onUrl: null,
      onTitle: null,
      replyUrl: base.replyUrl,
    );
  }
}
