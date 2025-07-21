import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/login/login.dart';

class AppRouter extends Cubit<AppRouterState> {
  AppRouter({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository,
      super(
        AppRouterState.initial(),
      );

  final AuthenticationRepository _authenticationRepository;

  void updateLocation(String matchedLocation) {
    emit(
      state.copyWith(
        history: [
          ...state.history,
          matchedLocation,
        ],
      ),
    );
  }

  void go(GoRouteData route, {Object? extra}) {
    final isAuthenticated =
        _authenticationRepository.state.status.isAuthenticated;

    final goRouter = state.goRouter;

    final loginRoute = LoginRoute(from: state.location);

    final currentLocation = goRouter.state.matchedLocation;

    if (!isAuthenticated &&
        route is AuthenticatedRoute &&
        currentLocation != loginRoute.location) {
      goRouter.push(loginRoute.location);
      return;
    }

    goRouter.go(
      route.location,
      extra: extra,
    );
  }

  Future<T?> push<T extends Object?>(GoRouteData route, {Object? extra}) {
    final isAuthenticated =
        _authenticationRepository.state.status.isAuthenticated;

    final goRouter = state.goRouter;

    final loginRoute = LoginRoute(from: state.location);

    final currentLocation = goRouter.state.matchedLocation;

    if (!isAuthenticated &&
        route is AuthenticatedRoute &&
        currentLocation != loginRoute.location) {
      goRouter.push(loginRoute.location);
      return Future.value();
    }

    return goRouter.push<T>(
      route.location,
      extra: extra,
    );
  }

  Future<T?> pushReplacement<T extends Object?>(
    GoRouteData route, {
    Object? extra,
  }) {
    final isAuthenticated =
        _authenticationRepository.state.status.isAuthenticated;

    final goRouter = state.goRouter;

    final loginRoute = LoginRoute(from: state.location);

    final currentLocation = goRouter.state.matchedLocation;

    if (!isAuthenticated &&
        route is AuthenticatedRoute &&
        currentLocation != loginRoute.location) {
      goRouter.pushReplacement(loginRoute.location);
      return Future.value();
    }

    return goRouter.pushReplacement<T>(
      route.location,
      extra: extra,
    );
  }
}
