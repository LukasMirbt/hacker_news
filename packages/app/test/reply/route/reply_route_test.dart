// ignore_for_file: prefer_const_constructors

import 'package:app/app_router/app_router.dart';
import 'package:app/reply/reply.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  const url = 'url';

  group(ReplyRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    ReplyRoute createSubject() {
      return ReplyRoute(url: url);
    }

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
          ReplyRoute.config,
          isA<TypedRelativeGoRoute<ReplyRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          ReplyRoute.config.path,
          'reply',
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

      testWidgets('renders $ReplyPage with correct url', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = tester.widget<ReplyPage>(
          find.byType(ReplyPage),
        );
        expect(widget.url, url);
      });
    });
  });
}
