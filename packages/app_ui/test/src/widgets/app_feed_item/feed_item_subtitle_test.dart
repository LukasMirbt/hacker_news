// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../helpers/pump_app.dart';

class _MockAppFeedItemData extends Mock implements AppFeedItemData {}

void main() async {
  final l10n = await AppUiLocalizations.delegate.load(Locale('en'));

  const urlHost = 'urlHost';
  const user = 'user';
  const age = 'age';

  group(FeedItemSubtitle, () {
    late AppFeedItemData data;

    setUp(() {
      data = _MockAppFeedItemData();
      when(() => data.age).thenReturn(age);
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: FeedItemSubtitle(),
      );
    }

    testWidgets('renders urlHost, user, age and two separators '
        'when values are non-null', (tester) async {
      when(() => data.urlHost).thenReturn(urlHost);
      when(() => data.user).thenReturn(user);
      await tester.pumpApp(buildSubject());
      expect(
        find.textRange.ofSubstring(urlHost),
        findsOneWidget,
      );
      expect(
        find.textRange.ofSubstring(user),
        findsOneWidget,
      );
      expect(
        find.textRange.ofSubstring(age),
        findsOneWidget,
      );
      expect(
        find.textRange.ofSubstring(l10n.middleDot),
        findsNWidgets(2),
      );
    });

    testWidgets('renders urlHost, age and one separator '
        'when user is null', (tester) async {
      when(() => data.urlHost).thenReturn(urlHost);
      await tester.pumpApp(buildSubject());
      expect(
        find.textRange.ofSubstring(urlHost),
        findsOneWidget,
      );
      expect(
        find.textRange.ofSubstring(user),
        findsNothing,
      );
      expect(
        find.textRange.ofSubstring(age),
        findsOneWidget,
      );
      expect(
        find.textRange.ofSubstring(l10n.middleDot),
        findsOneWidget,
      );
    });

    testWidgets('renders user, age and one separator '
        'when urlHost is null', (tester) async {
      when(() => data.user).thenReturn(user);
      await tester.pumpApp(buildSubject());
      expect(
        find.textRange.ofSubstring(urlHost),
        findsNothing,
      );
      expect(
        find.textRange.ofSubstring(user),
        findsOneWidget,
      );
      expect(
        find.textRange.ofSubstring(age),
        findsOneWidget,
      );
      expect(
        find.textRange.ofSubstring(l10n.middleDot),
        findsOneWidget,
      );
    });

    testWidgets('renders age and no separators '
        'when urlHost and user are null', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.textRange.ofSubstring(urlHost),
        findsNothing,
      );
      expect(
        find.textRange.ofSubstring(user),
        findsNothing,
      );
      expect(
        find.textRange.ofSubstring(age),
        findsOneWidget,
      );
      expect(
        find.textRange.ofSubstring(l10n.middleDot),
        findsNothing,
      );
    });
  });
}
