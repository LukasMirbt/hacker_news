import 'package:reply_repository/reply_repository.dart';
import 'package:thread_repository/thread_repository.dart';

extension CurrentUserThreadCommentExtension on CurrentUserThreadComment {
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
