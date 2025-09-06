// ignore_for_file: prefer_const_constructors

import 'package:app/app_router/app_router.dart';
import 'package:app/post/post.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

class _MockAppRouter extends Mock implements AppRouter {}

void main() {
  group(PostShellRoute, () {
    PostShellRoute createSubject() => PostShellRoute();

    test('is a $ShellRouteData', () {
      final route = createSubject();
      expect(route, isA<ShellRouteData>());
    });

    group('parentNavigatorKey', () {
      test('returns correct navigatorKey', () {
        expect(
          PostShellRoute.$parentNavigatorKey,
          AppRouter.navigatorKey,
        );
      });
    });

    group('config', () {
      test('has correct type', () {
        expect(
          PostShellRoute.config,
          isA<TypedShellRoute<PostShellRoute>>(),
        );
      });

      test('has correct routes', () {
        expect(
          PostShellRoute.config.routes,
          [
            PostRoute.config,
          ],
        );
      });
    });

    group('builder', () {
      late GoRouterState state;
      late Widget navigator;
      late AppRouter router;

      setUp(() {
        state = _MockGoRouterState();
        navigator = Container();
        router = _MockAppRouter();
        when(() => router.shellRouteCanPop).thenReturn(true);
      });

      Widget buildSubject() {
        final route = createSubject();
        return Provider.value(
          value: router,
          child: Builder(
            builder: (context) => route.builder(context, state, navigator),
          ),
        );
      }

      testWidgets('provides $PostRepository', (tester) async {
        await tester.pumpApp(buildSubject());
        final context = tester.element(
          find.byWidget(navigator),
        );
        expect(
          context.read<PostRepository>(),
          isNotNull,
        );
      });

      testWidgets('renders $ShellRouteWrapper', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byType(ShellRouteWrapper), findsOneWidget);
      });

      testWidgets('renders navigator', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byWidget(navigator), findsOneWidget);
      });
    });
  });
}
