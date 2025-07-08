import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/comment_options/comment_options.dart';
import 'package:post_repository/post_repository.dart';

part 'comment_options_state.freezed.dart';

@freezed
abstract class CommentOptionsState with _$CommentOptionsState {
  const factory CommentOptionsState({
    required String postId,
    required CommentModel comment,
  }) = _CommentOptionsState;

  factory CommentOptionsState.from({
    required String postId,
    required List<Comment> comments,
    required String commentId,
  }) {
    final comment = comments.firstWhere(
      (comment) => comment.id == commentId,
    );
    return CommentOptionsState(
      postId: postId,
      comment: CommentModel(comment),
    );
  }
}
