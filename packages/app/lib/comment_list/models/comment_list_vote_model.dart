import 'package:app/comment_list/comment_list.dart';
import 'package:equatable/equatable.dart';
import 'package:vote_repository/vote_repository.dart';

class CurrentUserVoteError extends Error with EquatableMixin {
  CurrentUserVoteError();

  @override
  List<Object> get props => [];
}

class CommentListVoteModel {
  const CommentListVoteModel();

  CommentListModel updateCommentList({
    required Vote vote,
    required CommentListModel commentList,
  }) {
    final item = commentList.findById(vote.id);

    switch (item) {
      case null:
        return commentList;
      case final OtherUserCommentModel item:
        final updatedItem = item.vote(vote.type);
        final updatedList = commentList.update(updatedItem);
        return updatedList;
      case CurrentUserCommentModel():
        throw CurrentUserVoteError();
    }
  }
}
