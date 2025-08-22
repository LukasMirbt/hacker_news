// ignore_for_file: prefer_const_constructors

import 'package:app/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockGoRouter extends Mock implements GoRouter {}

void main() {
  group(PostBackButton, () {
    late GoRouter goRouter;

    setUp(() {
      goRouter = _MockGoRouter();
    });

    Widget buildSubject() {
      return InheritedGoRouter(
        goRouter: goRouter,
        child: PostBackButton(),
      );
    }

    testWidgets('renders $BackButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(BackButton), findsOneWidget);
    });

    testWidgets('pops when $BackButton is pressed', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(BackButton));
      verify(goRouter.pop).called(1);
    });
  });
}
