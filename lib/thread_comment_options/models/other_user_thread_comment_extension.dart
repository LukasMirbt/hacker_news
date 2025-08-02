import 'package:reply_repository/reply_repository.dart';
import 'package:thread_repository/thread_repository.dart';

extension OtherUserThreadCommentExtension on OtherUserThreadComment {
  OtherUserReplyParent toReplyParent() {
    return OtherUserReplyParent(
      id: id,
      hnuser: hnuser,
      age: age,
      htmlText: htmlText,
      upvoteUrl: upvoteUrl,
      hasBeenUpvoted: hasBeenUpvoted,
    );
  }
}
