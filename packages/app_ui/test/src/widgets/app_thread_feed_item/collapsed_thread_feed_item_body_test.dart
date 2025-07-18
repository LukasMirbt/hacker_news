// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../../helpers/helpers.dart';

void main() {
  group(CollapsedThreadFeedItemBody, () {
    Widget buildSubject() {
      return Provider<AppThreadFeedItemData>.value(
        value: AppThreadFeedItemDataPlaceholder(),
        child: ExpandedThreadFeedItemBody(),
      );
    }

    testWidgets('renders $ThreadFeedItemHeaderRow', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ThreadFeedItemHeaderRow), findsOneWidget);
    });
  });
}
