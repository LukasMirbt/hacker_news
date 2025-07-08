// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:mocktail/mocktail.dart';

class _MockAppRouter extends Mock implements AppRouter {}

void main() {
  final initialState = AppRouterState.initial();

  group(AppRouterBloc, () {
    AppRouterBloc buildBloc() => AppRouterBloc();

    test('initial state is $AppRouterState', () {
      expect(
        buildBloc().state,
        isA<AppRouterState>(),
      );
    });

    group(AppRouterLocationChanged, () {
      const previousLocation = 'previousLocation';
      const matchedLocation = 'matchedLocation';

      final state = initialState.copyWith(
        router: _MockAppRouter(),
        history: [previousLocation],
      );

      blocTest<AppRouterBloc, AppRouterState>(
        'emits updated history',
        seed: () => state,
        build: buildBloc,
        act: (bloc) async {
          bloc.add(
            AppRouterLocationChanged(matchedLocation),
          );
        },
        expect: () => [
          state.copyWith(
            history: [
              ...state.history,
              matchedLocation,
            ],
          ),
        ],
      );
    });
  });
}
