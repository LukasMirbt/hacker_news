// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/data_collection/data_collection.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  group(DataCollectionRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    DataCollectionRoute createSubject() => DataCollectionRoute();

    test('is a $GoRouteData', () {
      final route = createSubject();
      expect(route, isA<GoRouteData>());
    });

    group('parentNavigatorKey', () {
      test('returns correct navigatorKey', () {
        expect(
          DataCollectionRoute.$parentNavigatorKey,
          AppRouter.navigatorKey,
        );
      });
    });

    group('config', () {
      test('has correct type', () {
        expect(
          DataCollectionRoute.config,
          isA<TypedGoRoute<DataCollectionRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          DataCollectionRoute.config.path,
          'data-collection',
        );
      });

      test('has correct routes', () {
        expect(
          DataCollectionRoute.config.routes,
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

      testWidgets('renders $DataCollectionPage', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byType(DataCollectionPage), findsOneWidget);
      });
    });
  });
}
