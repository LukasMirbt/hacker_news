import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:post_repository/post_repository.dart';

part 'comment_state.freezed.dart';

@freezed
abstract class CommentState with _$CommentState {
  const factory CommentState({
    required FetchStatus fetchStatus,
    required Post post,
    required CommentFormModel form,
  }) = _CommentState;

  const CommentState._();

  bool get isSubmittingEnabled =>
      fetchStatus.isSuccess && form.isCommentingEnabled;
}
