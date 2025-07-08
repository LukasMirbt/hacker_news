import 'package:freezed_annotation/freezed_annotation.dart';
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
    @Default('') String text,
    @Default(CommentFormStatus.initial) CommentFormStatus status,
  }) = _CommentFormState;

  const CommentFormState._();

  bool get isLoading =>
      status == CommentFormStatus.loading ||
      status == CommentFormStatus.success;
}
