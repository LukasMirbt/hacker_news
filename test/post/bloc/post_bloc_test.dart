// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/post/post.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockPostRepository extends Mock implements PostRepository {}

class _MockPostRepositoryState extends Mock implements PostRepositoryState {}

void main() {
  const id = 'id';
  const fetchStatus = FetchStatus.loading;
  const refreshStatus = RefreshStatus.initial;

  final initialState = PostState(
    id: id,
    fetchStatus: fetchStatus,
    refreshStatus: refreshStatus,
  );

  group(PostBloc, () {
    late PostRepository repository;
    late PostRepositoryState repositoryState;

    setUp(() {
      repository = _MockPostRepository();
      repositoryState = _MockPostRepositoryState();
      when(() => repository.state).thenReturn(repositoryState);
      when(() => repositoryState.fetchStatus).thenReturn(fetchStatus);
      when(() => repositoryState.refreshStatus).thenReturn(refreshStatus);
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
      final updatedRepositoryState = _MockPostRepositoryState();
      const updatedFetchStatus = FetchStatus.success;
      const updatedRefreshStatus = RefreshStatus.success;

      blocTest<PostBloc, PostState>(
        'emits updated state when stream emits new value',
        setUp: () {
          when(() => repository.stream).thenAnswer(
            (_) => Stream.value(updatedRepositoryState),
          );
          when(
            () => updatedRepositoryState.fetchStatus,
          ).thenReturn(updatedFetchStatus);
          when(
            () => updatedRepositoryState.refreshStatus,
          ).thenReturn(updatedRefreshStatus);
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            PostSubscriptionRequested(),
          );
        },
        expect: () => [
          initialState.copyWith(
            fetchStatus: updatedFetchStatus,
            refreshStatus: updatedRefreshStatus,
          ),
        ],
      );
    });

    group(PostStarted, () {
      final request = () => repository.fetchPostStream(id: id);

      blocTest<PostBloc, PostState>(
        'makes request',
        setUp: () {
          when(request).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            PostStarted(),
          );
        },
        verify: (_) {
          verify(request).called(1);
        },
      );
    });

    group(PostRefreshTriggered, () {
      final request = () => repository.refreshPost(id: id);

      blocTest<PostBloc, PostState>(
        'makes request',
        setUp: () {
          when(request).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            PostRefreshTriggered(),
          );
        },
        verify: (_) {
          verify(request).called(1);
        },
      );
    });
  });
}
