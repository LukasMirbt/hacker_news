import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:post_repository/post_repository.dart';

part 'comment_state.freezed.dart';

@freezed
abstract class CommentState with _$CommentState {
  const factory CommentState({
    required FetchStatus fetchStatus,
    required CommentPostModel post,
    required CommentFormModel form,
  }) = _CommentState;

  const CommentState._();

  factory CommentState.from({
    required PostRepository postRepository,
  }) {
    final state = postRepository.state;
    final post = state.post;

    return CommentState(
      fetchStatus: state.fetchStatus,
      post: CommentPostModel(post),
      form: CommentFormModel(
        // TODO: Load comment
        text: '',
        form: post.header.commentForm,
      ),
    );
  }

  bool get isSubmittingEnabled =>
      fetchStatus.isSuccess && form.isCommentingEnabled;
}
