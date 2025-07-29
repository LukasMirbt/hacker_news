import 'package:reply_repository/reply_repository.dart';
import 'package:thread_repository/thread_repository.dart';

extension CurrentUserCommentDataExtension on CurrentUserCommentData {
  ThreadFeedItem toThreadFeedItem() {
    return ThreadFeedItem(
      upvoteUrl: null,
      hasBeenUpvoted: null,
      id: base.id,
      indent: base.indent,
      score: score,
      hnuser: base.hnuser,
      age: base.age,
      htmlText: base.htmlText,
      parentUrl: null,
      contextUrl: null,
      onUrl: null,
      onTitle: null,
      replyUrl: base.replyUrl,
    );
  }
}
