import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';

class _TestRoute implements AppRoute {
  @override
  String get location => throw UnimplementedError();

  @override
  String from(GoRouter router) => throw UnimplementedError();

  @override
  String get navigationLocation => throw UnimplementedError();
}

void main() {
  group(AppRoute, () {
    test('can be implemented', () {
      final route = _TestRoute();
      expect(route, isA<AppRoute>());
    });
  });
}
