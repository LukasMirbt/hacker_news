// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../helpers/pump_app.dart';

class _MockAppFeedItemData extends Mock implements AppFeedItemData {}

class _MockColorScheme extends Mock
    with Diagnosticable
    implements ColorScheme {}

void main() {
  const title = 'title';
  const color = Colors.red;

  group(FeedItemTitle, () {
    late AppFeedItemData data;

    setUp(() {
      data = _MockAppFeedItemData();
      registerFallbackValue(_MockColorScheme());
      when(() => data.title).thenReturn(title);
      when(() => data.titleColor(any())).thenReturn(color);
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: FeedItemTitle(),
      );
    }

    testWidgets('renders title', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.text(title), findsOneWidget);
    });

    testWidgets('has correct color', (tester) async {
      when(() => data.hasBeenVisited).thenReturn(true);
      await tester.pumpApp(buildSubject());
      final text = tester.widget<Text>(
        find.text(title),
      );
      expect(text.style?.color, color);
    });
  });
}
