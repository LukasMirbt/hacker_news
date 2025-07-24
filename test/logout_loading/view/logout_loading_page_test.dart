// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/logout_loading/logout_loading.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockGoRouter extends Mock implements GoRouter {}

void main() {
  group(LogoutLoadingPage, () {
    late GoRouter goRouter;

    setUp(() {
      goRouter = _MockGoRouter();
    });

    Widget buildSubject() {
      return InheritedGoRouter(
        goRouter: goRouter,
        child: LogoutLoadingPage(),
      );
    }

    testWidgets('renders $PopScope with !canPop', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = tester.widget<PopScope>(
        find.byType(PopScope),
      );
      expect(widget.canPop, false);
      await tester.binding.delayed(LogoutLoadingPage.delay);
    });

    testWidgets('renders $CircularProgressIndicator', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.binding.delayed(LogoutLoadingPage.delay);
    });

    testWidgets('navigates after delay', (tester) async {
      final navigate = () => goRouter.go(AppRouter.initialLocation);
      await tester.pumpApp(buildSubject());
      verifyNever(navigate);
      await tester.binding.delayed(LogoutLoadingPage.delay);
      verify(navigate).called(1);
    });
  });
}
