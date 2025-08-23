// ignore_for_file: prefer_const_constructors

import 'package:app/l10n/l10n.dart';
import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../app/pump_app.dart';

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  const value = ThemeMode.dark;

  group(ThemeRadioOption, () {
    Widget buildSubject() => ThemeRadioOption(value);

    group(RadioListTile<ThemeMode>, () {});
    RadioListTile<ThemeMode> findWidget(WidgetTester tester) {
      return tester.widget<RadioListTile<ThemeMode>>(
        find.byType(RadioListTile<ThemeMode>),
      );
    }

    testWidgets('has correct title', (tester) async {
      await tester.pumpApp(buildSubject());
      final label = value.label(l10n);
      final widget = findWidget(tester);
      expect(
        widget.title,
        isA<Text>().having(
          (text) => text.data,
          'data',
          label,
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
