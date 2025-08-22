// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/content_settings/content_settings.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';

class _MockLinkLauncher extends Mock implements LinkLauncher {}

void main() {
  const launchMode = LinkLaunchMode.inAppBrowserView;

  final initialState = ContentSettingsState(
    linkLaunchMode: launchMode,
  );

  group(ContentSettingsBloc, () {
    late LinkLauncher launcher;

    setUp(() {
      launcher = _MockLinkLauncher();
      when(() => launcher.launchMode).thenReturn(launchMode);
    });

    ContentSettingsBloc buildBloc() {
      return ContentSettingsBloc(
        linkLauncher: launcher,
      );
    }

    test('initial state is $ContentSettingsState', () {
      expect(buildBloc().state, initialState);
    });

    group(ContentSettingsLinkLaunchModeChanged, () {
      const mode = LinkLaunchMode.externalApplication;
      final setLaunchMode = () => launcher.setLaunchMode(mode);

      blocTest(
        'emits updated state and calls setLaunchMode',
        setUp: () {
          when(setLaunchMode).thenAnswer((_) async {
            return;
          });
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ContentSettingsLinkLaunchModeChanged(mode),
          );
        },
        expect: () => [
          initialState.copyWith(
            linkLaunchMode: mode,
          ),
        ],
        verify: (_) {
          verify(setLaunchMode).called(1);
        },
      );
    });
  });
}
