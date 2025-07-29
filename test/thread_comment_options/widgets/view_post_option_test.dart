// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_comment_options/thread_comment_options.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockThreadCommentOptionsBloc
    extends MockBloc<void, ThreadCommentOptionsState>
    implements ThreadCommentOptionsBloc {}

class _MockThreadCommentOptionsState extends Mock
    implements ThreadCommentOptionsState {}

class _MockThreadCommentModel extends Mock implements ThreadCommentModel {}

void main() {
  const postId = 'postId';

  group(ViewPostOption, () {
    late ThreadCommentOptionsBloc bloc;
    late ThreadCommentOptionsState state;
    late ThreadCommentModel comment;

    setUp(() {
      bloc = _MockThreadCommentOptionsBloc();
      state = _MockThreadCommentOptionsState();
      comment = _MockThreadCommentModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.comment).thenReturn(comment);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ViewPostOption(),
      );
    }

    testWidgets('renders $ViewPostOptionBody when postId '
        'is non-null', (tester) async {
      when(() => comment.postId).thenReturn(postId);
      await tester.pumpApp(buildSubject());
      expect(find.byType(ViewPostOptionBody), findsOneWidget);
    });

    testWidgets('does not render $ViewPostOptionBody when postId '
        'is null', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ViewPostOptionBody), findsNothing);
    });
  });
}
