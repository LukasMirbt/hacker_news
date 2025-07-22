import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/login/login.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class _MockAuthenticationState extends Mock implements AuthenticationState {}

class _MockGoRouter extends Mock implements GoRouter {}

class _MockGoRouterState extends Mock implements GoRouterState {}

class _TestAppRoute implements AppRoute {
  @override
  String get location => throw UnimplementedError();

  @override
  String from(GoRouter router) => throw UnimplementedError();

  @override
  String get navigationLocation => throw UnimplementedError();
}

class _TestAppAuthenticatedRoute extends GoRouteData
    with AppAbsoluteRoute, AuthenticatedRoute {
  _TestAppAuthenticatedRoute({
    required String from,
  }) : _from = from;

  final String _from;

  @override
  String get location => throw UnimplementedError();

  @override
  String from(GoRouter router) => _from;

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
  group(LoginRedirectModel, () {
    late AuthenticationRepository repository;
    late AuthenticationState authenticationState;
    late GoRouter goRouter;
    late GoRouterState goRouterState;

    setUp(() {
      repository = _MockAuthenticationRepository();
      authenticationState = _MockAuthenticationState();
      goRouter = _MockGoRouter();
      goRouterState = _MockGoRouterState();
      when(() => repository.state).thenReturn(authenticationState);
      when(() => goRouter.state).thenReturn(goRouterState);
    });

    LoginRedirectModel createSubject() {
      return LoginRedirectModel(
        authenticationRepository: repository,
      );
    }

    group('redirect', () {
      const from = 'from';
      const loginRoute = LoginRoute(from: from);

      test('returns null when route is not $AuthenticatedRoute', () {
        final route = _TestAppRoute();
        final model = createSubject();
        final redirect = model.redirect(
          route: route,
          goRouter: goRouter,
        );
        expect(redirect, null);
      });

      test('returns null when isAuthenticated', () {
        final route = _TestAppAuthenticatedRoute(from: from);
        when(
          () => authenticationState.status,
        ).thenReturn(
          AuthenticationStatus.authenticated,
        );
        final model = createSubject();
        final redirect = model.redirect(
          route: route,
          goRouter: goRouter,
        );
        expect(redirect, null);
      });

      test('returns null when currentLocation is $LoginRoute path', () {
        final route = _TestAppAuthenticatedRoute(from: from);
        when(
          () => authenticationState.status,
        ).thenReturn(
          AuthenticationStatus.unauthenticated,
        );
        when(
          () => goRouterState.matchedLocation,
        ).thenReturn(LoginRoute.config.path);
        final model = createSubject();
        final redirect = model.redirect(
          route: route,
          goRouter: goRouter,
        );
        expect(redirect, null);
      });

      test('returns loginRoute.location when route '
          'is $AuthenticatedRoute and !isAuthenticated '
          'and currentLocation is not $LoginRoute path', () {
        final route = _TestAppAuthenticatedRoute(from: from);
        when(
          () => authenticationState.status,
        ).thenReturn(
          AuthenticationStatus.unauthenticated,
        );
        when(
          () => goRouterState.matchedLocation,
        ).thenReturn('matchedLocation');
        final model = createSubject();
        final redirect = model.redirect(
          route: route,
          goRouter: goRouter,
        );
        expect(redirect, loginRoute.location);
      });
    });
  });
}
