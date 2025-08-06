import 'package:freezed_annotation/freezed_annotation.dart';

part 'draft_state.freezed.dart';

enum DraftStatus {
  loading,
  success,
  failure;

  bool get isSuccess => this == success;
}

@freezed
abstract class DraftState with _$DraftState {
  const factory DraftState({
    @Default(DraftStatus.loading) DraftStatus fetchStatus,
  }) = _DraftState;
}
