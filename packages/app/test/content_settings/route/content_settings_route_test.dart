// ignore_for_file: prefer_const_constructors

import 'package:app/app_router/app_router.dart';
import 'package:app/app_shell/app_shell.dart';
import 'package:app/content_settings/content_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  group(ContentSettingsRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    ContentSettingsRoute createSubject() => ContentSettingsRoute();

    test('is a $GoRouteData', () {
      final route = createSubject();
      expect(route, isA<GoRouteData>());
    });

    group('parentNavigatorKey', () {
      test('returns correct navigatorKey', () {
        expect(
          ContentSettingsRoute.$parentNavigatorKey,
          AppRouter.navigatorKey,
        );
      });
    });

    group('config', () {
      test('has correct type', () {
        expect(
          ContentSettingsRoute.config,
          isA<TypedGoRoute<ContentSettingsRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          ContentSettingsRoute.config.path,
          'content',
        );
      });

      test('has correct routes', () {
        expect(
          ContentSettingsRoute.config.routes,
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

      testWidgets('renders $ContentSettingsPage', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byType(ContentSettingsPage), findsOneWidget);
      });
    });
  });
}
