// ignore_for_file: prefer_const_constructors

import 'package:app/app_web_view/app_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockGoRouter extends Mock implements GoRouter {}

void main() {
  group(AppWebViewCloseButton, () {
    late GoRouter goRouter;

    setUp(() {
      goRouter = _MockGoRouter();
    });

    Widget buildSubject() {
      return InheritedGoRouter(
        goRouter: goRouter,
        child: AppWebViewCloseButton(),
      );
    }

    testWidgets('renders $CloseButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CloseButton), findsOneWidget);
    });

    testWidgets('pops when pressed', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(CloseButton));
      verify(goRouter.pop).called(1);
    });
  });
}
