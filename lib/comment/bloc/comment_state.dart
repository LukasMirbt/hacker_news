import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_repository/post_repository.dart';

part 'comment_state.freezed.dart';

enum CommentStatus {
  initial,
  loading,
  success,
  failure;

  bool get isFailure => this == failure;
  bool get isSuccess => this == success;
}

@freezed
abstract class CommentState with _$CommentState {
  const factory CommentState({
    required FetchStatus fetchStatus,
    required Post post,
    required CommentForm? form,
    @Default(CommentStatus.initial) CommentStatus submissionStatus,
  }) = _CommentState;

  factory CommentState.initial({
    required FetchStatus fetchStatus,
    required Post post,
  }) {
    return CommentState(
      fetchStatus: fetchStatus,
      post: post,
      form: post.header.commentForm,
    );
  }

  const CommentState._();

  bool get isCommentingEnabled => form != null && fetchStatus.isSuccess;

  bool get isSubmissionLoading =>
      submissionStatus == CommentStatus.loading ||
      submissionStatus == CommentStatus.success;

  bool get isValid {
    final form = this.form;
    if (form == null) return false;

    final text = form.text;
    if (text.trim().isEmpty) return false;

    return true;
  }
}
