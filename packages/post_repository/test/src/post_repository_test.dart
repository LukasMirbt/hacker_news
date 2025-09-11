// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'package:authentication_api/authentication_api.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:draft_storage/draft_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';
import 'package:visited_post_storage/visited_post_storage.dart';

class _MockPostApi extends Mock implements PostApi {}

class _MockAuthenticationApi extends Mock implements AuthenticationApi {}

class _MockAuthenticationState extends Mock implements AuthenticationState {}

class _MockDraftStorage extends Mock implements DraftStorage {}

class _MockVisitedPostStorage extends Mock implements VisitedPostStorage {}

class _MockCancelTokenService extends Mock implements CancelTokenService {}

class _MockCancelToken extends Mock implements CancelToken {}

void main() {
  final initialState = PostRepositoryState.initial();
  final exception = Exception('oops');

  const parentId = 'parentId';
  const userId = 'userId';
  final user = UserPlaceholder(id: userId);

  final draftStorageKey = CommentDraftByUniqueKeys(
    parentId: parentId,
    userId: userId,
  );

  group(PostRepository, () {
    late PostApi postApi;
    late AuthenticationApi authenticationApi;
    late AuthenticationState authenticationState;
    late DraftStorage draftStorage;
    late VisitedPostStorage visitedPostStorage;
    late CancelTokenService cancelTokenService;
    late CancelToken cancelToken;

    setUp(() {
      postApi = _MockPostApi();
      authenticationApi = _MockAuthenticationApi();
      authenticationState = _MockAuthenticationState();
      draftStorage = _MockDraftStorage();
      visitedPostStorage = _MockVisitedPostStorage();
      cancelTokenService = _MockCancelTokenService();
      cancelToken = _MockCancelToken();
      when(() => authenticationApi.state).thenReturn(authenticationState);
      when(() => authenticationState.user).thenReturn(user);
    });

    PostRepository buildCubit() {
      return PostRepository(
        postApi: postApi,
        authenticationApi: authenticationApi,
        draftStorage: draftStorage,
        visitedPostStorage: visitedPostStorage,
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
            draftStorage: draftStorage,
            visitedPostStorage: visitedPostStorage,
          ),
          returnsNormally,
        );
      });
    });

    group('fetchPostStream', () {
      const id = 'id';

      final savedDraft = CommentDraftDataPlaceholder(
        content: 'savedComment',
      );

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

      final readCommentDraft = () => draftStorage.readCommentDraft(
        CommentDraftByUniqueKeys(
          parentId: id,
          userId: userId,
        ),
      );

      blocTest(
        'emits [success] and $Post for each stream value '
        'when stream succeeds',
        setUp: () {
          when(generate).thenReturn(cancelToken);
          when(fetchPostStream).thenAnswer(
            (_) => Stream.fromIterable(values),
          );
          when(readCommentDraft).thenAnswer(
            (_) async => savedDraft,
          );
        },
        build: buildCubit,
        act: (cubit) => cubit.fetchPostStream(id: id),
        expect: () => [
          initialState.copyWith(
            post: Post.from(
              values.first,
              savedComment: savedDraft.content,
            ),
            fetchStatus: FetchStatus.success,
          ),
          for (final data in values.skip(1))
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

      blocTest(
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

      blocTest(
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

      blocTest(
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

    group('readComment', () {
      final read = () => draftStorage.readCommentDraft(draftStorageKey);

      test('returns null when draft is null', () {
        when(read).thenAnswer((_) async => null);
        final repository = buildCubit();
        expect(
          repository.readComment(parentId: parentId),
          completion(null),
        );
        verify(read).called(1);
      });

      test('returns content when draft is non-null', () {
        final draft = CommentDraftDataPlaceholder();
        when(read).thenAnswer((_) async => draft);
        final repository = buildCubit();
        expect(
          repository.readComment(parentId: parentId),
          completion(draft.content),
        );
        verify(read).called(1);
      });
    });

    group('updateComment', () {
      final header = PostHeaderPlaceholder(id: parentId);
      const text = 'text';

      final deleteCommentDraft = () =>
          draftStorage.deleteCommentDraft(draftStorageKey);

      final saveCommentDraft = () => draftStorage.saveCommentDraft(
        CommentDraftsCompanion.insert(
          parentId: header.id,
          userId: userId,
          postTitle: header.title,
          content: text,
        ),
      );

      test('calls deleteCommentDraft when trimmed text '
          'is empty', () async {
        when(deleteCommentDraft).thenAnswer((_) async {});
        final repository = buildCubit();
        await repository.updateComment(
          header: header,
          text: ' ',
        );
        verify(deleteCommentDraft).called(1);
      });

      test('calls saveCommentDraft when trimmed text '
          'is not empty', () async {
        when(saveCommentDraft).thenAnswer((_) async {});
        final repository = buildCubit();
        await repository.updateComment(
          header: header,
          text: text,
        );
        verify(saveCommentDraft).called(1);
      });
    });

    group('comment', () {
      const form = CommentFormPlaceholder(parentId: parentId);
      final data = PostDataPlaceholder();

      const userId = 'userId';
      const user = UserPlaceholder(id: userId);

      final comment = () => postApi.comment(form.toApi());

      final fetchPost = () => postApi.fetchPost(
        id: form.parentId,
        cancelToken: cancelToken,
      );

      final deleteCommentDraft = () =>
          draftStorage.deleteCommentDraft(draftStorageKey);

      blocTest(
        'emits [success], $Post and calls deleteCommentDraft '
        'when fetchPost succeeds',
        setUp: () {
          when(comment).thenAnswer((_) async {});
          when(generate).thenReturn(cancelToken);
          when(fetchPost).thenAnswer((_) async => data);
          when(deleteCommentDraft).thenAnswer((_) async {});
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
          verify(deleteCommentDraft).called(1);
        },
      );

      blocTest(
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

      blocTest(
        'throws when postApi.comment throws',
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

    group('visitedPosts', () {
      test('returns stream', () {
        final stream = Stream<Set<String>>.empty();
        when(visitedPostStorage.watch).thenAnswer((_) => stream);
        final repository = buildCubit();
        expect(repository.visitedPosts, stream);
      });
    });

    group('readVisitedPosts', () {
      final visitedPosts = {'id'};
      final read = () => visitedPostStorage.read();

      test('returns correct value', () {
        when(read).thenReturn(visitedPosts);
        final repository = buildCubit();
        expect(
          repository.readVisitedPosts(),
          visitedPosts,
        );
        verify(read).called(1);
      });
    });

    group('addVisitedPost', () {
      const postId = 'postId';
      final add = () => visitedPostStorage.add(postId);

      test('calls storage.add', () {
        when(add).thenAnswer((_) async {});
        final repository = buildCubit();
        repository.addVisitedPost(postId);
        verify(add).called(1);
      });
    });

    group('selectComment', () {
      final comment = OtherUserCommentPlaceholder();

      blocTest(
        'emits $SelectedComment',
        build: buildCubit,
        act: (cubit) => cubit.selectComment(comment),
        expect: () => [
          isA<PostRepositoryState>().having(
            (state) => state.selectedComment,
            'selectedComment',
            isA<SelectedComment>().having(
              (selectedComment) => selectedComment.comment,
              'comment',
              comment,
            ),
          ),
        ],
      );
    });

    group('search', () {
      const query = 'query';

      blocTest(
        'emits searchQuery',
        build: buildCubit,
        act: (cubit) => cubit.search(query),
        expect: () => [
          initialState.copyWith(
            searchQuery: query,
          ),
        ],
      );
    });
  });
}
