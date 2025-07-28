import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/reply_options/reply_options.dart';
import 'package:reply_repository/reply_repository.dart';

part 'reply_options_state.freezed.dart';

@freezed
abstract class ReplyOptionsState with _$ReplyOptionsState {
  const factory ReplyOptionsState({
    required ReplyParentModel parent,
  }) = _ReplyOptionsState;

  factory ReplyOptionsState.from({
    required ReplyParent parent,
  }) {
    return ReplyOptionsState(
      parent: ReplyParentModel(parent),
    );
  }
}
