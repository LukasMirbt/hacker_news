import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reply_repository/reply_repository.dart';

part 'reply_state.freezed.dart';

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
abstract class ReplyState with _$ReplyState {
  const factory ReplyState({
    required String url,
    required ReplyForm form,
    @Default(FetchStatus.loading) FetchStatus fetchStatus,
    @Default(SubmissionStatus.initial) SubmissionStatus submissionStatus,
  }) = _ReplyState;

  factory ReplyState.initial({
    required String url,
  }) {
    return ReplyState(
      url: url,
      form: ReplyForm.empty,
    );
  }

  const ReplyState._();

  bool get isSubmissionLoading =>
      submissionStatus.isLoading || submissionStatus.isSuccess;
}
