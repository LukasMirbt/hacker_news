import 'package:app/app_router/app_router.dart';
import 'package:flutter_test/flutter_test.dart';

class _TestRoute implements AppRoute {
  @override
  String get location => throw UnimplementedError();

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
