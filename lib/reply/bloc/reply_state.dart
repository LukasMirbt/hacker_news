import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/reply/reply.dart';

part 'reply_state.freezed.dart';

enum FetchStatus {
  loading,
  success,
  failure;

  bool get isLoading => this == loading;
  bool get isFailure => this == failure;
  bool get isSuccess => this == success;
}

@freezed
abstract class ReplyState with _$ReplyState {
  const factory ReplyState({
    required String url,
    required ReplyParentModel parent,
    @Default(ReplyFormModel.empty) ReplyFormModel form,
    @Default(FetchStatus.loading) FetchStatus fetchStatus,
  }) = _ReplyState;

  factory ReplyState.initial({
    required String url,
  }) {
    return ReplyState(
      url: url,
      parent: ReplyParentModel.empty,
    );
  }

  const ReplyState._();

  bool get isSubmittingEnabled =>
      fetchStatus.isSuccess && form.isReplyingEnabled;
}
