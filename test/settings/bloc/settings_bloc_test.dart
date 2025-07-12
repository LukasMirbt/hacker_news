// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/external_links/external_links.dart';
import 'package:hacker_client/settings/settings.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';

class _MockLinkLauncher extends Mock implements LinkLauncher {}

void main() {
  group(SettingsBloc, () {
    late LinkLauncher launcher;

    setUp(() {
      launcher = _MockLinkLauncher();
    });

    SettingsBloc buildBloc() {
      return SettingsBloc(linkLauncher: launcher);
    }

    group(SettingsPrivacyPolicyPressed, () {
      final launch = () => launcher.launch(yapPrivacyPolicyLink);

      blocTest<SettingsBloc, void>(
        'launches privacyPolicyLink',
        setUp: () {
          when(launch).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            SettingsPrivacyPolicyPressed(),
          );
        },
        verify: (_) {
          verify(launch).called(1);
        },
      );
    });
  });
}
