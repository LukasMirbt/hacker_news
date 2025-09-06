// ignore_for_file: prefer_const_constructors

import 'package:app/search/search.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  group(SearchBranch, () {
    SearchBranch createSubject() => SearchBranch();

    test('is a $StatefulShellBranchData', () {
      final route = createSubject();
      expect(route, isA<StatefulShellBranchData>());
    });

    group('config', () {
      test('has correct type', () {
        expect(
          SearchBranch.config,
          isA<TypedStatefulShellBranch<SearchBranch>>(),
        );
      });

      test('has correct routes', () {
        expect(
          SearchBranch.config.routes,
          [
            SearchRoute.config,
          ],
        );
      });
    });
  });
}
