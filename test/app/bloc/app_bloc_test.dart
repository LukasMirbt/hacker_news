// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app/app.dart';
import 'package:mocktail/mocktail.dart';
import 'package:settings_storage/settings_storage.dart';

class _MockSettingsStorage extends Mock implements SettingsStorage {}

void main() {
  const isAnalyticsConsentCompleted = false;

  final initialState = AppState(
    isAnalyticsConsentCompleted: isAnalyticsConsentCompleted,
  );

  group(AppBloc, () {
    late SettingsStorage storage;

    setUp(() {
      storage = _MockSettingsStorage();
      when(storage.readIsAnalyticsConsentCompleted).thenReturn(
        isAnalyticsConsentCompleted,
      );
    });

    AppBloc buildBloc() {
      return AppBloc(
        settingsStorage: storage,
      );
    }

    test('initial state is $AppState', () {
      expect(buildBloc().state, initialState);
    });

    group(AppAnalyticsConsentCompleted, () {
      const completed = true;

      final write = () =>
          storage.writeIsAnalyticsConsentCompleted(completed: completed);

      blocTest<AppBloc, AppState>(
        'emits updated state and writes to storage',
        setUp: () {
          when(write).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AppAnalyticsConsentCompleted(),
          );
        },
        expect: () => [
          initialState.copyWith(
            isAnalyticsConsentCompleted: true,
          ),
        ],
        verify: (_) {
          verify(write).called(1);
        },
      );
    });
  });
}
