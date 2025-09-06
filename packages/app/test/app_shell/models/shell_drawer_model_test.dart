// ignore_for_file: prefer_const_constructors

import 'package:app/app_shell/app_shell.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(ShellDrawerModel, () {
    ShellDrawerModel createSubject(
      AppDestination destination,
    ) {
      return ShellDrawerModel(destination);
    }

    group('selectedIndex', () {
      test('returns correct value', () {
        const destination = AppDestination.home;
        final model = createSubject(destination);
        expect(model.selectedIndex, destination.index);
      });
    });

    group('data', () {
      test('returns correct $DestinationData '
          'for ${AppDestination.home}', () {
        final model = createSubject(AppDestination.home);
        expect(
          model.data(l10n),
          DestinationData(
            icon: Symbols.home_rounded,
            label: l10n.appShell_home,
          ),
        );
      });

      test('returns correct $NavigationDrawerDestination '
          'for ${AppDestination.search}', () {
        final model = createSubject(AppDestination.search);
        expect(
          model.data(l10n),
          DestinationData(
            icon: Symbols.search_rounded,
            label: l10n.appShell_search,
          ),
        );
      });

      test('returns correct $NavigationDrawerDestination '
          'for ${AppDestination.threads}', () {
        final model = createSubject(AppDestination.threads);
        expect(
          model.data(l10n),
          DestinationData(
            icon: Symbols.forum_rounded,
            label: l10n.appShell_threads,
          ),
        );
      });

      test('returns correct $NavigationDrawerDestination '
          'for ${AppDestination.drafts}', () {
        final model = createSubject(AppDestination.drafts);
        expect(
          model.data(l10n),
          DestinationData(
            icon: Symbols.drafts_rounded,
            label: l10n.appShell_drafts,
          ),
        );
      });

      test('returns correct $NavigationDrawerDestination '
          'for ${AppDestination.settings}', () {
        final model = createSubject(AppDestination.settings);
        expect(
          model.data(l10n),
          DestinationData(
            icon: Symbols.settings_rounded,
            label: l10n.appShell_settings,
          ),
        );
      });
    });
  });
}
