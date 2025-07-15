// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../helpers/pump_app.dart';

class _MockAppPostHeaderData extends Mock implements AppPostHeaderData {}

void main() {
  const urlHost = 'urlHost';
  const user = 'user';
  const age = 'age';

  group(PostHeaderSubtitle, () {
    late AppPostHeaderData data;

    setUp(() {
      data = _MockAppPostHeaderData();
      when(() => data.age).thenReturn(age);
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: PostHeaderSubtitle(),
      );
    }

    testWidgets('renders urlHost, user, age and two separators '
        'when values are non-null', (tester) async {
      when(() => data.urlHost).thenReturn(urlHost);
      when(() => data.user).thenReturn(user);
      await tester.pumpApp(buildSubject());
      expect(find.text(urlHost), findsOneWidget);
      expect(find.text(user), findsOneWidget);
      expect(find.text(age), findsOneWidget);
      expect(find.byType(TextSeparator), findsNWidgets(2));
    });

    testWidgets('renders urlHost, age and one separator '
        'when user is null', (tester) async {
      when(() => data.urlHost).thenReturn(urlHost);
      await tester.pumpApp(buildSubject());
      expect(find.text(urlHost), findsOneWidget);
      expect(find.text(user), findsNothing);
      expect(find.text(age), findsOneWidget);
      expect(find.byType(TextSeparator), findsOneWidget);
    });

    testWidgets('renders user, age and one separator '
        'when urlHost is null', (tester) async {
      when(() => data.user).thenReturn(user);
      await tester.pumpApp(buildSubject());
      expect(find.text(urlHost), findsNothing);
      expect(find.text(user), findsOneWidget);
      expect(find.text(age), findsOneWidget);
      expect(find.byType(TextSeparator), findsOneWidget);
    });

    testWidgets('renders age and no separators '
        'when urlHost and user are null', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.text(urlHost), findsNothing);
      expect(find.text(user), findsNothing);
      expect(find.text(age), findsOneWidget);
      expect(find.byType(TextSeparator), findsNothing);
    });
  });
}
