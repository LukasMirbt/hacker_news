import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/drafts/drafts.dart';

part 'draft_state.freezed.dart';

enum DraftStatus {
  loading,
  success,
  failure;

  bool get isLoading => this == loading;
  bool get isSuccess => this == success;
  bool get isFailure => this == failure;
}

@freezed
abstract class DraftState with _$DraftState {
  const factory DraftState({
    @Default([]) List<DraftModel> drafts,
    @Default(DraftStatus.loading) DraftStatus status,
  }) = _DraftState;
}
