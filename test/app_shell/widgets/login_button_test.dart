// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/login/login.dart' hide LoginButton;
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockGoRouter extends Mock implements GoRouter {}

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  const matchedLocation = 'matchedLocation';

  group(LoginButton, () {
    late GoRouter router;
    late GoRouterState state;

    setUp(() {
      router = _MockGoRouter();
      state = _MockGoRouterState();
      when(() => router.state).thenReturn(state);
      when(() => state.matchedLocation).thenReturn(matchedLocation);
    });

    Widget buildSubject() => LoginButton();

    testWidgets('renders $TextButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('pushes $LoginRoute when $TextButton '
        'is pressed', (tester) async {
      final route = LoginRoute(from: matchedLocation);
      final pushLoginRoute = () => router.push<void>(route.location);
      when(pushLoginRoute).thenAnswer((_) async {});
      await tester.pumpApp(
        buildSubject(),
        router: router,
      );
      await tester.tap(find.byType(TextButton));
      verify(pushLoginRoute).called(1);
    });

    testWidgets('renders correct text', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.text(l10n.appShell_login), findsOneWidget);
    });
  });
}
