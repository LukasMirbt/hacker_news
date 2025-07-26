// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_api/authentication_api.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockPostApi extends Mock implements PostApi {}

class _MockAuthenticationApi extends Mock implements AuthenticationApi {}

class _MockAuthenticationState extends Mock implements AuthenticationState {}

class _MockCommentStorage extends Mock implements CommentStorage {}

class _MockCancelTokenService extends Mock implements CancelTokenService {}

class _MockCancelToken extends Mock implements CancelToken {}

void main() {
  final initialState = PostRepositoryState();
  final exception = Exception('oops');

  group(PostRepository, () {
    late PostApi postApi;
    late AuthenticationApi authenticationApi;
    late AuthenticationState authenticationState;
    late CommentStorage commentStorage;
    late CancelTokenService cancelTokenService;
    late CancelToken cancelToken;

    setUp(() {
      postApi = _MockPostApi();
      authenticationApi = _MockAuthenticationApi();
      authenticationState = _MockAuthenticationState();
      commentStorage = _MockCommentStorage();
      cancelTokenService = _MockCancelTokenService();
      cancelToken = _MockCancelToken();
      when(() => authenticationApi.state).thenReturn(authenticationState);
    });

    PostRepository buildCubit() {
      return PostRepository(
        postApi: postApi,
        authenticationApi: authenticationApi,
        commentStorage: commentStorage,
        cancelTokenService: cancelTokenService,
      );
    }

    final generate = () => cancelTokenService.generate();

    group('constructor', () {
      test('returns normally', () {
        expect(
          () => PostRepository(
            postApi: postApi,
            authenticationApi: authenticationApi,
            commentStorage: commentStorage,
          ),
          returnsNormally,
        );
      });
    });

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

      final fetchPostStream = () => postApi.fetchPostStream(
        id: id,
        cancelToken: cancelToken,
      );

      blocTest<PostRepository, PostRepositoryState>(
        'emits [success] and $Post for each stream value '
        'when stream succeeds',
        setUp: () {
          when(generate).thenReturn(cancelToken);
          when(fetchPostStream).thenAnswer(
            (_) => Stream.fromIterable(values),
          );
        },
        build: buildCubit,
        act: (cubit) => cubit.fetchPostStream(id: id),
        expect: () => [
          for (final data in values)
            initialState.copyWith(
              post: Post.from(data),
              fetchStatus: FetchStatus.success,
            ),
        ],
        verify: (_) {
          verify(generate).called(1);
          verify(fetchPostStream).called(1);
        },
      );

      blocTest<PostRepository, PostRepositoryState>(
        'emits [failure] and rethrows when stream throws',
        setUp: () {
          when(generate).thenReturn(cancelToken);
          when(fetchPostStream).thenAnswer(
            (_) => Stream.error(exception),
          );
        },
        build: buildCubit,
        act: (cubit) => cubit.fetchPostStream(id: id),
        expect: () => [
          initialState.copyWith(
            fetchStatus: FetchStatus.failure,
          ),
        ],
        errors: () => [exception],
        verify: (_) {
          verify(generate).called(1);
          verify(fetchPostStream).called(1);
        },
      );
    });

    group('refreshPost', () {
      const id = 'id';
      final data = PostDataPlaceholder();

      final fetchPost = () => postApi.fetchPost(
        id: id,
        cancelToken: cancelToken,
      );

      blocTest<PostRepository, PostRepositoryState>(
        'emits [loading, success] and $Post '
        'when request succeeds',
        setUp: () {
          when(generate).thenReturn(cancelToken);
          when(fetchPost).thenAnswer((_) async => data);
        },
        build: buildCubit,
        act: (cubit) => cubit.refreshPost(id: id),
        expect: () => [
          initialState.copyWith(
            refreshStatus: RefreshStatus.loading,
          ),
          initialState.copyWith(
            post: Post.from(data),
            refreshStatus: RefreshStatus.success,
            fetchStatus: FetchStatus.success,
          ),
        ],
        verify: (_) {
          verify(generate).called(1);
          verify(fetchPost).called(1);
        },
      );

      blocTest<PostRepository, PostRepositoryState>(
        'emits [loading, failure] and rethrows '
        'when request throws',
        setUp: () {
          when(generate).thenReturn(cancelToken);
          when(fetchPost).thenThrow(exception);
        },
        build: buildCubit,
        act: (cubit) => cubit.refreshPost(id: id),
        expect: () => [
          initialState.copyWith(
            refreshStatus: RefreshStatus.loading,
          ),
          initialState.copyWith(
            refreshStatus: RefreshStatus.failure,
            fetchStatus: FetchStatus.failure,
          ),
        ],
        errors: () => [exception],
        verify: (_) {
          verify(generate).called(1);
          verify(fetchPost).called(1);
        },
      );
    });

    group('comment', () {
      const form = CommentFormPlaceholder();
      final data = PostDataPlaceholder();

      const userId = 'userId';
      const user = UserPlaceholder(id: userId);

      final comment = () => postApi.comment(form.toApi());

      final fetchPost = () =>
          postApi.fetchPost(id: form.parent, cancelToken: cancelToken);

      final clear = () => commentStorage.clear(
        CommentKey(
          postId: form.parent,
          userId: userId,
        ),
      );

      blocTest<PostRepository, PostRepositoryState>(
        'emits [success], $Post and clears storage '
        'when fetchPost succeeds',
        setUp: () {
          when(comment).thenAnswer((_) async {});
          when(generate).thenReturn(cancelToken);
          when(fetchPost).thenAnswer((_) async => data);
          when(clear).thenAnswer((_) async {});
          when(() => authenticationState.user).thenReturn(user);
        },
        build: buildCubit,
        act: (cubit) => cubit.comment(form),
        expect: () => [
          initialState.copyWith(
            post: Post.from(data),
            fetchStatus: FetchStatus.success,
          ),
        ],
        verify: (_) {
          verify(comment).called(1);
          verify(generate).called(1);
          verify(fetchPost).called(1);
          verify(clear).called(1);
        },
      );

      blocTest<PostRepository, PostRepositoryState>(
        'emits [failure] and returns when fetchPost throws',
        setUp: () {
          when(comment).thenAnswer((_) async {});
          when(generate).thenReturn(cancelToken);
          when(fetchPost).thenThrow(Exception('oops'));
        },
        build: buildCubit,
        act: (cubit) => cubit.comment(form),
        expect: () => [
          initialState.copyWith(
            fetchStatus: FetchStatus.failure,
          ),
        ],
        errors: () => <Object?>[],
        verify: (_) {
          verify(comment).called(1);
          verify(generate).called(1);
          verify(fetchPost).called(1);
        },
      );

      blocTest<PostRepository, PostRepositoryState>(
        'throws when comment throws',
        setUp: () {
          when(comment).thenThrow(exception);
        },
        build: buildCubit,
        act: (cubit) => cubit.comment(form),
        expect: () => <PostRepositoryState>[],
        errors: () => [exception],
        verify: (_) {
          verify(comment).called(1);
        },
      );
    });
  });
}
