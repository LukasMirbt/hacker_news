import 'package:feed_repository/feed_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/feed/feed.dart';

part 'feed_state.freezed.dart';

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
abstract class FeedState with _$FeedState {
  const factory FeedState({
    required FeedType type,
    required PaginatedFeedModel feed,
    @Default(FetchStatus.loading) FetchStatus fetchStatus,
    @Default(RefreshStatus.initial) RefreshStatus refreshStatus,
    @Default(ItemPress.initial) ItemPress itemPress,
  }) = _FeedState;

  factory FeedState.initial(FeedType type) {
    return FeedState(
      type: type,
      feed: PaginatedFeedModelPlaceholder(),
    );
  }
}
