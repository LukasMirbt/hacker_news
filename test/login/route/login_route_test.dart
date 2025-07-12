// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/login/login.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  const from = 'from';

  group(LoginRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    LoginRoute createSubject() => LoginRoute(from: from);

    test('is a $GoRouteData', () {
      final route = createSubject();
      expect(route, isA<GoRouteData>());
    });

    group('config', () {
      test('has correct type', () {
        expect(
          LoginRoute.config,
          isA<TypedGoRoute<LoginRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          LoginRoute.config.path,
          '/login',
        );
      });

      test('has correct routes', () {
        expect(
          LoginRoute.config.routes,
          <TypedRoute<RouteData>>[],
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
        expect(
          page,
          isA<MaterialPage<void>>().having(
            (page) => page.fullscreenDialog,
            'fullscreenDialog',
            true,
          ),
        );
      });

      testWidgets('renders $LoginPage with correct from', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = tester.widget<LoginPage>(
          find.byType(LoginPage),
        );
        expect(widget.from, from);
      });
    });
  });
}
