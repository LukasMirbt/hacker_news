// ignore_for_file: prefer_const_constructors

import 'package:app/create_account/create_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  const from = 'from';

  group(CreateAccountRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    CreateAccountRoute createSubject() => CreateAccountRoute(from: from);

    test('is a $GoRouteData', () {
      final route = createSubject();
      expect(route, isA<GoRouteData>());
    });

    group('config', () {
      test('has correct type', () {
        expect(
          CreateAccountRoute.config,
          isA<TypedGoRoute<CreateAccountRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          CreateAccountRoute.config.path,
          'create-account',
        );
      });

      test('has correct routes', () {
        expect(
          CreateAccountRoute.config.routes,
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

      testWidgets('renders $CreateAccountPage '
          'with correct from', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = tester.widget<CreateAccountPage>(
          find.byType(CreateAccountPage),
        );
        expect(widget.from, from);
      });
    });
  });
}
