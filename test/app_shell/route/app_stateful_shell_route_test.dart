// ignore_for_file: prefer_const_constructors

import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/home/home.dart';
import 'package:hacker_client/settings/settings.dart';

import '../../app/pump_app.dart';

void main() {
  group(AppStatefulShellRoute, () {
    AppStatefulShellRoute createSubject() => AppStatefulShellRoute();

    test('is a $StatefulShellRouteData', () {
      final route = createSubject();
      expect(
        route,
        isA<StatefulShellRouteData>(),
      );
    });

    group('config', () {
      test('has correct type', () {
        expect(
          AppStatefulShellRoute.config,
          isA<TypedStatefulShellRoute<AppStatefulShellRoute>>(),
        );
      });

      test('has correct branches', () {
        expect(
          AppStatefulShellRoute.config.branches,
          [
            HomeBranch.config,
            SettingsBranch.config,
          ],
        );
      });
    });

    group('builder', () {
      final child = Container();

      GoRouter buildSubject() {
        final route = createSubject();
        final router = GoRouter(
          routes: [
            StatefulShellRoute.indexedStack(
              builder: route.builder,
              branches: [
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: '/',
                      builder: (_, _) => child,
                    ),
                  ],
                ),
              ],
            ),
          ],
        );

        return router;
      }

      testWidgets('provides $FeedRepository', (tester) async {
        await tester.pumpAppWithRouter(buildSubject());
        final context = tester.element(find.byWidget(child));
        expect(context.read<FeedRepository>(), isNotNull);
      });

      testWidgets('provides $StatefulNavigationShell', (tester) async {
        await tester.pumpAppWithRouter(buildSubject());
        final context = tester.element(find.byWidget(child));
        expect(context.read<StatefulNavigationShell>(), isNotNull);
      });

      testWidgets('renders $AppShell', (tester) async {
        await tester.pumpAppWithRouter(buildSubject());
        expect(find.byType(AppShell), findsOneWidget);
      });
    });
  });
}
