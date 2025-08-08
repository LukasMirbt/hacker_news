import 'package:draft_repository/draft_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/comment_draft_options/comment_draft_options.dart';

part 'comment_draft_options_state.freezed.dart';

@freezed
abstract class CommentDraftOptionsState with _$CommentDraftOptionsState {
  const factory CommentDraftOptionsState({
    required CommentDraftModel draft,
  }) = _CommentDraftOptionsState;

  factory CommentDraftOptionsState.from(CommentDraft draft) {
    return CommentDraftOptionsState(
      draft: CommentDraftModel(draft: draft),
    );
  }
}
