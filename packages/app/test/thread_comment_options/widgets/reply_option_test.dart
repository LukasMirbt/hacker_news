// ignore_for_file: prefer_const_constructors

import 'package:app/thread_comment_options/thread_comment_options.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockThreadCommentOptionsBloc
    extends MockBloc<ThreadCommentOptionsEvent, ThreadCommentOptionsState>
    implements ThreadCommentOptionsBloc {}

class _MockThreadCommentOptionsState extends Mock
    implements ThreadCommentOptionsState {}

class _MockOtherUserThreadCommentModel extends Mock
    implements OtherUserThreadCommentModel {}

void main() {
  const replyUrl = 'replyUrl';

  group(ReplyOption, () {
    late ThreadCommentOptionsBloc bloc;
    late ThreadCommentOptionsState state;
    late OtherUserThreadCommentModel comment;

    setUp(() {
      bloc = _MockThreadCommentOptionsBloc();
      state = _MockThreadCommentOptionsState();
      comment = _MockOtherUserThreadCommentModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.comment).thenReturn(comment);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ReplyOption(),
      );
    }

    testWidgets('renders $ReplyOptionBody when replyUrl '
        'is non-null', (tester) async {
      when(() => comment.replyUrl).thenReturn(replyUrl);
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyOptionBody), findsOneWidget);
    });

    testWidgets('does not render $ReplyOptionBody when replyUrl '
        'is null', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyOptionBody), findsNothing);
    });
  });
}
