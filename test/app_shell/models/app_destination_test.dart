// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/l10n/l10n.dart';

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(AppDestination, () {
    group('label', () {
      test('returns correct value for ${AppDestination.home}', () {
        const destination = AppDestination.home;
        expect(destination.label(l10n), l10n.appShell_home);
      });

      test('returns correct value for ${AppDestination.settings}', () {
        const destination = AppDestination.settings;
        expect(destination.label(l10n), l10n.appShell_settings);
      });
    });

    group('icon', () {
      test('returns correct icon for ${AppDestination.home}', () {
        const destination = AppDestination.home;
        expect(destination.icon, Icons.home_outlined);
      });

      test('returns correct icon for ${AppDestination.settings}', () {
        const destination = AppDestination.settings;
        expect(destination.icon, Icons.settings_outlined);
      });
    });

    group('selectedIcon', () {
      test('returns correct selected icon for ${AppDestination.home}', () {
        const destination = AppDestination.home;
        expect(destination.selectedIcon, Icons.home);
      });

      test('returns correct selected icon for ${AppDestination.settings}', () {
        const destination = AppDestination.settings;
        expect(destination.selectedIcon, Icons.settings);
      });
    });
  });
}
