// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_options/bloc/bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';
import 'package:share_launcher/share_launcher.dart';

class _MockShareLauncher extends Mock implements ShareLauncher {}

void main() {
  final comment = OtherUserCommentPlaceholder();
  final initialState = CommentOptionsState.from(comment: comment);

  group(CommentOptionsBloc, () {
    late ShareLauncher shareLauncher;

    setUp(() {
      shareLauncher = _MockShareLauncher();
    });

    CommentOptionsBloc buildBloc() {
      return CommentOptionsBloc(
        comment: comment,
        shareLauncher: shareLauncher,
      );
    }

    test('initial state is $CommentOptionsState', () {
      expect(
        buildBloc().state,
        CommentOptionsState.from(comment: comment),
      );
    });

    group(CommentOptionsSharePressed, () {
      final share = () => shareLauncher.share(
        text: initialState.comment.shareText,
      );

      blocTest<CommentOptionsBloc, CommentOptionsState>(
        'calls share',
        setUp: () {
          when(share).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentOptionsSharePressed(),
          );
        },
        verify: (_) {
          verify(share).called(1);
        },
      );
    });
  });
}
