// ignore_for_file: prefer_const_constructors

import 'package:app/comment_options/comment_options.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockCommentOptionsBloc
    extends MockBloc<CommentOptionsEvent, CommentOptionsState>
    implements CommentOptionsBloc {}

class _MockCommentOptionsState extends Mock implements CommentOptionsState {}

class _MockCommentModel extends Mock implements CommentModel {}

void main() {
  const replyUrl = 'replyUrl';

  group(ReplyOption, () {
    late CommentOptionsBloc bloc;
    late CommentOptionsState state;
    late CommentModel comment;

    setUp(() {
      bloc = _MockCommentOptionsBloc();
      state = _MockCommentOptionsState();
      comment = _MockCommentModel();
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
