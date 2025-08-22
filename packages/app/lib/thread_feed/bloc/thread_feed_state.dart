import 'package:app/thread_feed/thread_feed.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'thread_feed_state.freezed.dart';

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
abstract class ThreadFeedState with _$ThreadFeedState {
  const factory ThreadFeedState({
    required PaginatedThreadFeedModel feed,
    @Default(FetchStatus.loading) FetchStatus fetchStatus,
    @Default(RefreshStatus.initial) RefreshStatus refreshStatus,
  }) = _ThreadFeedState;

  factory ThreadFeedState.initial() {
    return ThreadFeedState(
      feed: PaginatedThreadFeedModelPlaceholder(),
    );
  }
}
