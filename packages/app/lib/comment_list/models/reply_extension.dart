import 'package:post_repository/post_repository.dart';
import 'package:reply_repository/reply_repository.dart';

extension ReplyExtension on Reply {
  CurrentUserComment toComment() {
    return CurrentUserComment(
      id: id,
      indent: indent,
      hnuser: hnuser,
      age: age,
      htmlText: htmlText,
      replyUrl: replyUrl,
      score: score,
      editUrl: editUrl,
      deleteUrl: deleteUrl,
    );
  }
}
