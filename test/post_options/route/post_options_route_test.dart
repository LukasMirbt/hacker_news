// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/post_options/post_options.dart';
import 'package:mocktail/mocktail.dart';

import '../../post/pump_post.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  group(PostOptionsRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    PostOptionsRoute createSubject() {
      return PostOptionsRoute(postId: 'postId');
    }

    test('is a $GoRouteData', () {
      final route = createSubject();
      expect(route, isA<GoRouteData>());
    });

    group('config', () {
      test('has correct type', () {
        expect(
          PostOptionsRoute.config,
          isA<TypedGoRoute<PostOptionsRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          PostOptionsRoute.config.path,
          'options',
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
          isA<ModalBottomSheetPage<void>>().having(
            (page) => page.showDragHandle,
            'showDragHandle',
            true,
          ),
        );
      });

      testWidgets('renders $PostOptionsSheet', (tester) async {
        await tester.pumpPost(buildSubject());
        expect(find.byType(PostOptionsSheet), findsOneWidget);
      });
    });
  });
}
