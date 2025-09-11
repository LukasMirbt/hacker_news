// ignore_for_file: prefer_const_constructors

import 'package:app/post_search/post_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../../post/pump_post.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  group(PostSearchRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    PostSearchRoute createSubject() => PostSearchRoute();

    test('is a $RelativeGoRouteData', () {
      final route = createSubject();
      expect(route, isA<RelativeGoRouteData>());
    });

    group('config', () {
      test('has correct type', () {
        expect(
          PostSearchRoute.config,
          isA<TypedRelativeGoRoute<PostSearchRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          PostSearchRoute.config.path,
          'search',
        );
      });

      test('has correct routes', () {
        expect(
          PostSearchRoute.config.routes,
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

      testWidgets('renders $PostSearchPage', (tester) async {
        await tester.pumpPost(buildSubject());
        expect(find.byType(PostSearchPage), findsOneWidget);
      });
    });
  });
}
