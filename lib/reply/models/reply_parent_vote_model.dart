import 'package:hacker_client/reply/reply.dart';
import 'package:vote_repository/vote_repository.dart';

class ReplyParentVoteVoteModel {
  const ReplyParentVoteVoteModel();

  ReplyParentModel updateParent({
    required Vote vote,
    required ReplyParentModel parent,
  }) {
    final isIdMatch = vote.id == parent.id;
    if (!isIdMatch) return parent;
    final updatedParent = parent.vote(vote.type);
    return updatedParent;
  }
}
