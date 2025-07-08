// ignore_for_file: prefer_const_constructors

import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/home/home.dart';
import 'package:hacker_client/l10n/l10n.dart';

import '../../app/pump_app.dart';

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(HomeTabBar, () {
    Widget buildSubject() {
      return DefaultTabController(
        length: FeedType.values.length,
        child: HomeTabBar(),
      );
    }

    TabBar findWidget(WidgetTester tester) {
      return tester.widget<TabBar>(
        find.byType(TabBar),
      );
    }

    testWidgets('isScrollable is true', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.isScrollable, true);
    });

    testWidgets('renders $Tab with correct title '
        'for each $FeedType', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      for (final type in FeedType.values) {
        expect(
          widget.tabs[type.index],
          isA<Tab>().having(
            (tab) => tab.text,
            'text',
            type.title(l10n),
          ),
        );
      }
    });
  });
}
