// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/post_search/post_search.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockPostRepository extends Mock implements PostRepository {}

class _MockPostRepositoryState extends Mock implements PostRepositoryState {}

class _MockPost extends Mock implements Post {}

class _MockSearchResultSnippet extends Mock implements SearchResultSnippet {}

void main() {
  final comments = [OtherUserCommentPlaceholder()];
  const searchQuery = 'searchQuery';

  final initialState = PostSearchState.initial(
    comments: comments,
    query: searchQuery,
  );

  group(PostSearchBloc, () {
    late PostRepository repository;
    late PostRepositoryState repositoryState;
    late Post post;

    setUp(() {
      repository = _MockPostRepository();
      repositoryState = _MockPostRepositoryState();
      post = _MockPost();
      when(() => repository.state).thenReturn(repositoryState);
      when(() => repositoryState.post).thenReturn(post);
      when(() => post.comments).thenReturn(comments);
      when(() => repositoryState.searchQuery).thenReturn(searchQuery);
    });

    PostSearchBloc buildBloc() {
      return PostSearchBloc(
        postRepository: repository,
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
          when(() => repository.stream).thenAnswer(
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
      const query = 'query';
      final search = () => repository.search(query);

      blocTest(
        'emits query and calls search',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            PostSearchQueryChanged(query),
          );
        },
        expect: () => [
          initialState.copyWith.resultList(
            query: query,
          ),
        ],
        verify: (_) {
          verify(search).called(1);
        },
      );
    });

    group(PostSearchItemPressed, () {
      final comment = OtherUserCommentPlaceholder();

      final result = SearchResultModel(
        comment: comment,
        snippet: _MockSearchResultSnippet(),
      );

      final selectComment = () => repository.selectComment(comment);

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
      final search = () => repository.search('');

      blocTest(
        'emits updated state and calls search',
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
          verify(search).called(1);
        },
      );
    });
  });
}
