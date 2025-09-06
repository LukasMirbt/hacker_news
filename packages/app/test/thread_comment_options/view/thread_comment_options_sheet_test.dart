// ignore_for_file: prefer_const_constructors

import 'package:app/thread_comment_options/thread_comment_options.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_repository/thread_repository.dart';

import '../../app/pump_app.dart';

class _MockThreadCommentOptionsBloc
    extends MockBloc<ThreadCommentOptionsEvent, ThreadCommentOptionsState>
    implements ThreadCommentOptionsBloc {}

class _MockThreadCommentOptionsState extends Mock
    implements ThreadCommentOptionsState {}

void main() {
  group(ThreadCommentOptionsSheet, () {
    late ThreadCommentOptionsBloc bloc;
    late ThreadCommentOptionsState state;

    setUp(() {
      bloc = _MockThreadCommentOptionsBloc();
      state = _MockThreadCommentOptionsState();
      when(() => bloc.state).thenReturn(state);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ThreadCommentOptionsSheet(),
      );
    }

    group('show', () {
      testWidgets('renders $ThreadCommentOptionsSheet', (tester) async {
        await tester.pumpAppWithContext(
          (context) => ThreadCommentOptionsSheet.show(
            context: context,
            comment: OtherUserThreadCommentPlaceholder(),
          ),
        );
        expect(
          find.byType(ThreadCommentOptionsSheet),
          findsOneWidget,
        );
      });
    });

    testWidgets('renders $CurrentUserThreadCommentOptionsBody '
        'when comment is $CurrentUserThreadCommentModel', (tester) async {
      when(() => state.comment).thenReturn(
        CurrentUserThreadCommentModel(
          CurrentUserThreadCommentPlaceholder(),
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(
        find.byType(CurrentUserThreadCommentOptionsBody),
        findsOneWidget,
      );
    });

    testWidgets('renders $OtherUserThreadCommentOptionsBody '
        'when comment is $OtherUserThreadCommentModel', (tester) async {
      when(() => state.comment).thenReturn(
        OtherUserThreadCommentModel(
          OtherUserThreadCommentPlaceholder(),
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(
        find.byType(OtherUserThreadCommentOptionsBody),
        findsOneWidget,
      );
    });
  });
}
