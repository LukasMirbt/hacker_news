// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/post_search/post_search.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';
import 'package:post_search_repository/post_search_repository.dart';

class _MockPostRepository extends Mock implements PostRepository {}

class _MockPostRepositoryState extends Mock implements PostRepositoryState {}

class _MockPostSearchRepository extends Mock implements PostSearchRepository {}

class _MockPost extends Mock implements Post {}

class _MockSearchResultSnippet extends Mock implements SearchResultSnippet {}

void main() {
  final comments = [OtherUserCommentPlaceholder()];
  const query = 'searchQuery';

  final initialState = PostSearchState.initial(
    comments: comments,
    query: query,
  );

  group(PostSearchBloc, () {
    late PostRepository postRepository;
    late PostSearchRepository postSearchRepository;
    late PostRepositoryState postRepositoryState;
    late Post post;

    setUp(() {
      postRepository = _MockPostRepository();
      postSearchRepository = _MockPostSearchRepository();
      postRepositoryState = _MockPostRepositoryState();
      post = _MockPost();
      when(() => postRepository.state).thenReturn(postRepositoryState);
      when(() => postRepositoryState.post).thenReturn(post);
      when(() => post.comments).thenReturn(comments);
      when(() => postSearchRepository.query).thenReturn(query);
    });

    PostSearchBloc buildBloc() {
      return PostSearchBloc(
        postRepository: postRepository,
        postSearchRepository: postSearchRepository,
      );
    }

    test('initial state is $PostSearchState', () {
      expect(buildBloc().state, initialState);
    });

    group(PostSearchCommentListSubscriptionRequested, () {
      final updatedRepositoryState = _MockPostRepositoryState();

      final updatedPost = _MockPost();

      final updatedComments = [
        OtherUserCommentPlaceholder(),
        OtherUserCommentPlaceholder(),
      ];

      blocTest(
        'emits comments when stream emits new value',
        setUp: () {
          when(() => postRepository.stream).thenAnswer(
            (_) => Stream.value(updatedRepositoryState),
          );
          when(() => updatedRepositoryState.post).thenReturn(updatedPost);
          when(() => updatedPost.comments).thenReturn(updatedComments);
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            PostSearchCommentListSubscriptionRequested(),
          );
        },
        expect: () => [
          initialState.copyWith.resultList(
            comments: updatedComments,
          ),
        ],
      );
    });

    group(PostSearchQueryChanged, () {
      const updatedQuery = 'updatedQuery';

      final update = () => postSearchRepository.update(
        query: updatedQuery,
      );

      blocTest(
        'emits query and calls search',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            PostSearchQueryChanged(updatedQuery),
          );
        },
        expect: () => [
          initialState.copyWith.resultList(
            query: updatedQuery,
          ),
        ],
        verify: (_) {
          verify(update).called(1);
        },
      );
    });

    group(PostSearchItemPressed, () {
      final comment = OtherUserCommentPlaceholder();

      final result = SearchResultModel(
        comment: comment,
        snippet: _MockSearchResultSnippet(),
      );

      final selectComment = () => postSearchRepository.select(
        id: comment.id,
      );

      blocTest(
        'calls selectComment',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            PostSearchItemPressed(result),
          );
        },
        verify: (_) {
          verify(selectComment).called(1);
        },
      );
    });

    group(PostSearchCleared, () {
      final clear = () => postSearchRepository.clear();

      blocTest(
        'emits updated state and calls clear',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            PostSearchCleared(),
          );
        },
        expect: () => [
          initialState.copyWith.resultList(
            query: '',
          ),
        ],
        verify: (_) {
          verify(clear).called(1);
        },
      );
    });
  });
}
