// ignore_for_file: prefer_const_constructors

import 'package:app/login_loading/login_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  const from = 'from';

  group(LoginLoadingRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    LoginLoadingRoute createSubject() => LoginLoadingRoute(from: from);

    test('is a $GoRouteData', () {
      final route = createSubject();
      expect(route, isA<GoRouteData>());
    });

    group('config', () {
      test('has correct type', () {
        expect(
          LoginLoadingRoute.config,
          isA<TypedGoRoute<LoginLoadingRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          LoginLoadingRoute.config.path,
          '/login-loading',
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
        await tester.binding.delayed(LoginLoadingPage.delay);
      });

      testWidgets('renders $LoginLoadingPage '
          'with correct from', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = tester.widget<LoginLoadingPage>(
          find.byType(LoginLoadingPage),
        );
        expect(widget.from, from);
        await tester.binding.delayed(LoginLoadingPage.delay);
      });
    });
  });
}
