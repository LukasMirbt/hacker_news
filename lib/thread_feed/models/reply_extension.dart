import 'package:reply_repository/reply_repository.dart';
import 'package:thread_repository/thread_repository.dart';

extension ReplyExtension on Reply {
  CurrentUserThreadComment toThread() {
    return CurrentUserThreadComment(
      id: id,
      indent: indent,
      hnuser: hnuser,
      age: age,
      htmlText: htmlText,
      replyUrl: replyUrl,
      score: score,
      parentUrl: null,
      contextUrl: null,
      onUrl: null,
      onTitle: null,
    );
  }
}
