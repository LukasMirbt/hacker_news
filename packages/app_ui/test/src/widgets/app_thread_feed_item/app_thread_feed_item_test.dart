import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group(AppThreadFeedItem, () {
    Widget buildSubject({bool? isExpanded}) {
      return AppThreadFeedItem(
        data: AppThreadFeedItemDataPlaceholder(
          isExpanded: isExpanded ?? false,
        ),
      );
    }

    testWidgets('renders $ExpandedThreadFeedItemBody '
        'when isExpanded', (tester) async {
      await tester.pumpApp(
        buildSubject(isExpanded: true),
      );
      expect(find.byType(ExpandedThreadFeedItemBody), findsOneWidget);
    });

    testWidgets('renders $CollapsedThreadFeedItemBody '
        'when !isExpanded', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CollapsedThreadFeedItemBody), findsOneWidget);
    });
  });
}
