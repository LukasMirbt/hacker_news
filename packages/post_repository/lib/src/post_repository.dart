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

  Future<void> comment({
    required Post post,
    required String text,
  }) async {
    final postId = post.header.id;
    final hmac = post.header.hmac;
    if (hmac == null) throw CommentFailure(postId: postId);

    final data = await _api.comment(
      postId: postId,
      hmac: hmac,
      text: text,
    );

    final updatedPost = Post.from(data);
    emit(updatedPost);
  }

  Future<ReplyForm> fetchReplyForm({
    required Post post,
    required String commentId,
  }) async {
    final data = await _api.fetchReplyForm(
      itemId: post.header.id,
      commentId: commentId,
    );
    final replyForm = ReplyForm.from(data);
    return replyForm;
  }

  Future<void> reply({
    required Post post,
    required ReplyForm replyForm,
    required String text,
  }) async {
    final commentId = replyForm.id;
    final hmac = replyForm.hmac;
    if (hmac == null) throw ReplyFailure(commentId: commentId);

    final data = await _api.reply(
      postId: post.header.id,
      commentId: commentId,
      hmac: hmac,
      text: text,
    );

    final updatedPost = Post.from(data);
    emit(updatedPost);
  }
}
