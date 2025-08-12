// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/l10n/l10n.dart';

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(AppDestination, () {
    group('route', () {
      test('returns correct route for ${AppDestination.home}', () {
        const destination = AppDestination.home;
        expect(destination.route, HomeRoute());
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
            icon: Icons.home_outlined,
            selectedIcon: Icons.home,
            label: l10n.appShell_home,
          ),
        );
      });

      test('returns correct $NavigationDrawerDestination '
          'for ${AppDestination.threads}', () {
        const destination = AppDestination.threads;
        expect(
          destination.data(l10n),
          DestinationData(
            icon: Icons.forum_outlined,
            selectedIcon: Icons.forum,
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
            icon: Icons.drafts_outlined,
            selectedIcon: Icons.drafts,
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
            icon: Icons.settings_outlined,
            selectedIcon: Icons.settings,
            label: l10n.appShell_settings,
          ),
        );
      });
    });
  });
}
