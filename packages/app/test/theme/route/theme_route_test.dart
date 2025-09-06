// ignore_for_file: prefer_const_constructors

import 'package:app/app_router/app_router.dart';
import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  group(ThemeRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    ThemeRoute createSubject() => ThemeRoute();

    test('is a $GoRouteData', () {
      final route = createSubject();
      expect(route, isA<GoRouteData>());
    });

    group('parentNavigatorKey', () {
      test('returns correct navigatorKey', () {
        expect(
          ThemeRoute.$parentNavigatorKey,
          AppRouter.navigatorKey,
        );
      });
    });

    group('config', () {
      test('has correct type', () {
        expect(
          ThemeRoute.config,
          isA<TypedGoRoute<ThemeRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          ThemeRoute.config.path,
          'theme',
        );
      });

      test('has correct routes', () {
        expect(
          ThemeRoute.config.routes,
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

      testWidgets('renders $ThemePage', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byType(ThemePage), findsOneWidget);
      });
    });
  });
}
