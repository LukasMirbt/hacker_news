// ignore_for_file: prefer_const_constructors

import 'package:app/app_router/app_router.dart';
import 'package:app/data_collection/data_collection.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/settings/settings.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAppRouter extends Mock implements AppRouter {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(DataCollectionListItem, () {
    late AppRouter router;

    setUp(() {
      router = _MockAppRouter();
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: DataCollectionListItem(),
      );
    }

    group(ListTile, () {
      ListTile findWidget(WidgetTester tester) {
        return tester.widget<ListTile>(
          find.byType(ListTile),
        );
      }

      testWidgets('has correct leading', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.leading,
          isA<AppIcon>().having(
            (icon) => icon.icon,
            'icon',
            Symbols.analytics_rounded,
          ),
        );
      });

      testWidgets('has correct title', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.title,
          isA<Text>().having(
            (text) => text.data,
            'title',
            l10n.settings_dataCollection,
          ),
        );
      });

      testWidgets('has correct trailing', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.trailing,
          isA<AppIcon>().having(
            (icon) => icon.icon,
            'icon',
            Symbols.chevron_right_rounded,
          ),
        );
      });

      testWidgets('naviates to $DataCollectionRoute onTap', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onTap?.call();
        verify(
          () => router.go(
            DataCollectionRoute(),
          ),
        ).called(1);
      });
    });
  });
}
