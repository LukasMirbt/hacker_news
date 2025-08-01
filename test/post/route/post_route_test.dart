// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/post/post.dart';
import 'package:mocktail/mocktail.dart';

import '../pump_post.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  const postId = 'postId';

  group(PostRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    PostRoute createSubject() {
      return PostRoute(postId: postId);
    }

    test('is a $GoRouteData', () {
      final route = createSubject();
      expect(route, isA<GoRouteData>());
    });

    test('is an $AppRelativeRoute', () {
      final route = createSubject();
      expect(route, isA<AppRelativeRoute>());
    });

    group('config', () {
      test('has correct type', () {
        expect(
          PostRoute.config,
          isA<TypedRelativeGoRoute<PostRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          PostRoute.config.path,
          'post/:postId',
        );
      });

      test('has correct routes', () {
        expect(
          PostRoute.config.routes,
          [
            CommentRoute.config,
            ReplyRoute.config,
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

      testWidgets('renders $PostPage with correct id', (tester) async {
        await tester.pumpPost(buildSubject());
        final widget = tester.widget<PostPage>(
          find.byType(PostPage),
        );
        expect(widget.id, postId);
      });
    });
  });
}
