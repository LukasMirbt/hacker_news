// ignore_for_file: prefer_const_constructors

import 'package:app/app_shell/app_shell.dart';
import 'package:app/settings/settings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  group(SettingsBranch, () {
    SettingsBranch createSubject() => SettingsBranch();

    test('is a $StatefulShellBranchData', () {
      final route = createSubject();
      expect(route, isA<StatefulShellBranchData>());
    });

    group('config', () {
      test('has correct type', () {
        expect(
          SettingsBranch.config,
          isA<TypedStatefulShellBranch<SettingsBranch>>(),
        );
      });

      test('has correct routes', () {
        expect(
          SettingsBranch.config.routes,
          [
            SettingsRoute.config,
          ],
        );
      });
    });
  });
}
