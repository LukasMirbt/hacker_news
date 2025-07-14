// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../helpers/pump_app.dart';

class _MockAppFeedItemData extends Mock implements AppFeedItemData {}

void main() {
  final size = Size(100, 50);

  final textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(minimumSize: size),
  );

  group(FeedItemButtonPlaceholder, () {
    late AppFeedItemData data;

    setUp(() {
      data = _MockAppFeedItemData();
    });

    Widget buildSubject() {
      return Provider.value(
        value: data,
        child: Theme(
          data: ThemeData(textButtonTheme: textButtonTheme),
          child: FeedItemButtonPlaceholder(),
        ),
      );
    }

    testWidgets('renders $InvisiblePlaceholder '
        'with visible: false', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = tester.widget<InvisiblePlaceholder>(
        find.byType(InvisiblePlaceholder),
      );
      expect(widget.visible, false);
    });

    testWidgets('renders $SizedBox with correct size', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = tester.widget<SizedBox>(
        find.byType(SizedBox),
      );
      expect(widget.width, size.width);
      expect(widget.height, size.height);
    });
  });
}
