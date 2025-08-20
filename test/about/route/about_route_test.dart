// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/about/about.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  group(AboutRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    AboutRoute createSubject() => AboutRoute();

    test('is a $GoRouteData', () {
      final route = createSubject();
      expect(route, isA<GoRouteData>());
    });

    group('parentNavigatorKey', () {
      test('returns correct navigatorKey', () {
        expect(
          AboutRoute.$parentNavigatorKey,
          AppRouter.navigatorKey,
        );
      });
    });

    group('config', () {
      test('has correct type', () {
        expect(
          AboutRoute.config,
          isA<TypedGoRoute<AboutRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          AboutRoute.config.path,
          'about',
        );
      });

      test('has correct routes', () {
        expect(
          AboutRoute.config.routes,
          <TypedRoute<RouteData>>[],
        );
      });
    });

    group('build', () {
      Widget buildSubject() {
        final route = createSubject();
        return Builder(
          builder: (context) => route.build(context, state),
        );
      }

      testWidgets('renders $AboutPage', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byType(AboutPage), findsOneWidget);
      });
    });
  });
}
