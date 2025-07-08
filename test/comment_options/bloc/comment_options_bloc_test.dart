// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_options/bloc/bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockPostRepository extends Mock implements PostRepository {}

void main() {
  const commentId = 'commentId';

  final post = PostPlaceholder(
    comments: [
      CommentPlaceholder(id: commentId),
    ],
  );

  group(CommentOptionsBloc, () {
    late PostRepository repository;

    setUp(() {
      repository = _MockPostRepository();
      when(() => repository.state).thenReturn(post);
    });

    CommentOptionsBloc buildBloc() {
      return CommentOptionsBloc(
        commentId: commentId,
        postRepository: repository,
      );
    }

    test('initial state is $CommentOptionsState', () {
      expect(
        buildBloc().state,
        CommentOptionsState.from(
          postId: post.header.id,
          comments: post.comments,
          commentId: commentId,
        ),
      );
    });
  });
}
