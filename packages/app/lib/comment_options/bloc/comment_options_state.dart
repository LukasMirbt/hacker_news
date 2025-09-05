import 'package:app/comment_options/comment_options.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_repository/post_repository.dart';

part 'comment_options_state.freezed.dart';

@freezed
abstract class CommentOptionsState with _$CommentOptionsState {
  const factory CommentOptionsState({
    required CommentModel comment,
  }) = _CommentOptionsState;

  factory CommentOptionsState.from(Comment comment) {
    return CommentOptionsState(
      comment: CommentModel.from(comment),
    );
  }
}
