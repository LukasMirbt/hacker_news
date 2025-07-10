// ignore_for_file: prefer_const_constructors
// ignore_for_file: inference_failure_on_collection_literal

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  group(AnalyticsConsentRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    AnalyticsConsentRoute createSubject() => AnalyticsConsentRoute();

    test('is a $GoRouteData', () {
      final route = createSubject();
      expect(route, isA<GoRouteData>());
    });

    group('config', () {
      test('has correct type', () {
        expect(
          AnalyticsConsentRoute.config,
          isA<TypedGoRoute<AnalyticsConsentRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          AnalyticsConsentRoute.config.path,
          '/analytics-consent',
        );
      });

      test('has correct routes', () {
        expect(
          AnalyticsConsentRoute.config.routes,
          [],
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

      testWidgets('renders $AnalyticsConsentPage', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byType(AnalyticsConsentPage), findsOneWidget);
      });
    });
  });
}
