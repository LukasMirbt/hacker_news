import 'package:authentication_api/authentication_api.dart';
import 'package:equatable/equatable.dart';
import 'package:reply_repository/reply_repository.dart';

class FindUserReplyFailure with EquatableMixin implements Exception {
  const FindUserReplyFailure();

  @override
  List<Object> get props => [];
}

class UserReplyService {
  UserReplyService({
    required AuthenticationApi authenticationApi,
  }) : _authenticationApi = authenticationApi;

  final AuthenticationApi _authenticationApi;

  CommentData newestComment(List<CommentData> commentThread) {
    final user = _authenticationApi.state.user;

    final userComments =
        commentThread
            .where(
              (comment) => comment.base.hnuser.id == user.id,
            )
            .toList()
          ..sort(
            (a, b) => b.base.age.compareTo(a.base.age),
          );

    if (userComments.isEmpty) throw const FindUserReplyFailure();

    final newUserComment = userComments.first;
    return newUserComment;
  }
}
