import 'package:hacker_client/comment_options/comment_options.dart';
import 'package:post_repository/post_repository.dart';
import 'package:reply_repository/reply_repository.dart';

extension CommentExtension on Comment {
  ReplyParent toReplyParent() => switch (this) {
    final CurrentUserComment comment => CurrentUserCommentExtension(
      comment,
    ).toReplyParent(),
    final OtherUserComment comment => OtherUserCommentExtension(
      comment,
    ).toReplyParent(),
  };
}
