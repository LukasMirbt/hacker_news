// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: prefer_const_constructors

import 'package:app/about/about.dart';
import 'package:app/external_links/external_links.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';

class _MockLinkLauncher extends Mock implements LinkLauncher {}

void main() {
  group(AboutBloc, () {
    late LinkLauncher launcher;

    setUp(() {
      launcher = _MockLinkLauncher();
    });

    AboutBloc buildBloc() {
      return AboutBloc(linkLauncher: launcher);
    }

    group(AboutPrivacyPolicyPressed, () {
      final launch = () => launcher.launch(axiomPrivacyPolicyLink);

      blocTest(
        'calls launch',
        setUp: () {
          when(launch).thenAnswer((_) async {
            return;
          });
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AboutPrivacyPolicyPressed(),
          );
        },
        verify: (_) {
          verify(launch).called(1);
        },
      );
    });
  });
}
