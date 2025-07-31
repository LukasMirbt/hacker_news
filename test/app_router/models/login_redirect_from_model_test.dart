// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:mocktail/mocktail.dart';

class _MockAppRelativeRoute extends Mock implements AppRelativeRoute {}

class _MockAppAbsoluteRoute extends Mock implements AppAbsoluteRoute {}

class _MockGoRouter extends Mock implements GoRouter {}

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  group(LoginRedirectFromModel, () {
    late GoRouter goRouter;
    late GoRouterState state;

    setUp(() {
      goRouter = _MockGoRouter();
      state = _MockGoRouterState();
      when(() => goRouter.state).thenReturn(state);
    });

    LoginRedirectFromModel createSubject() => LoginRedirectFromModel();

    group('from', () {
      test('returns correct value when route is $AppRelativeRoute', () {
        final route = _MockAppRelativeRoute();
        const location = 'location';
        final uri = Uri.parse('/post/123?id=456#789');
        when(() => route.location).thenReturn(location);
        when(() => state.uri).thenReturn(uri);
        final fromModel = createSubject();
        expect(
          fromModel.from(route: route, goRouter: goRouter),
          '/post/123/location?id=456#789',
        );
      });

      test('returns correct value when route is not $AppRelativeRoute', () {
        final route = _MockAppAbsoluteRoute();
        const matchedLocation = 'matchedLocation';
        when(() => state.matchedLocation).thenReturn(matchedLocation);
        final fromModel = createSubject();
        expect(
          fromModel.from(route: route, goRouter: goRouter),
          matchedLocation,
        );
      });
    });
  });
}
