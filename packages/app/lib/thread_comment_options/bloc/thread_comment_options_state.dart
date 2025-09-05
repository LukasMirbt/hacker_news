import 'package:app/thread_comment_options/thread_comment_options.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thread_repository/thread_repository.dart';

part 'thread_comment_options_state.freezed.dart';

@freezed
abstract class ThreadCommentOptionsState with _$ThreadCommentOptionsState {
  const factory ThreadCommentOptionsState({
    required ThreadCommentModel comment,
  }) = _ThreadCommentOptionsState;

  factory ThreadCommentOptionsState.from(ThreadComment comment) {
    return ThreadCommentOptionsState(
      comment: ThreadCommentModel.from(comment),
    );
  }
}
