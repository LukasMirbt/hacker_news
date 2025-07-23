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

void main() {
  final initialState = CommentState.initial(
    post: PostPlaceholder(),
  );

  group(CommentHtml, () {
    late CommentBloc bloc;

    setUp(() {
      bloc = _MockCommentBloc();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CommentHtml(
          padding: EdgeInsets.zero,
        ),
      );
    }

    testWidgets('renders $CommentHtmlBody when htmlText '
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
      expect(find.byType(CommentHtmlBody), findsOneWidget);
    });

    testWidgets('does not render $CommentHtmlBody when htmlText '
        'is null', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentHtmlBody), findsNothing);
    });
  });
}
