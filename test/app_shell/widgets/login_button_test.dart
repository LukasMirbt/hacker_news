// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/login/login.dart' hide LoginButton;
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAppRouter extends Mock implements AppRouter {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  const currentLocation = 'currentLocation';

  group(LoginButton, () {
    late AppRouter router;

    setUp(() {
      router = _MockAppRouter();
      when(() => router.currentLocation).thenReturn(currentLocation);
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: LoginButton(),
      );
    }

    testWidgets('renders $TextButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('pushes $LoginRoute when $TextButton '
        'is pressed', (tester) async {
      final pushLoginRoute = () => router.push(
        LoginRoute(from: currentLocation),
      );
      when(pushLoginRoute).thenAnswer((_) async => null);
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(TextButton));
      verify(pushLoginRoute).called(1);
    });

    testWidgets('renders correct text', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.text(l10n.appShell_login), findsOneWidget);
    });
  });
}
