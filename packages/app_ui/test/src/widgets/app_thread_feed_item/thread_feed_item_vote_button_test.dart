// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../helpers/pump_app.dart';

class _MockAppThreadFeedItemData extends Mock
    implements AppThreadFeedItemData {}

class _MockColorScheme extends Mock
    with Diagnosticable
    implements ColorScheme {}

void main() {
  const size = 24.0;
  const color = Colors.red;

  group(ThreadFeedItemVoteButton, () {
    late AppThreadFeedItemData data;

    setUp(() {
      data = _MockAppThreadFeedItemData();
      registerFallbackValue(_MockColorScheme());
      when(() => data.onVotePressed).thenReturn(() {});
      when(() => data.voteIconSize).thenReturn(size);
      when(() => data.voteIconColor(any())).thenReturn(color);
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: ThreadFeedItemVoteButton(),
      );
    }

    testWidgets('renders $IconButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('calls onVotePressed when $IconButton '
        'is pressed', (tester) async {
      var count = 0;

      void onVotePressed() {
        count += 1;
      }

      when(() => data.onVotePressed).thenReturn(onVotePressed);
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(IconButton));
      expect(count, 1);
    });

    testWidgets('has correct icon size', (tester) async {
      await tester.pumpApp(buildSubject());
      final icon = tester.widget<Icon>(find.byType(Icon));
      expect(icon.size, size);
    });

    testWidgets('has correct icon color', (tester) async {
      await tester.pumpApp(buildSubject());
      final icon = tester.widget<Icon>(find.byType(Icon));
      expect(icon.color, color);
    });
  });
}
