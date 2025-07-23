// ignore_for_file: prefer_function_declarations_over_variables

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

    group('comment', () {
      final form = CommentFormPlaceholder();
      final data = PostDataPlaceholder();

      final comment = () => api.comment(form.toApi());
      final fetchPost = () => api.fetchPost(id: form.parent);

      blocTest<PostRepository, Post>(
        'calls comment and emits updated $Post '
        'when fetchPost succeeds',
        setUp: () {
          when(comment).thenAnswer((_) async {});
          when(fetchPost).thenAnswer((_) async => data);
        },
        build: buildCubit,
        act: (cubit) => cubit.comment(form),

        expect: () => [
          Post.from(data),
        ],
        verify: (_) {
          verify(comment).called(1);
          verify(fetchPost).called(1);
        },
      );

      blocTest<PostRepository, Post>(
        'calls comment and returns when fetchPost fails',
        setUp: () {
          when(comment).thenAnswer((_) async {});
          when(fetchPost).thenThrow(Exception('oops'));
        },
        build: buildCubit,
        act: (cubit) => cubit.comment(form),
        expect: () => <Post>[],
        errors: () => <Object?>[],
        verify: (_) {
          verify(comment).called(1);
          verify(fetchPost).called(1);
        },
      );
    });
  });
}
