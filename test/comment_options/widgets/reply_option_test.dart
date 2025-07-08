// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/comment_options/comment_options.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

import '../../app/pump_app.dart';

class _MockCommentOptionsBloc extends MockBloc<void, CommentOptionsState>
    implements CommentOptionsBloc {}

class _MockCommentOptionsState extends Mock implements CommentOptionsState {}

class _MockGoRouter extends Mock implements GoRouter {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  const postId = 'postId';

  final comment = CommentModel(
    CommentPlaceholder(),
  );

  group(ReplyOption, () {
    late CommentOptionsBloc bloc;
    late CommentOptionsState state;
    late GoRouter router;

    setUp(() {
      bloc = _MockCommentOptionsBloc();
      state = _MockCommentOptionsState();
      router = _MockGoRouter();
      when(() => bloc.state).thenReturn(state);
      when(() => state.postId).thenReturn(postId);
      when(() => state.comment).thenReturn(comment);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ReplyOption(),
      );
    }

    testWidgets('renders $ListTile', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('renders $Image', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('renders correct title', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.text(l10n.commentOptions_reply),
        findsOneWidget,
      );
    });

    testWidgets('navigates to $ReplyFormRoute when $ListTile '
        'is tapped', (tester) async {
      await tester.pumpApp(buildSubject(), router: router);
      await tester.tap(find.byType(ListTile));
      verify(
        () => router.go(
          ReplyFormRoute(
            postId: postId,
            commentId: comment.id,
          ).location,
        ),
      ).called(1);
    });
  });
}
