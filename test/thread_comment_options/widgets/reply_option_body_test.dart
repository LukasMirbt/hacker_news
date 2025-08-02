// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/thread_comment_options/thread_comment_options.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:provider/provider.dart';
import 'package:thread_repository/thread_repository.dart';

import '../../app/pump_app.dart';

class _MockThreadCommentOptionsBloc
    extends MockBloc<ThreadCommentOptionsEvent, ThreadCommentOptionsState>
    implements ThreadCommentOptionsBloc {}

class _MockThreadCommentOptionsState extends Mock
    implements ThreadCommentOptionsState {}

class _MockThreadCommentModel extends Mock implements ThreadCommentModel {}

class _MockAppRouter extends Mock implements AppRouter {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  const url = 'url';

  final repositoryComment = OtherUserThreadCommentPlaceholder();

  group(ReplyOptionBody, () {
    late ThreadCommentOptionsBloc bloc;
    late ThreadCommentOptionsState state;
    late ThreadCommentModel comment;
    late AppRouter router;
    late MockNavigator navigator;

    setUp(() {
      bloc = _MockThreadCommentOptionsBloc();
      state = _MockThreadCommentOptionsState();
      comment = _MockThreadCommentModel();
      router = _MockAppRouter();
      navigator = MockNavigator();
      when(navigator.canPop).thenReturn(true);
      when(() => bloc.state).thenReturn(state);
      when(() => state.comment).thenReturn(comment);
      when(comment.toRepository).thenReturn(repositoryComment);
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: MockNavigatorProvider(
          navigator: navigator,
          child: BlocProvider.value(
            value: bloc,
            child: ReplyOptionBody(url: url),
          ),
        ),
      );
    }

    testWidgets('renders $ListTile', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('renders correct icon', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byIcon(Symbols.reply), findsOneWidget);
    });

    testWidgets('renders correct title', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.text(l10n.threadCommentOptions_reply),
        findsOneWidget,
      );
    });

    testWidgets('pops and navigates to $ReplyRoute when $ListTile '
        'is tapped', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(ListTile));
      verify(navigator.pop).called(1);
      verify(
        () => router.goRelative(
          ReplyRoute(
            url: url,
            $extra: repositoryComment.toReplyParent(),
          ),
        ),
      ).called(1);
    });
  });
}
