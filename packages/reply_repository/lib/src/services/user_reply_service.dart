import 'package:equatable/equatable.dart';
import 'package:reply_repository/reply_repository.dart';

class FindUserReplyFailure with EquatableMixin implements Exception {
  const FindUserReplyFailure();

  @override
  List<Object> get props => [];
}

class UserReplyService {
  const UserReplyService();

  CurrentUserCommentData newestComment(List<CommentData> commentThread) {
    final userComments =
        [
          for (final comment in commentThread)
            if (comment is CurrentUserCommentData) comment,
        ]..sort(
          (a, b) => b.base.age.compareTo(a.base.age),
        );

    final newUserComment = userComments.firstOrNull;

    if (newUserComment is! CurrentUserCommentData) {
      throw const FindUserReplyFailure();
    }

    return newUserComment;
  }
}
