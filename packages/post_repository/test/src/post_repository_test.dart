// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: inference_failure_on_collection_literal

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockPostApi extends Mock implements PostApi {}

void main() {
  group(PostRepository, () {
    late PostApi api;

    setUp(() {
      api = _MockPostApi();
    });

    PostRepository buildCubit() {
      return PostRepository(postApi: api);
    }

    group('fetchPostStream', () {
      const id = 'id';

      final values = List<PostData>.generate(
        10,
        (index) => PostDataPlaceholder(
          fatItemData: DetailFatItemDataPlaceholder(
            titleRowData: DetailTitleRowDataPlaceholder(
              id: index.toString(),
            ),
          ),
        ),
      );

      final fetchPostStream = () => api.fetchPostStream(id: id);

      blocTest<PostRepository, Post>(
        'calls fetchPostStream and emits $Post for each stream value',
        setUp: () {
          when(fetchPostStream).thenAnswer(
            (_) => Stream.fromIterable(values),
          );
        },
        build: buildCubit,
        act: (cubit) => cubit.fetchPostStream(id: id),
        expect: () => [
          for (final data in values) Post.from(data),
        ],
        verify: (_) {
          verify(fetchPostStream).called(1);
        },
      );
    });

    group('fetchPost', () {
      group('fetchPostStream', () {
        const id = 'id';
        final data = PostDataPlaceholder();
        final fetchPost = () => api.fetchPost(id: id);

        blocTest<PostRepository, Post>(
          'calls fetchPost and emits $Post',
          setUp: () {
            when(fetchPost).thenAnswer((_) async => data);
          },
          build: buildCubit,
          act: (cubit) => cubit.fetchPost(id: id),
          expect: () => [Post.from(data)],
          verify: (_) {
            verify(fetchPost).called(1);
          },
        );
      });
    });

    group('comment', () {
      const postId = 'postId';
      const hmac = 'hmac';
      const text = 'text';

      final postWithoutHmac = PostPlaceholder(
        header: PostHeaderPlaceholder(
          id: postId,
        ),
      );

      final postWithHmac = PostPlaceholder(
        header: PostHeaderPlaceholder(
          id: postId,
          hmac: hmac,
        ),
      );

      final data = PostDataPlaceholder();

      final comment = () => api.comment(
        postId: postId,
        hmac: hmac,
        text: text,
      );

      blocTest<PostRepository, Post>(
        'throws $CommentFailure when hmac is null',
        build: buildCubit,
        act: (cubit) {
          expect(
            () => cubit.comment(
              post: postWithoutHmac,
              text: text,
            ),
            throwsA(
              CommentFailure(postId: postId),
            ),
          );
        },
        expect: () => [],
      );

      blocTest<PostRepository, Post>(
        'calls comment and emits updated $Post '
        'when hmac is non-null',
        setUp: () {
          when(comment).thenAnswer((_) async => data);
        },
        build: buildCubit,
        act: (cubit) {
          cubit.comment(
            post: postWithHmac,
            text: text,
          );
        },
        expect: () => [
          Post.from(data),
        ],
        verify: (_) {
          verify(comment).called(1);
        },
      );
    });

    group('fetchReplyForm', () {
      const postId = 'postId';
      const commentId = 'commentId';

      final post = PostPlaceholder(
        header: PostHeaderPlaceholder(
          id: postId,
        ),
      );

      final data = ReplyFormDataPlaceholder();

      final fetchReplyForm = () => api.fetchReplyForm(
        itemId: postId,
        commentId: commentId,
      );

      test('calls fetchReplyForm and returns $ReplyForm', () {
        when(fetchReplyForm).thenAnswer((_) async => data);

        final repository = buildCubit();

        expect(
          repository.fetchReplyForm(
            post: post,
            commentId: commentId,
          ),
          completion(
            ReplyForm.from(data),
          ),
        );

        verify(fetchReplyForm).called(1);
      });
    });

    group('reply', () {
      const postId = 'postId';
      const commentId = 'commentId';
      const hmac = 'hmac';
      const text = 'text';

      final post = PostPlaceholder(
        header: PostHeaderPlaceholder(
          id: postId,
        ),
      );

      final replyFormWithoutHmac = ReplyFormPlaceholder(
        id: commentId,
      );

      final replyFormWithHmac = ReplyFormPlaceholder(
        id: commentId,
        hmac: hmac,
      );

      final data = PostDataPlaceholder();

      final reply = () => api.reply(
        postId: postId,
        commentId: commentId,
        hmac: hmac,
        text: text,
      );

      blocTest<PostRepository, Post>(
        'throws $ReplyFailure when hmac is null',
        build: buildCubit,
        act: (cubit) {
          expect(
            () => cubit.reply(
              post: post,
              replyForm: replyFormWithoutHmac,
              text: text,
            ),
            throwsA(
              ReplyFailure(commentId: commentId),
            ),
          );
        },
        expect: () => [],
      );

      blocTest<PostRepository, Post>(
        'calls reply and emits updated $Post '
        'when hmac is non-null',
        setUp: () {
          when(reply).thenAnswer((_) async => data);
        },
        build: buildCubit,
        act: (cubit) {
          cubit.reply(
            post: post,
            replyForm: replyFormWithHmac,
            text: text,
          );
        },
        expect: () => [
          Post.from(data),
        ],
        verify: (_) {
          verify(reply).called(1);
        },
      );
    });
  });
}
