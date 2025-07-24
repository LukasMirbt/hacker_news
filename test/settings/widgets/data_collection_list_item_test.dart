// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/settings/settings.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAppRouter extends Mock implements AppRouter {}

void main() {
  group(DataCollectionListItem, () {
    late AppRouter router;

    setUp(() {
      router = _MockAppRouter();
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: DataCollectionListItem(),
      );
    }

    testWidgets('renders $ListTile', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('naviates to $DataCollectionRoute when $ListTile '
        'is tapped', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(ListTile));
      verify(
        () => router.go(
          DataCollectionRoute(),
        ),
      ).called(1);
    });
  });
}
