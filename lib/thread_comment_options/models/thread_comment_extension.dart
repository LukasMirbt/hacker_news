import 'package:hacker_client/thread_comment_options/thread_comment_options.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:thread_repository/thread_repository.dart';

extension ThreadCommentExtension on ThreadComment {
  ReplyParent toReplyParent() => switch (this) {
    final CurrentUserThreadComment comment => CurrentUserThreadCommentExtension(
      comment,
    ).toReplyParent(),
    final OtherUserThreadComment comment => OtherUserThreadCommentExtension(
      comment,
    ).toReplyParent(),
  };
}
