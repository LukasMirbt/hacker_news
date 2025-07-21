import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:vote_repository/vote_repository.dart';

class CommentListVoteModel {
  const CommentListVoteModel();

  CommentListModel updateCommentList({
    required Vote vote,
    required CommentListModel commentList,
  }) {
    final item = commentList.findById(vote.id);
    if (item == null) return commentList;
    final updatedItem = item.vote(vote.type);
    final updatedList = commentList.update(updatedItem);
    return updatedList;
  }
}
