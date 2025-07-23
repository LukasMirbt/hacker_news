import 'package:reply_repository/reply_repository.dart';
import 'package:thread_repository/thread_repository.dart';

extension CommentDataExtension on CommentData {
  ThreadFeedItem toThreadFeedItem() {
    return ThreadFeedItem(
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
    );
  }
}
