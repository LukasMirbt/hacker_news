import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/thread_list/thread_list.dart';

part 'thread_list_state.freezed.dart';

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
abstract class ThreadListState with _$ThreadListState {
  const factory ThreadListState({
    required ThreadListModel list,
    @Default(FetchStatus.loading) FetchStatus fetchStatus,
    @Default(RefreshStatus.initial) RefreshStatus refreshStatus,
  }) = _ThreadListState;

  factory ThreadListState.initial() {
    return ThreadListState(
      list: ThreadListModelPlaceholder(),
    );
  }
}
