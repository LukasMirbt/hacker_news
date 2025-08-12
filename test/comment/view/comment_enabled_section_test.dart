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
  group(CommentEnabledSection, () {
    late CommentBloc bloc;

    setUp(() {
      bloc = _MockCommentBloc();
      when(() => bloc.state).thenReturn(
        CommentState(
          fetchStatus: FetchStatus.loading,
          header: CommentPostHeaderModel(
            PostHeaderPlaceholder(),
          ),
          form: CommentFormModel(
            form: CommentFormPlaceholder(),
          ),
        ),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CommentEnabledSection(),
      );
    }

    testWidgets('renders $CommentTitle', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentTitle), findsOneWidget);
    });

    testWidgets('renders $CommentHtml', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentHtml), findsOneWidget);
    });

    testWidgets('renders $CommentTextField', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentTextField), findsOneWidget);
    });
  });
}
