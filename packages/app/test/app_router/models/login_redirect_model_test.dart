// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/app_router/app_router.dart';
import 'package:app/login/login.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class _MockAuthenticationState extends Mock implements AuthenticationState {}

class _MockGoRouter extends Mock implements GoRouter {}

class _MockGoRouterState extends Mock implements GoRouterState {}

class _MockLoginRedirectFromModel extends Mock
    implements LoginRedirectFromModel {}

class _TestRouteData implements RouteData {}

class _TestAuthenticatedRouteData extends RouteData with AuthenticatedRoute {
  _TestAuthenticatedRouteData();
}

void main() {
  final route = _TestRouteData();
  final authenticatedRoute = _TestAuthenticatedRouteData();

  group(LoginRedirectModel, () {
    late AuthenticationRepository repository;
    late AuthenticationState authenticationState;
    late GoRouter goRouter;
    late GoRouterState goRouterState;
    late LoginRedirectFromModel fromModel;

    setUp(() {
      repository = _MockAuthenticationRepository();
      authenticationState = _MockAuthenticationState();
      goRouter = _MockGoRouter();
      fromModel = _MockLoginRedirectFromModel();
      goRouterState = _MockGoRouterState();
      when(() => repository.state).thenReturn(authenticationState);
      when(() => goRouter.state).thenReturn(goRouterState);
    });

    LoginRedirectModel createSubject() {
      return LoginRedirectModel(
        authenticationRepository: repository,
        loginRedirectFromModel: fromModel,
      );
    }

    group('redirect', () {
      const from = 'from';
      const loginRoute = LoginRoute(from: from);

      test('returns null when route is not $AuthenticatedRoute', () {
        final model = createSubject();
        final redirect = model.redirect(
          route: route,
          goRouter: goRouter,
        );
        expect(redirect, null);
      });

      test('returns null when isAuthenticated', () {
        when(
          () => authenticationState.status,
        ).thenReturn(
          AuthenticationStatus.authenticated,
        );
        final model = createSubject();
        final redirect = model.redirect(
          route: authenticatedRoute,
          goRouter: goRouter,
        );
        expect(redirect, null);
      });

      test('returns null when currentLocation is $LoginRoute path', () {
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
          route: authenticatedRoute,
          goRouter: goRouter,
        );
        expect(redirect, null);
      });

      test('returns loginRoute.location when route '
          'is $AuthenticatedRoute and !isAuthenticated '
          'and currentLocation is not $LoginRoute path', () {
        when(
          () => authenticationState.status,
        ).thenReturn(
          AuthenticationStatus.unauthenticated,
        );
        when(
          () => goRouterState.matchedLocation,
        ).thenReturn('matchedLocation');
        final fromMethod = () => fromModel.from(
          route: authenticatedRoute,
          goRouter: goRouter,
        );
        when(fromMethod).thenReturn(from);
        final model = createSubject();
        final redirect = model.redirect(
          route: authenticatedRoute,
          goRouter: goRouter,
        );
        expect(redirect, loginRoute.location);
        verify(fromMethod).called(1);
      });
    });
  });
}
