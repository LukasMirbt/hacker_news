import 'package:post_repository/post_repository.dart';
import 'package:reply_repository/reply_repository.dart';

extension OtherUserCommentExtension on OtherUserComment {
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
