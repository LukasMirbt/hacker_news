import 'package:equatable/equatable.dart';
import 'package:hacker_client/comment_list/comment_list.dart'
    hide Comment, CurrentUserComment;
import 'package:post_repository/post_repository.dart';
import 'package:reply_repository/reply_repository.dart';

class CommentListReplyFailure with EquatableMixin implements Exception {
  const CommentListReplyFailure();

  @override
  List<Object?> get props => [];
}

class CommentListReplyModel {
  const CommentListReplyModel();

  CommentListModel updateCommentList({
    required ReplyUpdate update,
    required CommentListModel commentList,
  }) {
    final form = update.form;
    final afterItem = commentList.findById(form.parentId);

    if (afterItem == null) {
      throw const CommentListReplyFailure();
    }

    final newItem = CurrentUserCommentModel(
      comment: CurrentUserComment.from(update.comment),
    );

    final updatedCommentList = commentList.insertAfter(
      afterItem: afterItem,
      newItem: newItem,
    );

    return updatedCommentList;
  }
}
