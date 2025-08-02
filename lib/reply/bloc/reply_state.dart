import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/reply/reply.dart' hide ReplyParent;
import 'package:reply_repository/reply_repository.dart';

part 'reply_state.freezed.dart';

enum FetchStatus {
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
    required ReplyParentModel parent,
    @Default(ReplyFormModel.empty) ReplyFormModel form,
    @Default(FetchStatus.loading) FetchStatus fetchStatus,
  }) = _ReplyState;

  factory ReplyState.initial({
    required String url,
    required ReplyParent? parent,
  }) {
    return ReplyState(
      url: url,
      parent: ReplyParentModel.initial(parent),
    );
  }

  const ReplyState._();

  bool get isPlaceholder => parent is OtherUserReplyParentModelPlaceholder;

  bool get isSubmittingEnabled =>
      fetchStatus.isSuccess && form.isReplyingEnabled;
}
