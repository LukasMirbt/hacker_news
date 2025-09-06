// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/search/search.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';

class _MockLinkLauncher extends Mock implements LinkLauncher {}

void main() {
  group(SearchBloc, () {
    late LinkLauncher launcher;

    setUp(() {
      launcher = _MockLinkLauncher();
    });

    SearchBloc buildBloc() {
      return SearchBloc(linkLauncher: launcher);
    }

    group(SearchExternalLinkPressed, () {
      final url = Uri.parse('https://www.example.com');
      final launch = () => launcher.launch(url.toString());

      blocTest(
        'calls launch',
        setUp: () {
          when(launch).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            SearchExternalLinkPressed(url),
          );
        },
        verify: (_) {
          verify(launch).called(1);
        },
      );
    });
  });
}
