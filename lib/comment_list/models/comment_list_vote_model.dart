import 'package:equatable/equatable.dart';
import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:vote_repository/vote_repository.dart';

class CommentListVoteFailure with EquatableMixin implements Exception {
  const CommentListVoteFailure();

  @override
  List<Object?> get props => [];
}

class CommentListVoteModel {
  const CommentListVoteModel();

  CommentListModel updateCommentList({
    required Vote vote,
    required CommentListModel commentList,
  }) {
    final item = commentList.findById(vote.id);

    if (item is! OtherUserCommentModel) {
      throw const CommentListVoteFailure();
    }

    final updatedItem = item.vote(vote.type);
    final updatedList = commentList.update(updatedItem);
    return updatedList;
  }
}
