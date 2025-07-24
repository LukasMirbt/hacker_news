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
    required String title,
    required String? htmlText,
    required CommentForm? form,
    @Default(CommentStatus.initial) CommentStatus submissionStatus,
  }) = _CommentState;

  factory CommentState.initial({
    required FetchStatus fetchStatus,
    required PostHeader header,
  }) {
    return CommentState(
      fetchStatus: fetchStatus,
      title: header.title,
      htmlText: header.htmlText,
      form: header.commentForm,
    );
  }

  const CommentState._();

  bool get isCommentingEnabled => form != null;

  bool get isSubmissionLoading =>
      submissionStatus == CommentStatus.loading ||
      submissionStatus == CommentStatus.success;
}
