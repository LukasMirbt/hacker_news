// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/logout_loading/logout_loading.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  group(LogoutLoadingRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    LogoutLoadingRoute createSubject() => LogoutLoadingRoute();

    test('is a $GoRouteData', () {
      final route = createSubject();
      expect(route, isA<GoRouteData>());
    });

    test('is an $AppAbsoluteRoute', () {
      final route = createSubject();
      expect(route, isA<AppAbsoluteRoute>());
    });

    group('config', () {
      test('has correct type', () {
        expect(
          LogoutLoadingRoute.config,
          isA<TypedGoRoute<LogoutLoadingRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          LogoutLoadingRoute.config.path,
          '/logout-loading',
        );
      });
    });

    group('buildPage', () {
      late Page<void> page;

      Widget buildSubject() {
        final route = createSubject();
        return Builder(
          builder: (context) {
            page = route.buildPage(context, state);
            return Navigator(
              onDidRemovePage: (_) {},
              pages: [page],
            );
          },
        );
      }

      testWidgets('returns correct page', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(page, isA<NoTransitionPage<void>>());
        await tester.binding.delayed(LogoutLoadingPage.delay);
      });

      testWidgets('renders $LogoutLoadingPage', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byType(LogoutLoadingPage), findsOneWidget);
        await tester.binding.delayed(LogoutLoadingPage.delay);
      });
    });
  });
}
