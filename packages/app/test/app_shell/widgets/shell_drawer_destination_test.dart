// ignore_for_file: prefer_const_constructors

import 'package:app/app_shell/app_shell.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(ShellDrawerDestination, () {
    group('unnamed constructor', () {
      test('returns $ShellDrawerDestination with correct values', () {
        const destination = AppDestination.home;
        final data = ShellDrawerModel(destination).data(l10n);
        expect(
          ShellDrawerDestination(
            destination: destination,
            data: data,
          ),
          isA<ShellDrawerDestination>()
              .having(
                (widget) => widget.destination,
                'destination',
                destination,
              )
              .having(
                (widget) => widget.icon,
                'icon',
                isA<AppIcon>().having(
                  (icon) => icon.icon,
                  'icon.icon',
                  data.icon,
                ),
              )
              .having(
                (widget) => widget.selectedIcon,
                'selectedIcon',
                isA<AppIcon>()
                    .having(
                      (icon) => icon.filled,
                      'filled',
                      true,
                    )
                    .having(
                      (icon) => icon.icon,
                      'icon',
                      data.icon,
                    ),
              )
              .having(
                (widget) => widget.label,
                'label',
                isA<Text>().having(
                  (text) => text.data,
                  'text.data',
                  data.label,
                ),
              ),
        );
      });
    });

    group('from', () {
      test('returns $ShellDrawerDestination', () {
        const destination = AppDestination.home;
        expect(
          ShellDrawerDestination.from(
            destination: destination,
            l10n: l10n,
          ),
          isA<ShellDrawerDestination>().having(
            (widget) => widget.destination,
            'destination',
            destination,
          ),
        );
      });
    });
  });
}
