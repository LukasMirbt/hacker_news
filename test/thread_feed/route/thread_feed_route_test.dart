// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  group(ThreadFeedRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    ThreadFeedRoute createSubject() => ThreadFeedRoute();

    test('is a $GoRouteData', () {
      final route = createSubject();
      expect(route, isA<GoRouteData>());
    });

    test('is an $AuthenticatedRoute', () {
      final route = createSubject();
      expect(route, isA<AuthenticatedRoute>());
    });

    group('config', () {
      test('has correct type', () {
        expect(
          ThreadFeedRoute.config,
          isA<TypedGoRoute<ThreadFeedRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          ThreadFeedRoute.config.path,
          '/threads',
        );
      });

      test('has correct routes', () {
        expect(
          ThreadFeedRoute.config.routes,
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

      testWidgets('renders $ThreadFeedPage', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byType(ThreadFeedPage), findsOneWidget);
      });
    });
  });
}
