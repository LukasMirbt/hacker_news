import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/reply_form/reply_form.dart';
import 'package:post_repository/post_repository.dart';

part 'reply_form_state.freezed.dart';

enum FetchStatus {
  loading,
  success,
  failure;

  bool get isLoading => this == loading;
  bool get isFailure => this == failure;
}

enum SubmissionStatus {
  initial,
  loading,
  success,
  failure;

  bool get isLoading => this == loading;
  bool get isSuccess => this == success;
  bool get isFailure => this == failure;
}

@freezed
abstract class ReplyFormState with _$ReplyFormState {
  const factory ReplyFormState({
    required String commentId,
    required Post post,
    required ReplyFormModel replyForm,
    @Default('') String text,
    @Default(FetchStatus.loading) FetchStatus fetchStatus,
    @Default(SubmissionStatus.initial) SubmissionStatus submissionStatus,
  }) = _ReplyFormState;

  factory ReplyFormState.initial({
    required String commentId,
    required Post post,
  }) {
    return ReplyFormState(
      commentId: commentId,
      post: post,
      replyForm: ReplyFormModel.empty,
    );
  }

  const ReplyFormState._();

  bool get isSubmissionLoading =>
      submissionStatus.isLoading || submissionStatus.isSuccess;
}
