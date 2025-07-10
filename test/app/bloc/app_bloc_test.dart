// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app/app.dart';

import '../init_mock_hydrated_storage.dart';

void main() {
  initMockHydratedStorage();
  final initialState = AppState();

  group(AppBloc, () {
    AppBloc buildBloc() => AppBloc();

    test('initial state is $AppState', () {
      expect(buildBloc().state, initialState);
    });

    group(AppAnalyticsConsentCompleted, () {
      blocTest<AppBloc, AppState>(
        'emits ${AppStatus.home}',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AppAnalyticsConsentCompleted(),
          );
        },
        expect: () => [
          initialState.copyWith(
            status: AppStatus.home,
          ),
        ],
      );
    });

    group('fromJson', () {
      test('returns $AppState', () {
        final bloc = buildBloc();
        final json = initialState.toJson();
        expect(
          bloc.fromJson(json),
          initialState,
        );
      });
    });

    group('toJson', () {
      test('returns json', () {
        final bloc = buildBloc();
        expect(
          bloc.toJson(initialState),
          initialState.toJson(),
        );
      });
    });
  });
}
