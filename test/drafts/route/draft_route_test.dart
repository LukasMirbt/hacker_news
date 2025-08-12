// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/drafts/drafts.dart';
import 'package:hacker_client/post/post.dart';
import 'package:mocktail/mocktail.dart';

import '../pump_drafts.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  group(DraftRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    DraftRoute createSubject() => DraftRoute();

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
          DraftRoute.config,
          isA<TypedGoRoute<DraftRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          DraftRoute.config.path,
          '/drafts',
        );
      });

      test('has correct routes', () {
        expect(
          DraftRoute.config.routes,
          [
            ReplyRoute.config,
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

      testWidgets('renders $DraftPage', (tester) async {
        await tester.pumpDrafts(buildSubject());
        expect(find.byType(DraftPage), findsOneWidget);
      });
    });
  });
}
