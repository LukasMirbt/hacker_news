// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/theme/theme.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';

class _MockSettingsStorage extends Mock implements SettingsStorage {}

void main() {
  const mode = ThemeMode.dark;
  final initialState = ThemeState(mode: mode);

  group(ThemeBloc, () {
    late SettingsStorage storage;

    setUp(() {
      storage = _MockSettingsStorage();
      when(storage.readThemeMode).thenReturn(mode);
    });

    ThemeBloc buildBloc() {
      return ThemeBloc(
        settingsStorage: storage,
      );
    }

    test('initial state is $ThemeState', () {
      expect(buildBloc().state, initialState);
    });

    group(ThemeOptionPressed, () {
      const mode = ThemeMode.dark;
      final writeThemeMode = () => storage.writeThemeMode(mode);

      blocTest(
        'emits updated state and writes to storage',
        setUp: () {
          when(writeThemeMode).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ThemeOptionPressed(mode),
          );
        },
        expect: () => [
          initialState.copyWith(
            mode: mode,
          ),
        ],
        verify: (_) {
          verify(writeThemeMode).called(1);
        },
      );
    });
  });
}
