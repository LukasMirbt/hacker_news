import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:thread_repository/thread_repository.dart';

import '../../app/pump_app.dart';

void main() {
  group(ThreadFeedFooter, () {
    Widget buildSubject() {
      return ThreadFeedFooter(
        ThreadFeedItemModel(
          item: ThreadFeedItemPlaceholder(),
        ),
      );
    }

    testWidgets('renders $ThreadFeedTopLevelDivider', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ThreadFeedTopLevelDivider), findsOneWidget);
    });
  });
}
