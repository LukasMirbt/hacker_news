// ignore_for_file: prefer_const_constructors

import 'package:app/analytics/analytics.dart';
import 'package:app/app/app.dart';
import 'package:app/app_router/app_router.dart';
import 'package:app/authentication/authentication.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/theme/theme.dart';
import 'package:app/vote_failure/vote_failure.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../pump_app.dart';

class _MockThemeBloc extends MockBloc<ThemeEvent, ThemeState>
    implements ThemeBloc {}

class _MockAppRouter extends Mock implements AppRouter {}

void main() {
  const themeMode = ThemeMode.light;

  group(AppView, () {
    late ThemeBloc themeBloc;
    late AppRouter appRouter;
    late GoRouter goRouter;

    setUp(() {
      themeBloc = _MockThemeBloc();
      appRouter = _MockAppRouter();
      when(() => themeBloc.state).thenReturn(
        ThemeState(mode: themeMode),
      );
      goRouter = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (_, __) => Container(),
          ),
        ],
      );
      when(() => appRouter.goRouter).thenReturn(goRouter);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: themeBloc,
        child: Provider.value(
          value: appRouter,
          child: AppView(),
        ),
      );
    }

    group(MaterialApp, () {
      MaterialApp findWidget(WidgetTester tester) {
        return tester.widget<MaterialApp>(
          find.byType(MaterialApp).last,
        );
      }

      testWidgets('has correct restorationScopeId', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.restorationScopeId, 'app');
      });

      testWidgets('has correct themeMode', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.themeMode, themeMode);
      });

      testWidgets('has correct routerConfig', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.routerConfig, goRouter);
      });

      testWidgets('has correct localizationsDelegates', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.localizationsDelegates,
          [
            ...AppLocalizations.localizationsDelegates,
            ...AppUiLocalizations.localizationsDelegates,
            ...DateFormatterLocalizations.localizationsDelegates,
          ],
        );
      });

      testWidgets('has correct supportedLocales', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.supportedLocales,
          [
            ...AppLocalizations.supportedLocales,
            ...AppUiLocalizations.supportedLocales,
            ...DateFormatterLocalizations.supportedLocales,
          ],
        );
      });
    });

    testWidgets('renders $LoginRedirectListener', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(LoginRedirectListener), findsOneWidget);
    });

    testWidgets('renders $LoginSuccessListener', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(LoginSuccessListener), findsOneWidget);
    });

    testWidgets('renders $WebRedirectListener', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(WebRedirectListener), findsOneWidget);
    });

    testWidgets('renders $LogoutListener', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(LogoutListener), findsOneWidget);
    });

    testWidgets('renders $VoteFailureListener', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(VoteFailureListener), findsOneWidget);
    });

    testWidgets('renders $AppStatusListener', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppStatusListener), findsOneWidget);
    });

    testWidgets('renders $RouterDelegateListener', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(RouterDelegateListener), findsOneWidget);
    });
  });
}
