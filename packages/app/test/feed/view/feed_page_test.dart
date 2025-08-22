// ignore_for_file: prefer_const_constructors

import 'package:app/feed/feed.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../app_shell/pump_app_shell.dart';

void main() {
  const type = FeedType.top;

  group(FeedPage, () {
    Widget buildSubject() => FeedPage(type: type);

    testWidgets('renders $FeedView', (tester) async {
      await tester.pumpAppShell(buildSubject());
      expect(find.byType(FeedView), findsOneWidget);
    });

    testWidgets('has $AutomaticKeepAliveClientMixin', (tester) async {
      await tester.pumpAppShell(buildSubject());
      final state = tester.state(find.byType(FeedPage));
      expect(state, isA<AutomaticKeepAliveClientMixin>());
    });
  });
}
