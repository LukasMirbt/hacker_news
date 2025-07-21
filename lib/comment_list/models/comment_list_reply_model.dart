import 'package:authentication_repository/authentication_repository.dart';
import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:post_repository/post_repository.dart';
import 'package:reply_repository/reply_repository.dart';

class CommentListReplyModel {
  const CommentListReplyModel();

  CommentListModel updateCommentList({
    required User user,
    required ReplyUpdate update,
    required CommentListModel commentList,
  }) {
    final form = update.form;
    final parent = commentList.findById(form.parent);
    if (parent == null) return commentList;

    final newItem = CommentModel(
      comment: Comment.from(update.comment),
    );

    final updatedCommentList = commentList.insertAfter(
      afterItem: parent,
      newItem: newItem,
    );

    return updatedCommentList;
  }
}
