// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:mocktail/mocktail.dart';

class _MockGoRouteData extends Mock implements GoRouteData {}

class _MockRelativeGoRouteData extends Mock implements RelativeGoRouteData {}

class _MockRouteData extends Mock implements RouteData {}

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
      test('returns correct value when route is $GoRouteData', () {
        final route = _MockGoRouteData();
        const location = 'location';
        when(() => route.location).thenReturn(location);
        final fromModel = createSubject();
        expect(
          fromModel.from(route: route, goRouter: goRouter),
          location,
        );
      });

      test('returns correct value when route is $RelativeGoRouteData', () {
        final route = _MockRelativeGoRouteData();
        final replyUrl = Uri.encodeQueryComponent('reply?id=44758610');
        final subpath = 'reply?url=$replyUrl';
        when(() => route.subpath).thenReturn(subpath);
        final fromModel = createSubject();
        expect(
          fromModel.from(route: route, goRouter: goRouter),
          '/home/post/44719222/reply?url=$replyUrl',
        );
      });

      test('throws $UnsupportedError when route is not $GoRouteData '
          'or $RelativeGoRouteData', () {
        final route = _MockRouteData();
        final fromModel = createSubject();
        expect(
          () => fromModel.from(route: route, goRouter: goRouter),
          throwsA(
            isA<UnsupportedError>().having(
              (error) => error.message,
              'message',
              'Unsupported route type: ${route.runtimeType}',
            ),
          ),
        );
      });
    });
  });
}
