// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:post_search_repository/post_search_repository.dart';

void main() {
  final initialState = PostSearchRepositoryState();

  group(PostSearchRepository, () {
    PostSearchRepository buildCubit() {
      return PostSearchRepository();
    }

    test('initial state is $PostSearchRepositoryState', () {
      expect(buildCubit().state, initialState);
    });

    group('selectComment', () {
      const id = 'id';

      blocTest(
        'emits $SelectedComment',
        build: buildCubit,
        act: (cubit) => cubit.selectComment(id: id),
        expect: () => [
          isA<PostSearchRepositoryState>().having(
            (state) => state.selectedComment,
            'selectedComment',
            isA<SelectedComment>().having(
              (selectedComment) => selectedComment.id,
              'id',
              id,
            ),
          ),
        ],
      );
    });

    group('search', () {
      const query = 'query';

      blocTest(
        'emits query',
        build: buildCubit,
        act: (cubit) => cubit.search(query),
        expect: () => [
          initialState.copyWith(
            query: query,
          ),
        ],
      );
    });
  });
}
