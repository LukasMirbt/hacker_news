// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app/app.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/theme/theme.dart';
import 'package:hacker_client/vote_failure/vote_failure.dart';
import 'package:mocktail/mocktail.dart';

import '../pump_app.dart';

class _MockThemeBloc extends MockBloc<ThemeEvent, ThemeState>
    implements ThemeBloc {}

class _MockAppRouterBloc extends MockBloc<AppRouterEvent, AppRouterState>
    implements AppRouterBloc {}

class _MockAppRouter extends Mock implements AppRouter {}

void main() {
  const themeMode = ThemeMode.light;

  group(AppView, () {
    late ThemeBloc themeBloc;
    late AppRouterBloc appRouterBloc;
    late AppRouter router;
    late GoRouter goRouter;

    setUp(() {
      themeBloc = _MockThemeBloc();
      appRouterBloc = _MockAppRouterBloc();
      router = _MockAppRouter();
      when(() => themeBloc.state).thenReturn(
        ThemeState(mode: themeMode),
      );
      when(() => appRouterBloc.state).thenReturn(
        AppRouterState(router: router),
      );
      goRouter = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (_, __) => Container(),
          ),
        ],
      );
      when(() => router.goRouter).thenReturn(goRouter);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: themeBloc,
        child: BlocProvider.value(
          value: appRouterBloc,
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

    testWidgets('renders $RouterDelegateListener', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(RouterDelegateListener), findsOneWidget);
    });
  });
}
