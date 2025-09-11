// ignore_for_file: prefer_const_constructors

import 'package:app/comment/comment.dart';
import 'package:app/post/post.dart';
import 'package:app/post_search/post_search.dart';
import 'package:app/reply/reply.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
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

    test('is a $RelativeGoRouteData', () {
      final route = createSubject();
      expect(route, isA<RelativeGoRouteData>());
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
            PostSearchRoute.config,
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
