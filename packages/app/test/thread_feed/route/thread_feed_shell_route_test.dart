// ignore_for_file: prefer_const_constructors

import 'package:app/app_shell/app_shell.dart';
import 'package:app/thread_feed/thread_feed.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_repository/thread_repository.dart';

import '../../app/pump_app.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  group(ThreadFeedShellRoute, () {
    ThreadFeedShellRoute createSubject() => ThreadFeedShellRoute();

    test('is a $ShellRouteData', () {
      final route = createSubject();
      expect(route, isA<ShellRouteData>());
    });

    group('config', () {
      test('has correct type', () {
        expect(
          ThreadFeedShellRoute.config,
          isA<TypedShellRoute<ThreadFeedShellRoute>>(),
        );
      });

      test('has correct routes', () {
        expect(
          ThreadFeedShellRoute.config.routes,
          [
            ThreadFeedRoute.config,
          ],
        );
      });
    });

    group('builder', () {
      late GoRouterState state;
      late Widget navigator;

      setUp(() {
        state = _MockGoRouterState();
        navigator = Container();
      });

      Widget buildSubject() {
        final route = createSubject();
        return Builder(
          builder: (context) => route.builder(context, state, navigator),
        );
      }

      testWidgets('provides $ThreadRepository', (tester) async {
        await tester.pumpApp(buildSubject());
        final context = tester.element(
          find.byWidget(navigator),
        );
        expect(
          context.read<ThreadRepository>(),
          isNotNull,
        );
      });

      testWidgets('renders navigator', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byWidget(navigator), findsOneWidget);
      });
    });
  });
}
