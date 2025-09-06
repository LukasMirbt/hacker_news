// ignore_for_file: prefer_const_constructors

import 'package:app/app_router/app_router.dart';
import 'package:app/drafts/drafts.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAppRouter extends Mock implements AppRouter {}

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  group(DraftShellRoute, () {
    DraftShellRoute createSubject() => DraftShellRoute();

    test('is a $ShellRouteData', () {
      final route = createSubject();
      expect(route, isA<ShellRouteData>());
    });

    group('config', () {
      test('has correct type', () {
        expect(
          DraftShellRoute.config,
          isA<TypedShellRoute<DraftShellRoute>>(),
        );
      });

      test('has correct routes', () {
        expect(
          DraftShellRoute.config.routes,
          [
            DraftRoute.config,
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

      testWidgets('provides $DraftRepository', (tester) async {
        await tester.pumpApp(buildSubject());
        final context = tester.element(
          find.byWidget(navigator),
        );
        expect(
          context.read<DraftRepository>(),
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
