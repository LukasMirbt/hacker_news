// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';

class _MockCommentBloc extends MockBloc<CommentEvent, CommentState>
    implements CommentBloc {}

class _MockCommentState extends Mock implements CommentState {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(CommentDisabledSection, () {
    late CommentBloc bloc;
    late CommentState state;

    setUp(() {
      bloc = _MockCommentBloc();
      state = _MockCommentState();
      when(() => bloc.state).thenReturn(state);
      when(() => state.header).thenReturn(
        CommentPostHeaderModel(
          PostHeaderPlaceholder(),
        ),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CommentDisabledSection(),
      );
    }

    testWidgets('renders $CommentTitle', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentTitle), findsOneWidget);
    });

    testWidgets('renders correct text', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.text(l10n.comment_disabledExplanationTitle),
        findsOneWidget,
      );
      expect(
        find.text(l10n.comment_disabledExplanationSubtitle),
        findsOneWidget,
      );
    });
  });
}
