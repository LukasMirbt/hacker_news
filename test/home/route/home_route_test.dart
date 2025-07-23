// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/home/home.dart';
import 'package:hacker_client/post/post.dart';
import 'package:mocktail/mocktail.dart';

import '../../app_shell/pump_app_shell.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  group(HomeRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    HomeRoute createSubject() => HomeRoute();

    test('is a $GoRouteData', () {
      final route = createSubject();
      expect(route, isA<GoRouteData>());
    });

    group('config', () {
      test('has correct type', () {
        expect(
          HomeRoute.config,
          isA<TypedGoRoute<HomeRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          HomeRoute.config.path,
          '/home',
        );
      });

      test('has correct routes', () {
        expect(
          HomeRoute.config.routes,
          [
            PostShellRoute.config,
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

      testWidgets('renders $HomePage', (tester) async {
        await tester.pumpAppShell(buildSubject());
        expect(find.byType(HomePage), findsOneWidget);
      });
    });
  });
}
