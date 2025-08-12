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

class _MockTextTheme extends Mock with Diagnosticable implements TextTheme {}

void main() {
  const iconGrade = 100.0;
  final textStyle = TextStyle(color: Colors.blue);
  const iconColor = Colors.red;
  const score = 'score';

  group(AppFeedItemVoteButton, () {
    late AppFeedItemVoteButtonData data;

    setUp(() {
      data = _MockAppFeedItemVoteButtonData();
      registerFallbackValue(_MockColorScheme());
      registerFallbackValue(_MockTextTheme());
      when(() => data.onPressed).thenReturn(() {});
      when(() => data.iconGrade).thenReturn(iconGrade);
      when(() => data.iconColor(any())).thenReturn(iconColor);
      when(() => data.score).thenReturn(score);
      when(() => data.textStyle(any(), any())).thenReturn(textStyle);
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
      final icon = tester.widget<AppIcon>(
        find.byType(AppIcon),
      );
      expect(icon.color, iconColor);
    });

    testWidgets('renders score', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.text(score), findsOneWidget);
    });

    testWidgets('has correct text style', (tester) async {
      await tester.pumpApp(buildSubject());
      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style, textStyle);
    });
  });
}
