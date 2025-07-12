// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/post/post.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockPostRepository extends Mock implements PostRepository {}

void main() {
  const id = 'id';
  const initialState = PostState(id: id);

  group(PostBloc, () {
    late PostRepository repository;

    setUp(() {
      repository = _MockPostRepository();
    });

    PostBloc buildBloc() {
      return PostBloc(
        id: id,
        postRepository: repository,
      );
    }

    test('initial state is $PostState', () {
      expect(buildBloc().state, initialState);
    });

    group(PostSubscriptionRequested, () {
      final updatedPost = PostPlaceholder();

      blocTest<PostBloc, PostState>(
        'emits success when stream emits new value',
        setUp: () {
          when(() => repository.stream).thenAnswer(
            (_) => Stream.value(updatedPost),
          );
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            PostSubscriptionRequested(),
          );
        },
        expect: () => [
          initialState.copyWith(
            fetchStatus: FetchStatus.success,
          ),
        ],
      );
    });

    group(PostStarted, () {
      final request = () => repository.fetchPostStream(id: id);

      blocTest<PostBloc, PostState>(
        'returns when request succeeds',
        setUp: () {
          when(request).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            PostStarted(),
          );
        },
        expect: () => <PostState>[],
        verify: (_) {
          verify(request).called(1);
        },
      );

      blocTest<PostBloc, PostState>(
        'emits [failure] when request throws',
        setUp: () {
          when(request).thenThrow(Exception('oops'));
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            PostStarted(),
          );
        },
        expect: () => [
          initialState.copyWith(
            fetchStatus: FetchStatus.failure,
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );
    });

    group(PostRefreshTriggered, () {
      final request = () => repository.fetchPost(id: id);

      blocTest<PostBloc, PostState>(
        'emits [loading, success] when request succeeds',
        setUp: () {
          when(request).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            PostRefreshTriggered(),
          );
        },
        expect: () => [
          initialState.copyWith(
            refreshStatus: RefreshStatus.loading,
          ),
          initialState.copyWith(
            refreshStatus: RefreshStatus.success,
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );

      blocTest<PostBloc, PostState>(
        'emits [loading, failure] when request throws',
        setUp: () {
          when(request).thenThrow(Exception('oops'));
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            PostRefreshTriggered(),
          );
        },
        expect: () => [
          initialState.copyWith(
            refreshStatus: RefreshStatus.loading,
          ),
          initialState.copyWith(
            refreshStatus: RefreshStatus.failure,
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );
    });
  });
}
