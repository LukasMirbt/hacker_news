// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/reply_form/reply_form.dart';
import 'package:mocktail/mocktail.dart';

import '../../post/pump_post.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  const commentId = 'commentId';

  group(ReplyFormRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    ReplyFormRoute createSubject() {
      return ReplyFormRoute(
        postId: 'postId',
        commentId: commentId,
      );
    }

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
          ReplyFormRoute.config,
          isA<TypedGoRoute<ReplyFormRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          ReplyFormRoute.config.path,
          'reply/:commentId',
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
        await tester.pumpPost(buildSubject());
        expect(
          page,
          isA<MaterialPage<void>>().having(
            (page) => page.fullscreenDialog,
            'fullscreenDialog',
            true,
          ),
        );
      });

      testWidgets('renders $ReplyFormPage '
          'with correct commentId', (tester) async {
        await tester.pumpPost(buildSubject());
        final widget = tester.widget<ReplyFormPage>(
          find.byType(ReplyFormPage),
        );
        expect(widget.commentId, commentId);
      });
    });
  });
}
