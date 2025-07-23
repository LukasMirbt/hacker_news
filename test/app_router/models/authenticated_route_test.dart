import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';

class _TestRoute extends GoRouteData with AuthenticatedRoute {}

void main() {
  group(AuthenticatedRoute, () {
    test('can be mixed in', () {
      expect(
        _TestRoute(),
        isA<AuthenticatedRoute>(),
      );
    });
  });
}
