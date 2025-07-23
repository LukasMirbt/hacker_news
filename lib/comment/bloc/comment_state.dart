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
    required Post post,
    required CommentForm form,
    @Default(CommentStatus.initial) CommentStatus status,
  }) = _CommentState;

  factory CommentState.initial({
    required Post post,
  }) {
    return CommentState(
      post: post,
      form: CommentForm.empty,
    );
  }

  const CommentState._();

  bool get isLoading =>
      status == CommentStatus.loading || status == CommentStatus.success;
}
