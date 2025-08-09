// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockCommentBloc extends MockBloc<CommentEvent, CommentState>
    implements CommentBloc {}

class _MockCommentState extends Mock implements CommentState {}

class _MockCommentPostModel extends Mock implements CommentPostHeaderModel {}

void main() {
  group(CommentHtml, () {
    late CommentBloc bloc;
    late CommentState state;
    late CommentPostHeaderModel header;

    setUp(() {
      bloc = _MockCommentBloc();
      state = _MockCommentState();
      header = _MockCommentPostModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.header).thenReturn(header);
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
      when(() => header.htmlText).thenReturn('htmlText');
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
