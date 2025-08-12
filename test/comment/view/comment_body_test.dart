// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';

class _MockCommentBloc extends MockBloc<CommentEvent, CommentState>
    implements CommentBloc {}

class _MockCommentState extends Mock implements CommentState {}

class _MockCommentFormModel extends Mock implements CommentFormModel {}

void main() {
  group(CommentBody, () {
    late CommentBloc bloc;
    late CommentState state;
    late CommentFormModel form;

    setUp(() {
      bloc = _MockCommentBloc();
      state = _MockCommentState();
      form = _MockCommentFormModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.header).thenReturn(
        CommentPostHeaderModel(
          PostHeaderPlaceholder(),
        ),
      );
      when(() => state.form).thenReturn(form);
      when(() => form.text).thenReturn('');
      when(() => form.submissionStatus).thenReturn(SubmissionStatus.initial);
      when(() => form.isCommentingEnabled).thenReturn(false);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CommentBody(),
      );
    }

    testWidgets('renders $SingleChildScrollView', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('renders $CommentEnabledSection '
        'when isCommentingEnabled', (tester) async {
      when(() => form.isCommentingEnabled).thenReturn(true);
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentEnabledSection), findsOneWidget);
    });

    testWidgets('renders $CommentDisabledSection '
        'when !isCommentingEnabled', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentDisabledSection), findsOneWidget);
    });
  });
}
