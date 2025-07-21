import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/thread_item_options/thread_item_options.dart';
import 'package:thread_repository/thread_repository.dart';

part 'thread_item_options_state.freezed.dart';

@freezed
abstract class ThreadItemOptionsState with _$ThreadItemOptionsState {
  const factory ThreadItemOptionsState({
    required ThreadItemModel item,
  }) = _ThreadItemOptionsState;

  factory ThreadItemOptionsState.from(ThreadFeedItem item) {
    return ThreadItemOptionsState(
      item: ThreadItemModel(item),
    );
  }
}
