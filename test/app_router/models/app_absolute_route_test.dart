import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:mocktail/mocktail.dart';

class _MockGoRouter extends Mock implements GoRouter {}

class _MockGoRouterState extends Mock implements GoRouterState {}

class _TestAppAbsoluteRoute extends GoRouteData with AppAbsoluteRoute {
  _TestAppAbsoluteRoute({required this.location});

  @override
  final String location;

  @override
  void go(BuildContext context) => throw UnimplementedError();

  @override
  Future<T?> push<T>(BuildContext context) => throw UnimplementedError();

  @override
  void pushReplacement(BuildContext context) => throw UnimplementedError();

  @override
  void replace(BuildContext context) => throw UnimplementedError();
}

void main() {
  const location = 'location';

  group(AppAbsoluteRoute, () {
    late GoRouter router;
    late GoRouterState state;

    setUp(() {
      router = _MockGoRouter();
      state = _MockGoRouterState();
      when(() => router.state).thenReturn(state);
    });

    AppAbsoluteRoute createSubject() {
      return _TestAppAbsoluteRoute(location: location);
    }

    group('navigationLocation', () {
      test('returns location', () {
        final route = createSubject();
        expect(route.navigationLocation, location);
      });
    });
  });
}
