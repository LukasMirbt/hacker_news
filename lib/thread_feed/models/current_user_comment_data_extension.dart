import 'package:reply_repository/reply_repository.dart';
import 'package:thread_repository/thread_repository.dart';

extension CurrentUserCommentDataExtension on CurrentUserCommentData {
  CurrentUserThreadComment toThread() {
    return CurrentUserThreadComment(
      id: base.id,
      indent: base.indent,
      hnuser: base.hnuser,
      age: base.age,
      htmlText: base.htmlText,
      replyUrl: base.replyUrl,
      parentUrl: null,
      contextUrl: null,
      onUrl: null,
      onTitle: null,
      score: score,
    );
  }
}
