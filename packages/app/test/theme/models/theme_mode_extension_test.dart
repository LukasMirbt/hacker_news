// ignore_for_file: prefer_const_constructors

import 'package:app/l10n/l10n.dart';
import 'package:app/theme/models/theme_mode_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group('ThemeModeExtension', () {
    group('label', () {
      test('returns correct value for ${ThemeMode.system}', () {
        const mode = ThemeMode.system;
        expect(
          mode.label(l10n),
          l10n.theme_systemMode,
        );
      });

      test('returns correct value for ${ThemeMode.light}', () {
        const mode = ThemeMode.light;
        expect(
          mode.label(l10n),
          l10n.theme_lightMode,
        );
      });

      test('returns correct value for ${ThemeMode.dark}', () {
        const mode = ThemeMode.dark;
        expect(
          mode.label(l10n),
          l10n.theme_darkMode,
        );
      });
    });
  });
}
