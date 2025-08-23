// ignore_for_file: prefer_const_constructors

import 'package:app/comment_options/comment_options.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../app/pump_app.dart';

class _MockCommentOptionsBloc
    extends MockBloc<CommentOptionsEvent, CommentOptionsState>
    implements CommentOptionsBloc {}

class _MockCommentModel extends Mock implements CommentModel {}

class _MockCommentOptionsState extends Mock implements CommentOptionsState {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(ShareOption, () {
    late CommentOptionsBloc bloc;
    late CommentOptionsState state;
    late CommentModel comment;
    late MockNavigator navigator;

    setUp(() {
      bloc = _MockCommentOptionsBloc();
      state = _MockCommentOptionsState();
      comment = _MockCommentModel();
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
        find.text(l10n.commentOptions_share),
        findsOneWidget,
      );
    });

    testWidgets('pops and adds $CommentOptionsSharePressed '
        'when $ListTile is tapped', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(ListTile));
      verify(navigator.pop).called(1);
      verify(
        () => bloc.add(CommentOptionsSharePressed()),
      ).called(1);
    });
  });
}
