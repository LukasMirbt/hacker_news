// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_form/comment_form.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';

class _MockCommentFormBloc extends MockBloc<CommentFormEvent, CommentFormState>
    implements CommentFormBloc {}

void main() {
  group(CommentFormView, () {
    late CommentFormBloc bloc;

    setUp(() {
      bloc = _MockCommentFormBloc();
      when(() => bloc.state).thenReturn(
        CommentFormState(
          post: PostPlaceholder(),
        ),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CommentFormView(),
      );
    }

    testWidgets('renders $CommentFormSuccessListener', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentFormSuccessListener), findsOneWidget);
    });

    testWidgets('renders $CommentFormFailureListener', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentFormFailureListener), findsOneWidget);
    });

    testWidgets('renders $AppBar', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('renders $CommentFormBody', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentFormBody), findsOneWidget);
    });
  });
}
