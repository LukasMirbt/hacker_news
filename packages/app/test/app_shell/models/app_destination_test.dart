// ignore_for_file: prefer_const_constructors

import 'package:app/app_shell/app_shell.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(AppDestination, () {
    group('route', () {
      test('returns correct route for ${AppDestination.home}', () {
        const destination = AppDestination.home;
        expect(destination.route, HomeRoute());
      });

      test('returns correct route for ${AppDestination.search}', () {
        const destination = AppDestination.search;
        expect(destination.route, SearchRoute());
      });

      test('returns correct route for ${AppDestination.threads}', () {
        const destination = AppDestination.threads;
        expect(destination.route, ThreadFeedRoute());
      });

      test('returns correct route for ${AppDestination.drafts}', () {
        const destination = AppDestination.drafts;
        expect(destination.route, DraftRoute());
      });

      test('returns correct route for ${AppDestination.settings}', () {
        const destination = AppDestination.settings;
        expect(destination.route, SettingsRoute());
      });
    });

    group('data', () {
      test('returns correct $DestinationData '
          'for ${AppDestination.home}', () {
        const destination = AppDestination.home;
        expect(
          destination.data(l10n),
          DestinationData(
            icon: Symbols.home_rounded,
            label: l10n.appShell_home,
          ),
        );
      });

      test('returns correct $NavigationDrawerDestination '
          'for ${AppDestination.search}', () {
        const destination = AppDestination.search;
        expect(
          destination.data(l10n),
          DestinationData(
            icon: Symbols.search_rounded,
            label: l10n.appShell_search,
          ),
        );
      });

      test('returns correct $NavigationDrawerDestination '
          'for ${AppDestination.threads}', () {
        const destination = AppDestination.threads;
        expect(
          destination.data(l10n),
          DestinationData(
            icon: Symbols.forum_rounded,
            label: l10n.appShell_threads,
          ),
        );
      });

      test('returns correct $NavigationDrawerDestination '
          'for ${AppDestination.drafts}', () {
        const destination = AppDestination.drafts;
        expect(
          destination.data(l10n),
          DestinationData(
            icon: Symbols.drafts_rounded,
            label: l10n.appShell_drafts,
          ),
        );
      });

      test('returns correct $NavigationDrawerDestination '
          'for ${AppDestination.settings}', () {
        const destination = AppDestination.settings;
        expect(
          destination.data(l10n),
          DestinationData(
            icon: Symbols.settings_rounded,
            label: l10n.appShell_settings,
          ),
        );
      });
    });
  });
}
