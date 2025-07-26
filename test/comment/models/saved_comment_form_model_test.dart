// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockPostRepository extends Mock implements PostRepository {}

class _MockPostRepositoryState extends Mock implements PostRepositoryState {}

class _MockPost extends Mock implements Post {}

class _MockPostHeader extends Mock implements PostHeader {}

class _MockCommentForm extends Mock implements CommentForm {}

void main() {
  group(SavedCommentModel, () {
    late PostRepository repository;
    late PostRepositoryState state;
    late Post post;
    late PostHeader header;
    late CommentForm form;

    setUp(() {
      repository = _MockPostRepository();
      state = _MockPostRepositoryState();
      post = _MockPost();
      header = _MockPostHeader();
      form = _MockCommentForm();
      when(() => repository.state).thenReturn(state);
      when(() => state.post).thenReturn(post);
      when(() => post.header).thenReturn(header);
      when(() => state.fetchStatus).thenReturn(FetchStatus.loading);
    });

    SavedCommentModel createSubject() {
      return SavedCommentModel(
        postRepository: repository,
      );
    }

    group('load', () {
      test('returns null when fetchStatus.isLoading', () {
        final model = createSubject();
        expect(model.load(), null);
      });

      test('returns null when !fetchStatus.isLoading '
          'and form is null', () {
        when(() => state.fetchStatus).thenReturn(FetchStatus.success);
        final model = createSubject();
        expect(model.load(), null);
      });

      test('returns savedComment when !fetchStatus.isLoading '
          'and form is non-null', () {
        const postId = 'postId';
        const savedComment = 'savedComment';
        final readComment = () => repository.readComment(postId: postId);
        when(() => state.fetchStatus).thenReturn(FetchStatus.success);
        when(() => header.commentForm).thenReturn(form);
        when(() => form.parent).thenReturn(postId);
        when(readComment).thenReturn(savedComment);
        final model = createSubject();
        expect(model.load(), savedComment);
        verify(readComment).called(1);
      });
    });

    group('save', () {
      const text = 'text';
      const postId = 'postId';

      final saveComment = () => repository.saveComment(
        postId: postId,
        text: text,
      );

      test('returns when form is null', () {
        final model = createSubject();
        model.save(text: text);
        verifyNever(
          () => repository.saveComment(
            postId: any(named: 'postId'),
            text: any(named: 'text'),
          ),
        );
      });

      test('saves comment when form is non-null', () {
        when(() => header.commentForm).thenReturn(form);
        when(() => form.parent).thenReturn(postId);
        when(saveComment).thenAnswer((_) async {});
        final model = createSubject();
        model.save(text: text);
        verify(saveComment).called(1);
      });
    });
  });
}
