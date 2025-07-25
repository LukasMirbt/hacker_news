import 'package:hacker_client/comment/comment.dart';
import 'package:post_repository/post_repository.dart';

class SavedCommentForm {
  const SavedCommentForm({
    required PostRepository postRepository,
  }) : _repository = postRepository;

  final PostRepository _repository;

  CommentFormModel load() {
    final state = _repository.state;
    final fetchStatus = state.fetchStatus;
    final post = state.post;

    var form = post.header.commentForm;

    if (!fetchStatus.isLoading && form != null) {
      final savedComment = _repository.readComment(
        postId: form.parent,
      );

      form = form.copyWith(
        text: savedComment ?? '',
      );
    }

    return CommentFormModel(form: form);
  }

  void save(CommentFormModel form) {
    final repositoryForm = form.toRepository();
    if (repositoryForm == null) return;

    _repository.saveComment(
      postId: repositoryForm.parent,
      text: form.text,
    );
  }
}
