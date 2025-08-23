// ignore_for_file: prefer_const_constructors

import 'package:app/feed/feed.dart';
import 'package:app/home/home.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../app_shell/pump_app_shell.dart';

void main() {
  group(HomeTabBarView, () {
    Widget buildSubject() {
      return DefaultTabController(
        length: FeedType.values.length,
        child: HomeTabBarView(),
      );
    }

    testWidgets('renders $FeedPage for each $FeedType', (tester) async {
      await tester.pumpAppShell(buildSubject());
      final widget = tester.widget<TabBarView>(
        find.byType(TabBarView),
      );
      for (final type in FeedType.values) {
        final child = widget.children[type.index];
        expect(
          child,
          isA<FeedPage>().having(
            (page) => page.type,
            'type',
            type,
          ),
        );
      }
    });
  });
}
