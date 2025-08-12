// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/comment_options/comment_options.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAppRouter extends Mock implements AppRouter {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  const url = 'url';

  group(ReplyOptionBody, () {
    late AppRouter router;
    late MockNavigator navigator;

    setUp(() {
      router = _MockAppRouter();
      navigator = MockNavigator();
      when(navigator.canPop).thenReturn(true);
    });

    Widget buildSubject() {
      return MockNavigatorProvider(
        navigator: navigator,
        child: Provider.value(
          value: router,
          child: ReplyOptionBody(url: url),
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
        find.byIcon(Symbols.reply_rounded),
        findsOneWidget,
      );
    });

    testWidgets('renders correct title', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.text(l10n.commentOptions_reply),
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
          ReplyRoute(url: url),
        ),
      ).called(1);
    });
  });
}
