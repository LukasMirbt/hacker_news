// ignore_for_file: prefer_const_constructors

import 'package:app/drafts/drafts.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  group(DraftBranch, () {
    DraftBranch createSubject() => DraftBranch();

    test('is a $StatefulShellBranchData', () {
      final route = createSubject();
      expect(route, isA<StatefulShellBranchData>());
    });

    group('config', () {
      test('has correct type', () {
        expect(
          DraftBranch.config,
          isA<TypedStatefulShellBranch<DraftBranch>>(),
        );
      });

      test('has correct routes', () {
        expect(
          DraftBranch.config.routes,
          [
            DraftShellRoute.config,
          ],
        );
      });
    });
  });
}
