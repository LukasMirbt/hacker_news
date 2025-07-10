// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/settings/settings.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockGoRouter extends Mock implements GoRouter {}

void main() {
  group(LicenseListItem, () {
    late GoRouter router;

    setUp(() {
      router = _MockGoRouter();
    });

    Widget buildSubject() => LicenseListItem();

    testWidgets('renders $ListTile', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('naviates to $LicenseRoute when $ListTile '
        'is tapped', (tester) async {
      await tester.pumpApp(
        buildSubject(),
        router: router,
      );
      await tester.tap(find.byType(ListTile));
      final route = LicenseRoute();
      verify(
        () => router.go(route.location),
      ).called(1);
    });
  });
}
