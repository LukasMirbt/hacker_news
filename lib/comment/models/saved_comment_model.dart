import 'package:post_repository/post_repository.dart';

class SavedCommentModel {
  const SavedCommentModel({
    required PostRepository postRepository,
  }) : _repository = postRepository;

  final PostRepository _repository;

  String? load() {
    final state = _repository.state;
    final fetchStatus = state.fetchStatus;
    if (fetchStatus.isLoading) return null;

    final post = state.post;
    final form = post.header.commentForm;
    if (form == null) return null;

    final savedComment = _repository.readComment(
      parentId: form.parentId,
    );
    return savedComment;
  }

  void save({required String text}) {
    final state = _repository.state;
    final post = state.post;
    final form = post.header.commentForm;
    if (form == null) return;

    _repository.saveComment(
      parentId: form.parentId,
      text: text,
    );
  }
}
