// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply_options/reply_options.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:share_launcher/share_launcher.dart';

class _MockShareLauncher extends Mock implements ShareLauncher {}

void main() {
  final parent = ReplyParentPlaceholder();
  final initialState = ReplyOptionsState.from(parent: parent);

  group(ReplyOptionsBloc, () {
    late ShareLauncher shareLauncher;

    setUp(() {
      shareLauncher = _MockShareLauncher();
    });

    ReplyOptionsBloc buildBloc() {
      return ReplyOptionsBloc(
        parent: parent,
        shareLauncher: shareLauncher,
      );
    }

    test('initial state is $ReplyOptionsState', () {
      expect(
        buildBloc().state,
        ReplyOptionsState.from(parent: parent),
      );
    });

    group(ReplyOptionsSharePressed, () {
      final share = () => shareLauncher.share(
        text: initialState.parent.shareText,
      );

      blocTest<ReplyOptionsBloc, ReplyOptionsState>(
        'calls share',
        setUp: () {
          when(share).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ReplyOptionsSharePressed(),
          );
        },
        verify: (_) {
          verify(share).called(1);
        },
      );
    });
  });
}
