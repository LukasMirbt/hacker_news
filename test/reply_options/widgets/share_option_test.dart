// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/reply_options/reply_options.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../app/pump_app.dart';

class _MockReplyOptionsBloc
    extends MockBloc<ReplyOptionsEvent, ReplyOptionsState>
    implements ReplyOptionsBloc {}

class _MockReplyParentModel extends Mock implements ReplyParentModel {}

class _MockReplyOptionsState extends Mock implements ReplyOptionsState {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(ShareOption, () {
    late ReplyOptionsBloc bloc;
    late ReplyOptionsState state;
    late ReplyParentModel parent;
    late MockNavigator navigator;

    setUp(() {
      bloc = _MockReplyOptionsBloc();
      state = _MockReplyOptionsState();
      parent = _MockReplyParentModel();
      navigator = MockNavigator();
      when(navigator.canPop).thenReturn(true);
      when(() => bloc.state).thenReturn(state);
      when(() => state.parent).thenReturn(parent);
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
      expect(
        find.byIcon(Symbols.share_rounded),
        findsOneWidget,
      );
    });

    testWidgets('renders correct title', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.text(l10n.replyOptions_share),
        findsOneWidget,
      );
    });

    testWidgets('pops and adds $ReplyOptionsSharePressed '
        'when $ListTile is tapped', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(ListTile));
      verify(navigator.pop).called(1);
      verify(
        () => bloc.add(ReplyOptionsSharePressed()),
      ).called(1);
    });
  });
}
