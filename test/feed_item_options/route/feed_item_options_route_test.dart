// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/feed_item_options/feed_item_options.dart';
import 'package:mocktail/mocktail.dart';

import '../../post/pump_post.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  final item = FeedItemPlaceholder();

  group(FeedItemOptionsRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    FeedItemOptionsRoute createSubject() {
      return FeedItemOptionsRoute(item);
    }

    test('is a $GoRouteData', () {
      final route = createSubject();
      expect(route, isA<GoRouteData>());
    });

    group('parentNavigatorKey', () {
      test('returns correct navigatorKey', () {
        expect(
          FeedItemOptionsRoute.$parentNavigatorKey,
          AppRouter.navigatorKey,
        );
      });
    });

    group('config', () {
      test('has correct type', () {
        expect(
          FeedItemOptionsRoute.config,
          isA<TypedGoRoute<FeedItemOptionsRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          FeedItemOptionsRoute.config.path,
          'item/options',
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

      testWidgets('renders $FeedItemOptionsSheet '
          'with correct item', (tester) async {
        await tester.pumpPost(buildSubject());
        final widget = tester.widget<FeedItemOptionsSheet>(
          find.byType(FeedItemOptionsSheet),
        );
        expect(widget.item, item);
      });
    });
  });
}
