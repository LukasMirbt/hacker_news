// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_comment_options/thread_comment_options.dart';
import 'package:mocktail/mocktail.dart';
import 'package:share_launcher/share_launcher.dart';
import 'package:thread_repository/thread_repository.dart';

class _MockShareLauncher extends Mock implements ShareLauncher {}

void main() {
  final comment = OtherUserThreadCommentPlaceholder();
  final initialState = ThreadCommentOptionsState.from(comment);

  group(ThreadCommentOptionsBloc, () {
    late ShareLauncher shareLauncher;

    setUp(() {
      shareLauncher = _MockShareLauncher();
    });

    ThreadCommentOptionsBloc buildBloc() {
      return ThreadCommentOptionsBloc(
        comment: comment,
        shareLauncher: shareLauncher,
      );
    }

    test('initial state is $ThreadCommentOptionsState', () {
      expect(buildBloc().state, initialState);
    });

    group(ThreadCommentOptionsSharePressed, () {
      final share = () => shareLauncher.share(
        text: initialState.comment.shareText,
      );

      blocTest<ThreadCommentOptionsBloc, ThreadCommentOptionsState>(
        'calls share',
        setUp: () {
          when(share).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ThreadCommentOptionsSharePressed(),
          );
        },
        verify: (_) {
          verify(share).called(1);
        },
      );
    });
  });
}
