// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockGoRouter extends Mock implements GoRouter {}

class _MockStatefulNavigationShell extends Mock
    with Diagnosticable
    implements StatefulNavigationShell {}

void main() {
  final child = Container();

  group(ShellBackButtonListener, () {
    late GoRouter router;
    late StatefulNavigationShell navigationShell;

    setUp(() {
      router = _MockGoRouter();
      navigationShell = _MockStatefulNavigationShell();
    });

    GoRouter buildSubject() {
      return GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (_, __) => InheritedGoRouter(
              goRouter: router,
              child: Provider.value(
                value: navigationShell,
                child: ShellBackButtonListener(child: child),
              ),
            ),
          ),
        ],
      );
    }

    BackButtonListener findWidget(WidgetTester tester) {
      return tester.widget<BackButtonListener>(
        find.byType(BackButtonListener),
      );
    }

    group('onBackButtonPressed', () {
      final canPop = () => router.canPop();

      testWidgets('returns false when canPop', (tester) async {
        when(canPop).thenReturn(true);
        await tester.pumpAppWithRouter(buildSubject());
        final widget = findWidget(tester);
        final result = await widget.onBackButtonPressed();
        expect(result, false);
      });

      testWidgets('goes to branch with index 0 and returns true when !canPop '
          'and currentIndex != 0', (tester) async {
        when(canPop).thenReturn(false);
        when(() => navigationShell.currentIndex).thenReturn(1);
        await tester.pumpAppWithRouter(buildSubject());
        final widget = findWidget(tester);
        final result = await widget.onBackButtonPressed();
        expect(result, true);
        verify(() => navigationShell.goBranch(0)).called(1);
      });

      testWidgets('returns false when !canPop and currentIndex == 0', (
        tester,
      ) async {
        when(canPop).thenReturn(false);
        when(() => navigationShell.currentIndex).thenReturn(0);
        await tester.pumpAppWithRouter(buildSubject());
        final widget = findWidget(tester);
        final result = await widget.onBackButtonPressed();
        expect(result, false);
        verifyNever(() => navigationShell.goBranch(any()));
      });
    });

    testWidgets('renders child', (tester) async {
      await tester.pumpAppWithRouter(buildSubject());
      expect(find.byWidget(child), findsOneWidget);
    });
  });
}
