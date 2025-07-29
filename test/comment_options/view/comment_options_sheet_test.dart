// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_options/comment_options.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';

class _MockCommentOptionsBloc
    extends MockBloc<CommentOptionsEvent, CommentOptionsState>
    implements CommentOptionsBloc {}

void main() {
  final comment = OtherUserCommentPlaceholder();

  group(CommentOptionsSheet, () {
    late CommentOptionsBloc bloc;

    setUp(() {
      bloc = _MockCommentOptionsBloc();
      when(() => bloc.state).thenReturn(
        CommentOptionsState.from(comment: comment),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CommentOptionsSheet(),
      );
    }

    group('show', () {
      testWidgets('renders $CommentOptionsSheet', (tester) async {
        await tester.pumpAppWithContext(
          (context) => CommentOptionsSheet.show(
            context: context,
            comment: comment,
          ),
        );
        expect(
          find.byType(CommentOptionsSheet),
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
