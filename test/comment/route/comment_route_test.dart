// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:mocktail/mocktail.dart';

import '../../post/pump_post.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  group(CommentRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    CommentRoute createSubject() => CommentRoute();

    test('is a $RelativeGoRouteData', () {
      final route = createSubject();
      expect(route, isA<RelativeGoRouteData>());
    });

    test('is an $AuthenticatedRoute', () {
      final route = createSubject();
      expect(route, isA<AuthenticatedRoute>());
    });

    group('config', () {
      test('has correct type', () {
        expect(
          CommentRoute.config,
          isA<TypedRelativeGoRoute<CommentRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          CommentRoute.config.path,
          'comment',
        );
      });

      test('has correct routes', () {
        expect(
          CommentRoute.config.routes,
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

      testWidgets('renders $CommentPage', (tester) async {
        await tester.pumpPost(buildSubject());
        expect(find.byType(CommentPage), findsOneWidget);
      });
    });
  });
}
