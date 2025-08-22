import 'package:app/feed_item_options/feed_item_options.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_item_options_state.freezed.dart';

@freezed
abstract class FeedItemOptionsState with _$FeedItemOptionsState {
  const factory FeedItemOptionsState({
    required FeedItemModel item,
  }) = _FeedItemOptionsState;

  factory FeedItemOptionsState.from(FeedItem item) {
    return FeedItemOptionsState(
      item: FeedItemModel(item),
    );
  }
}
