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
    final userComments = <CurrentUserCommentData>[];

    for (final comment in commentThread) {
      if (comment is CurrentUserCommentData) {
        userComments.add(comment);
      }
    }

    userComments.sort(
      (a, b) => b.base.age.compareTo(a.base.age),
    );

    final newUserComment = userComments.firstOrNull;

    if (newUserComment == null) {
      throw const FindUserReplyFailure();
    }

    return newUserComment;
  }
}
