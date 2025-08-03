import 'package:post_repository/post_repository.dart';
import 'package:reply_repository/reply_repository.dart';

extension CurrentUserCommentExtension on CurrentUserComment {
  CurrentUserReplyParent toReplyParent() {
    return CurrentUserReplyParent(
      id: id,
      hnuser: hnuser,
      age: age,
      htmlText: htmlText,
      score: score,
    );
  }
}
