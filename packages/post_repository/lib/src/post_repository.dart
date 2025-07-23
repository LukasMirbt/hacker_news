import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:post_repository/post_repository.dart';

class PostRepository extends Cubit<Post> {
  PostRepository({
    required PostApi postApi,
    CancelTokenService? cancelTokenService,
  }) : _api = postApi,
       _cancelTokenService = cancelTokenService ?? CancelTokenService(),
       super(Post.empty);

  final PostApi _api;
  final CancelTokenService _cancelTokenService;

  Future<void> fetchPostStream({required String id}) async {
    final cancelToken = _cancelTokenService.generate();

    final stream = _api.fetchPostStream(
      id: id,
      cancelToken: cancelToken,
    );

    await for (final data in stream) {
      final post = Post.from(data);
      emit(post);
    }
  }

  Future<void> fetchPost({required String id}) async {
    final cancelToken = _cancelTokenService.generate();

    final data = await _api.fetchPost(
      id: id,
      cancelToken: cancelToken,
    );

    final post = Post.from(data);
    emit(post);
  }

  Future<void> comment(CommentForm form) async {
    await _api.comment(form.toApi());

    try {
      final cancelToken = _cancelTokenService.generate();

      final data = await _api.fetchPost(
        id: form.parent,
        cancelToken: cancelToken,
      );

      final updatedPost = Post.from(data);
      emit(updatedPost);
    } catch (_) {
      // Don't throw when comment succeeds but fetchPost fails
      // so the user doesn't submit comments twice.
    }
  }
}
