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

class _MockTextTheme extends Mock with Diagnosticable implements TextTheme {}

void main() {
  const rank = 'rank';

  const style = TextStyle(
    color: Colors.red,
  );

  group(FeedItemRank, () {
    late AppFeedItemData data;

    setUp(() {
      data = _MockAppFeedItemData();
      registerFallbackValue(_MockColorScheme());
      registerFallbackValue(_MockTextTheme());
      when(() => data.rank).thenReturn(rank);
      when(
        () => data.rankStyle(any(), any()),
      ).thenReturn(style);
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: FeedItemRank(),
      );
    }

    testWidgets('renders rank', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.text(rank), findsOneWidget);
    });

    testWidgets('has correct style', (tester) async {
      when(() => data.hasBeenVisited).thenReturn(true);
      await tester.pumpApp(buildSubject());
      final text = tester.widget<Text>(
        find.text(rank),
      );
      expect(text.style, style);
    });
  });
}
