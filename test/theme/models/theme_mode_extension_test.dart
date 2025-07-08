// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/theme/models/theme_mode_extension.dart';

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group('ThemeModeExtension', () {
    group('label', () {
      test('returns correct value for ${ThemeMode.system}', () {
        const mode = ThemeMode.system;
        expect(mode.label(l10n), l10n.theme_system);
      });

      test('returns correct value for ${ThemeMode.light}', () {
        const mode = ThemeMode.light;
        expect(mode.label(l10n), l10n.theme_light);
      });

      test('returns correct value for ${ThemeMode.dark}', () {
        const mode = ThemeMode.dark;
        expect(mode.label(l10n), l10n.theme_dark);
      });
    });
  });
}
