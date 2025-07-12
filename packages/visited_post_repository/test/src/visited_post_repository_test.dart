// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visited_post_repository/visited_post_repository.dart';

import 'init_mock_hydrated_storage.dart';

void main() {
  initMockHydratedStorage();
  final initialState = VisitedPostState();

  group(VisitedPostRepository, () {
    VisitedPostRepository buildCubit() {
      return VisitedPostRepository();
    }

    test('initial state is $VisitedPostState', () {
      expect(buildCubit().state, initialState);
    });

    group('addVisitedPost', () {
      final items = {'id1'};
      final state = VisitedPostState(items: items);
      const addedId = 'id2';

      blocTest<VisitedPostRepository, VisitedPostState>(
        'emits updated items',
        seed: () => state,
        build: buildCubit,
        act: (cubit) => cubit.addVisitedPost(addedId),
        expect: () => [
          VisitedPostState(
            items: {...items, addedId},
          ),
        ],
      );
    });

    group('fromJson', () {
      test('returns $VisitedPostState', () {
        final bloc = buildCubit();
        final json = initialState.toJson();
        expect(
          bloc.fromJson(json),
          initialState,
        );
      });
    });

    group('toJson', () {
      test('returns json', () {
        final bloc = buildCubit();
        expect(
          bloc.toJson(initialState),
          initialState.toJson(),
        );
      });
    });
  });
}
