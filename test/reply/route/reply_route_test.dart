// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/reply/reply.dart';
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

    group('buildPage', () {
      late Page<void> page;

      Widget buildSubject() {
        final route = createSubject();
        return Builder(
          builder: (context) {
            page = route.buildPage(context, state);
            return Navigator(
              onDidRemovePage: (_) {},
              pages: [page],
            );
          },
        );
      }

      testWidgets('returns correct page', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(
          page,
          isA<MaterialPage<void>>().having(
            (page) => page.fullscreenDialog,
            'fullscreenDialog',
            true,
          ),
        );
      });

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
