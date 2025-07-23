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
  group(CommentFormBody, () {
    late CommentFormBloc bloc;

    setUp(() {
      bloc = _MockCommentFormBloc();
      when(() => bloc.state).thenReturn(
        CommentFormState.initial(
          post: PostPlaceholder(),
        ),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CommentFormBody(),
      );
    }

    testWidgets('renders $SingleChildScrollView', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('renders $CommentFormHtml', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentFormHtml), findsOneWidget);
    });

    testWidgets('renders $CommentFormTextField', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentFormTextField), findsOneWidget);
    });

    testWidgets('renders $AddCommentButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AddCommentButton), findsOneWidget);
    });
  });
}
