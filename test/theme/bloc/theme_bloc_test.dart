// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/theme/theme.dart';

import '../../app/init_mock_hydrated_storage.dart';

void main() {
  initMockHydratedStorage();
  final initialState = ThemeState();

  group(ThemeBloc, () {
    ThemeBloc buildBloc() => ThemeBloc();

    test('initial state is $ThemeState', () {
      expect(buildBloc().state, initialState);
    });

    group(ThemeOptionPressed, () {
      const mode = ThemeMode.dark;

      blocTest<ThemeBloc, ThemeState>(
        'emits mode',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ThemeOptionPressed(mode),
          );
        },
        expect: () => [
          initialState.copyWith(mode: mode),
        ],
      );
    });

    group('fromJson', () {
      test('returns $ThemeState', () {
        final bloc = buildBloc();
        final state = ThemeState();
        final json = state.toJson();
        expect(
          bloc.fromJson(json),
          state,
        );
      });
    });

    group('toJson', () {
      test('returns json', () {
        final bloc = buildBloc();
        final state = ThemeState();
        expect(
          bloc.toJson(state),
          state.toJson(),
        );
      });
    });
  });
}
