// ignore_for_file: prefer_const_constructors

import 'package:app/thread_comment_options/thread_comment_options.dart';
import 'package:app_ui/app_ui.dart';
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

void main() {
  final comment = OtherUserThreadCommentPlaceholder();

  group(ThreadCommentOptionsSheet, () {
    late ThreadCommentOptionsBloc bloc;

    setUp(() {
      bloc = _MockThreadCommentOptionsBloc();
      when(() => bloc.state).thenReturn(
        ThreadCommentOptionsState.from(comment),
      );
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
            comment: comment,
          ),
        );
        expect(
          find.byType(ThreadCommentOptionsSheet),
          findsOneWidget,
        );
      });
    });

    testWidgets('renders $AppBottomSheet', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppBottomSheet), findsOneWidget);
    });

    testWidgets('renders $ReplyOption', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyOption), findsOneWidget);
    });

    testWidgets('renders $ViewPostOption', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ViewPostOption), findsOneWidget);
    });

    testWidgets('renders $ShareOption', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ShareOption), findsOneWidget);
    });

    testWidgets('renders $OpenOnWebOption', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(OpenOnWebOption), findsOneWidget);
    });
  });
}
