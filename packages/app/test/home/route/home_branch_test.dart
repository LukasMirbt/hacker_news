// ignore_for_file: prefer_const_constructors

import 'package:app/app_shell/app_shell.dart';
import 'package:app/home/home.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  group(HomeBranch, () {
    HomeBranch createSubject() => HomeBranch();

    test('is a $StatefulShellBranchData', () {
      final route = createSubject();
      expect(route, isA<StatefulShellBranchData>());
    });

    group('config', () {
      test('has correct type', () {
        expect(
          HomeBranch.config,
          isA<TypedStatefulShellBranch<HomeBranch>>(),
        );
      });

      test('has correct routes', () {
        expect(
          HomeBranch.config.routes,
          [
            HomeRoute.config,
          ],
        );
      });
    });
  });
}
