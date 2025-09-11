import 'package:app/comment_list/comment_list.dart' hide CurrentUserComment;
import 'package:equatable/equatable.dart';
import 'package:reply_repository/reply_repository.dart';

class CommentListReplyFailure with EquatableMixin implements Exception {
  const CommentListReplyFailure();

  @override
  List<Object?> get props => [];
}

class CommentListReplyModel {
  const CommentListReplyModel();

  CommentListModel updateCommentList({
    required Reply reply,
    required CommentListModel commentList,
  }) {
    final afterItem = commentList.findById(reply.parentId);

    if (afterItem == null) {
      throw const CommentListReplyFailure();
    }

    final newItem = CurrentUserCommentModel(
      comment: reply.toComment(),
    );

    final updatedCommentList = commentList.insertAfter(
      afterItem: afterItem,
      newItem: newItem,
    );

    return updatedCommentList;
  }
}
