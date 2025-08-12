import 'package:equatable/equatable.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:vote_repository/vote_repository.dart';

class CurrentUserVoteError extends Error with EquatableMixin {
  CurrentUserVoteError();

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

    switch (parent) {
      case OtherUserReplyParentModel():
        final updatedParent = parent.vote(vote.type);
        return updatedParent;
      case CurrentUserReplyParentModel():
        throw CurrentUserVoteError();
    }
  }
}
