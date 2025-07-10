// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/settings/settings.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  group(SettingsRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    SettingsRoute createSubject() => SettingsRoute();

    test('is a $GoRouteData', () {
      final route = createSubject();
      expect(route, isA<GoRouteData>());
    });

    group('config', () {
      test('has correct type', () {
        expect(
          SettingsRoute.config,
          isA<TypedGoRoute<SettingsRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          SettingsRoute.config.path,
          '/settings',
        );
      });

      test('has correct routes', () {
        expect(
          SettingsRoute.config.routes,
          [
            LicenseRoute.config,
          ],
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

      testWidgets('renders $SettingsPage', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byType(SettingsPage), findsOneWidget);
      });
    });
  });
}
