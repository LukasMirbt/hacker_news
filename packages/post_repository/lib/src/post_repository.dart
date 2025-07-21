import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

class CommentFailure with EquatableMixin implements Exception {
  const CommentFailure({required this.postId});

  final String postId;

  @override
  List<Object> get props => [postId];
}

class ReplyFailure with EquatableMixin implements Exception {
  const ReplyFailure({required this.commentId});

  final String commentId;

  @override
  List<Object> get props => [commentId];
}

class PostRepository extends Cubit<Post> {
  PostRepository({
    required PostApi postApi,
  }) : _api = postApi,
       super(Post.empty);

  final PostApi _api;

  Future<void> fetchPostStream({required String id}) async {
    final stream = _api.fetchPostStream(id: id);

    await for (final data in stream) {
      final post = Post.from(data);
      emit(post);
    }
  }

  Future<void> fetchPost({required String id}) async {
    final data = await _api.fetchPost(id: id);
    final post = Post.from(data);
    emit(post);
  }

  Future<void> comment(CommentForm form) async {
    await _api.comment(
      form.toApi(),
    );
    final data = await _api.fetchPost(
      id: form.parent,
    );
    final updatedPost = Post.from(data);
    emit(updatedPost);
  }
}
