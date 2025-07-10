// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  group(LicenseRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    LicenseRoute createSubject() => LicenseRoute();

    test('is a $GoRouteData', () {
      final route = createSubject();
      expect(route, isA<GoRouteData>());
    });

    group('parentNavigatorKey', () {
      test('returns correct navigatorKey', () {
        expect(
          LicenseRoute.$parentNavigatorKey,
          AppRouter.navigatorKey,
        );
      });
    });

    group('config', () {
      test('has correct type', () {
        expect(
          LicenseRoute.config,
          isA<TypedGoRoute<LicenseRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          LicenseRoute.config.path,
          'licenses',
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

      testWidgets('renders $LicensePage', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byType(LicensePage), findsOneWidget);
      });
    });
  });
}
