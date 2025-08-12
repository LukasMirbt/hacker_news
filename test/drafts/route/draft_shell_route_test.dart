// ignore_for_file: prefer_const_constructors

import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/drafts/drafts.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

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

      testWidgets('renders navigator', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byWidget(navigator), findsOneWidget);
      });
    });
  });
}
