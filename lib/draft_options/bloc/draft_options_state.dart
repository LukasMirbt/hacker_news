import 'package:draft_repository/draft_repository.dart' show Draft;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/draft_options/draft_options.dart';

part 'draft_options_state.freezed.dart';

@freezed
abstract class DraftOptionsState with _$DraftOptionsState {
  const factory DraftOptionsState({
    required DraftModel draft,
  }) = _DraftOptionsState;

  factory DraftOptionsState.from(Draft draft) {
    return DraftOptionsState(
      draft: DraftModel(draft),
    );
  }
}
