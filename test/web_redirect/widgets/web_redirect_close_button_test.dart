// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockGoRouter extends Mock implements GoRouter {}

void main() {
  group(WebRedirectCloseButton, () {
    late GoRouter goRouter;

    setUp(() {
      goRouter = _MockGoRouter();
    });

    Widget buildSubject() {
      return InheritedGoRouter(
        goRouter: goRouter,
        child: WebRedirectCloseButton(),
      );
    }

    testWidgets('renders $IconButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('pops when pressed', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(IconButton));
      verify(goRouter.pop).called(1);
    });
  });
}
