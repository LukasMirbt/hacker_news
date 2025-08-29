// ignore_for_file: prefer_const_constructors

import 'package:app/app_shell/app_shell.dart';
import 'package:app/l10n/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(ShellAppBarModel, () {
    ShellAppBarModel createSubject(
      AppDestination destination,
    ) {
      return ShellAppBarModel(destination);
    }

    group('hasBorder', () {
      test('returns true when destination '
          'is ${AppDestination.home}', () {
        final model = createSubject(AppDestination.home);
        expect(model.hasBorder, true);
      });

      test('returns true when destination '
          'is ${AppDestination.search}', () {
        final model = createSubject(AppDestination.search);
        expect(model.hasBorder, true);
      });

      test('returns false when destination '
          'is not ${AppDestination.home} '
          'or ${AppDestination.search}', () {
        final model = createSubject(AppDestination.threads);
        expect(model.hasBorder, false);
      });
    });

    group('title', () {
      test('returns null when destination '
          'is ${AppDestination.home}', () {
        final model = createSubject(AppDestination.home);
        expect(model.title(l10n), null);
      });

      test('returns correct value when destination '
          'is ${AppDestination.search}', () {
        final model = createSubject(AppDestination.search);
        expect(model.title(l10n), l10n.appShell_search);
      });

      test('returns correct value when destination '
          'is ${AppDestination.threads}', () {
        final model = createSubject(AppDestination.threads);
        expect(model.title(l10n), l10n.appShell_threads);
      });

      test('returns correct value when destination '
          'is ${AppDestination.drafts}', () {
        final model = createSubject(AppDestination.drafts);
        expect(model.title(l10n), l10n.appShell_drafts);
      });

      test('returns correct value when destination '
          'is ${AppDestination.settings}', () {
        final model = createSubject(AppDestination.settings);
        expect(model.title(l10n), l10n.appShell_settings);
      });
    });
  });
}
