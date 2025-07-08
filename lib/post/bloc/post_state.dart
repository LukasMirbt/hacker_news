import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_state.freezed.dart';

enum FetchStatus {
  loading,
  success,
  failure;

  bool get isLoading => this == loading;
  bool get isFailure => this == failure;
}

enum RefreshStatus {
  initial,
  loading,
  success,
  failure;

  bool get isLoading => this == loading;
}

@freezed
abstract class PostState with _$PostState {
  const factory PostState({
    required String id,
    @Default(FetchStatus.loading) FetchStatus fetchStatus,
    @Default(RefreshStatus.initial) RefreshStatus refreshStatus,
  }) = _PostState;
}
