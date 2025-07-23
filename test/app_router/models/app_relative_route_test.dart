import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:mocktail/mocktail.dart';

class _MockGoRouter extends Mock implements GoRouter {}

class _MockGoRouterState extends Mock implements GoRouterState {}

class _TestAppRelativeRoute extends GoRouteData with AppRelativeRoute {
  _TestAppRelativeRoute({
    required this.relativeLocation,
  });

  @override
  final String relativeLocation;

  @override
  String get location => throw UnimplementedError();

  @override
  void goRelative(BuildContext context) => throw UnimplementedError();

  @override
  Future<T?> pushRelative<T>(BuildContext context) =>
      throw UnimplementedError();

  @override
  void pushReplacementRelative(BuildContext context) =>
      throw UnimplementedError();

  @override
  void replaceRelative(BuildContext context) => throw UnimplementedError();
}

void main() {
  const relativeLocation = 'relativeLocation';

  group(AppRelativeRoute, () {
    late GoRouter router;
    late GoRouterState state;

    setUp(() {
      router = _MockGoRouter();
      state = _MockGoRouterState();
      when(() => router.state).thenReturn(state);
    });

    AppRelativeRoute createSubject() {
      return _TestAppRelativeRoute(
        relativeLocation: relativeLocation,
      );
    }

    group('navigationLocation', () {
      test('returns relativeLocation', () {
        final route = createSubject();
        expect(route.navigationLocation, relativeLocation);
      });
    });
  });
}
