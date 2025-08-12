// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/thread_comment_options/thread_comment_options.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../app/pump_app.dart';

class _MockThreadCommentOptionsBloc
    extends MockBloc<ThreadCommentOptionsEvent, ThreadCommentOptionsState>
    implements ThreadCommentOptionsBloc {}

class _MockThreadCommentModel extends Mock implements ThreadCommentModel {}

class _MockThreadCommentOptionsState extends Mock
    implements ThreadCommentOptionsState {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(ShareOption, () {
    late ThreadCommentOptionsBloc bloc;
    late ThreadCommentOptionsState state;
    late ThreadCommentModel comment;
    late MockNavigator navigator;

    setUp(() {
      bloc = _MockThreadCommentOptionsBloc();
      state = _MockThreadCommentOptionsState();
      comment = _MockThreadCommentModel();
      navigator = MockNavigator();
      when(navigator.canPop).thenReturn(true);
      when(() => bloc.state).thenReturn(state);
      when(() => state.comment).thenReturn(comment);
    });

    Widget buildSubject() {
      return MockNavigatorProvider(
        navigator: navigator,
        child: BlocProvider.value(
          value: bloc,
          child: ShareOption(),
        ),
      );
    }

    testWidgets('renders $ListTile', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('renders correct icon', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byIcon(Symbols.share_rounded), findsOneWidget);
    });

    testWidgets('renders correct title', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.text(l10n.threadCommentOptions_share),
        findsOneWidget,
      );
    });

    testWidgets('pops and adds $ThreadCommentOptionsSharePressed '
        'when $ListTile is tapped', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(ListTile));
      verify(navigator.pop).called(1);
      verify(
        () => bloc.add(ThreadCommentOptionsSharePressed()),
      ).called(1);
    });
  });
}
