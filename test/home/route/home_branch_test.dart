// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/home/home.dart';

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
