// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockAppFeedItemVoteButtonData extends Mock
    implements AppFeedItemVoteButtonData {}

class _MockColorScheme extends Mock
    with Diagnosticable
    implements ColorScheme {}

void main() {
  const color = Colors.red;
  const weight = 800.0;
  const score = 'score';

  group(AppFeedItemVoteButton, () {
    late AppFeedItemVoteButtonData data;

    setUp(() {
      data = _MockAppFeedItemVoteButtonData();
      registerFallbackValue(_MockColorScheme());
      when(() => data.onPressed).thenReturn(() {});
      when(() => data.color(any())).thenReturn(color);
      when(() => data.weight).thenReturn(weight);
      when(() => data.score).thenReturn(score);
    });

    Widget buildSubject() {
      return AppFeedItemVoteButton(data: data);
    }

    testWidgets('renders $TextButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('calls onPressed when $TextButton '
        'is pressed', (tester) async {
      var count = 0;

      void onPressed() {
        count += 1;
      }

      when(() => data.onPressed).thenReturn(onPressed);
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(TextButton));
      expect(count, 1);
    });

    testWidgets('has correct icon color', (tester) async {
      await tester.pumpApp(buildSubject());
      final icon = tester.widget<Icon>(find.byType(Icon));
      expect(icon.color, color);
    });

    testWidgets('renders score', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.text(score), findsOneWidget);
    });

    testWidgets('has correct text color', (tester) async {
      await tester.pumpApp(buildSubject());
      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style?.color, color);
    });

    testWidgets('has correct weight', (tester) async {
      await tester.pumpApp(buildSubject());
      final text = tester.widget<Text>(find.byType(Text));
      expect(
        text.style?.fontVariations,
        contains(
          FontVariation.weight(weight),
        ),
      );
    });
  });
}
