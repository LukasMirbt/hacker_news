import 'package:equatable/equatable.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:vote_repository/vote_repository.dart';

class ReplyParentVoteFailure with EquatableMixin implements Exception {
  const ReplyParentVoteFailure();

  @override
  List<Object?> get props => [];
}

class ReplyParentVoteModel {
  const ReplyParentVoteModel();

  ReplyParentModel updateParent({
    required Vote vote,
    required ReplyParentModel parent,
  }) {
    final isIdMatch = vote.id == parent.id;
    if (!isIdMatch) return parent;

    if (parent is! OtherUserReplyParentModel) {
      throw const ReplyParentVoteFailure();
    }

    final updatedParent = parent.vote(vote.type);
    return updatedParent;
  }
}
