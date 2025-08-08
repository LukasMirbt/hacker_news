import 'package:draft_repository/draft_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/reply_draft_options/reply_draft_options.dart';

part 'reply_draft_options_state.freezed.dart';

@freezed
abstract class ReplyDraftOptionsState with _$ReplyDraftOptionsState {
  const factory ReplyDraftOptionsState({
    required ReplyDraftModel draft,
  }) = _ReplyDraftOptionsState;

  factory ReplyDraftOptionsState.from(ReplyDraft draft) {
    return ReplyDraftOptionsState(
      draft: ReplyDraftModel(draft: draft),
    );
  }
}
