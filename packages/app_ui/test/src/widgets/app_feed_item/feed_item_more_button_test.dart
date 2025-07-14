// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../helpers/pump_app.dart';

class _MockAppFeedItemData extends Mock implements AppFeedItemData {}

void main() {
  group(FeedItemMoreButton, () {
    late AppFeedItemData data;

    setUp(() {
      data = _MockAppFeedItemData();
      when(() => data.onMorePressed).thenReturn(() {});
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: FeedItemMoreButton(),
      );
    }

    testWidgets('renders $IconButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('calls onMorePressed when $IconButton '
        'is pressed', (tester) async {
      var count = 0;

      void onMorePressed() {
        count += 1;
      }

      when(() => data.onMorePressed).thenReturn(onMorePressed);
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(IconButton));
      expect(count, 1);
    });
  });
}
