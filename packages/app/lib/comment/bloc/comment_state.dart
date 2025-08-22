import 'package:app/comment/comment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_repository/post_repository.dart';

part 'comment_state.freezed.dart';

@freezed
abstract class CommentState with _$CommentState {
  const factory CommentState({
    required FetchStatus fetchStatus,
    required CommentPostHeaderModel header,
    required CommentFormModel form,
  }) = _CommentState;

  const CommentState._();

  factory CommentState.from(PostRepository repository) {
    final state = repository.state;
    final header = state.post.header;
    final form = header.commentForm;

    return CommentState(
      fetchStatus: state.fetchStatus,
      header: CommentPostHeaderModel(header),
      form: CommentFormModel(form: form),
    );
  }

  bool get isSubmittingEnabled =>
      fetchStatus.isSuccess && form.isCommentingEnabled;
}
