import 'package:draft_repository/draft_repository.dart' show Draft;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_draft_state.freezed.dart';

@freezed
abstract class DeleteDraftState with _$DeleteDraftState {
  const factory DeleteDraftState({
    required Draft draft,
  }) = _DeleteDraftState;
}
