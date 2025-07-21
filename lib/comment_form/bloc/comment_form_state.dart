import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/comment_form/comment_form.dart';
import 'package:post_repository/post_repository.dart';

part 'comment_form_state.freezed.dart';

enum CommentFormStatus {
  initial,
  loading,
  success,
  failure;

  bool get isFailure => this == failure;
  bool get isSuccess => this == success;
}

@freezed
abstract class CommentFormState with _$CommentFormState {
  const factory CommentFormState({
    required Post post,
    required CommentFormModel form,
    @Default(CommentFormStatus.initial) CommentFormStatus status,
  }) = _CommentFormState;

  factory CommentFormState.initial({
    required Post post,
  }) {
    return CommentFormState(
      post: post,
      form: CommentFormModel.empty,
    );
  }

  const CommentFormState._();

  bool get isLoading =>
      status == CommentFormStatus.loading ||
      status == CommentFormStatus.success;
}
