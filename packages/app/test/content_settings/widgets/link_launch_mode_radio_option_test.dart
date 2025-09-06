// ignore_for_file: prefer_const_constructors

import 'package:app/content_settings/content_settings.dart';
import 'package:app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:link_launcher/link_launcher.dart';

import '../../app/pump_app.dart';

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  const value = LinkLaunchMode.inAppBrowserView;

  group(LinkLaunchModeRadioOption, () {
    Widget buildSubject() => LinkLaunchModeRadioOption(value);

    group(RadioListTile<LinkLaunchMode>, () {});
    RadioListTile<LinkLaunchMode> findWidget(WidgetTester tester) {
      return tester.widget<RadioListTile<LinkLaunchMode>>(
        find.byType(RadioListTile<LinkLaunchMode>),
      );
    }

    ThemeData findTheme(WidgetTester tester) {
      final context = tester.element(
        find.byType(LinkLaunchModeRadioOption),
      );
      return Theme.of(context);
    }

    testWidgets('has correct title', (tester) async {
      await tester.pumpApp(buildSubject());
      final title = value.title(l10n);
      final widget = findWidget(tester);
      expect(
        widget.title,
        isA<Text>().having(
          (text) => text.data,
          'data',
          title,
        ),
      );
    });

    testWidgets('has correct subtitle', (tester) async {
      await tester.pumpApp(buildSubject());
      final theme = findTheme(tester);
      final platform = theme.platform;
      final subtitle = value.subtitle(l10n, platform);
      final widget = findWidget(tester);
      expect(
        widget.subtitle,
        isA<Text>().having(
          (text) => text.data,
          'data',
          subtitle,
        ),
      );
    });

    testWidgets('has correct value', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.value, value);
    });
  });
}
