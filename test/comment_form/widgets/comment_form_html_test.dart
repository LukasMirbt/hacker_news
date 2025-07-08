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
  final initialState = CommentFormState(
    post: PostPlaceholder(),
  );

  group(CommentFormHtml, () {
    late CommentFormBloc bloc;

    setUp(() {
      bloc = _MockCommentFormBloc();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CommentFormHtml(
          padding: EdgeInsets.zero,
        ),
      );
    }

    testWidgets('renders $CommentFormHtmlBody when htmlText '
        'is non-null', (tester) async {
      when(() => bloc.state).thenReturn(
        initialState.copyWith(
          post: PostPlaceholder(
            header: PostHeaderPlaceholder(
              htmlText: 'htmlText',
            ),
          ),
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentFormHtmlBody), findsOneWidget);
    });

    testWidgets('does not render $CommentFormHtmlBody when htmlText '
        'is null', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentFormHtmlBody), findsNothing);
    });
  });
}
