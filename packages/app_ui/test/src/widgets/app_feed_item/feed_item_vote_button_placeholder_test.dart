// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group(FeedItemVoteButtonPlaceholder, () {
    Widget buildSubject() => FeedItemVoteButtonPlaceholder();

    testWidgets('renders $InvisiblePlaceholder '
        'with visible: false', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = tester.widget<InvisiblePlaceholder>(
        find.byType(InvisiblePlaceholder),
      );
      expect(widget.visible, false);
    });

    testWidgets('renders $AppFeedItemVoteButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.byType(AppFeedItemVoteButton),
        findsOneWidget,
      );
    });
  });
}
