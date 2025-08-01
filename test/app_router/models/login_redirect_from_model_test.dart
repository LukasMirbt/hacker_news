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
  final uri = Uri.parse('/home/post/44719222');

  group(LoginRedirectFromModel, () {
    late GoRouter goRouter;
    late GoRouterState state;

    setUp(() {
      goRouter = _MockGoRouter();
      state = _MockGoRouterState();
      when(() => goRouter.state).thenReturn(state);
      when(() => state.uri).thenReturn(uri);
    });

    LoginRedirectFromModel createSubject() => LoginRedirectFromModel();

    group('from', () {
      test('returns correct value when route is $AppRelativeRoute', () {
        final route = _MockAppRelativeRoute();
        final replyUrl = Uri.encodeQueryComponent('reply?id=44758610');
        final location = 'reply?url=$replyUrl';
        when(() => route.location).thenReturn(location);
        final fromModel = createSubject();
        expect(
          fromModel.from(route: route, goRouter: goRouter),
          '/home/post/44719222/reply?url=$replyUrl',
        );
      });

      test('returns correct value when route is not $AppRelativeRoute', () {
        final route = _MockAppAbsoluteRoute();
        const location = 'location';
        when(() => route.location).thenReturn(location);
        final fromModel = createSubject();
        expect(
          fromModel.from(route: route, goRouter: goRouter),
          location,
        );
      });
    });
  });
}
