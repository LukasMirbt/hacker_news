import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group(AppFeedItem, () {
    Widget buildSubject() {
      return AppFeedItem(
        data: AppFeedItemDataPlaceholder(),
      );
    }

    testWidgets('renders $FeedItemContentRow', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(FeedItemContentRow), findsOneWidget);
    });

    testWidgets('renders $FeedItemActionRow', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(FeedItemActionRow), findsOneWidget);
    });
  });
}
