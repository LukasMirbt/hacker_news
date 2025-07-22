import 'package:authentication_repository/authentication_repository.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/login/login.dart';

class LoginRedirectModel {
  const LoginRedirectModel({
    required AuthenticationRepository authenticationRepository,
  }) : _repository = authenticationRepository;

  final AuthenticationRepository _repository;

  String? redirect({
    required AppRoute route,
    required GoRouter goRouter,
  }) {
    if (route is! AuthenticatedRoute) return null;

    final isAuthenticated = _repository.state.status.isAuthenticated;
    if (isAuthenticated) return null;

    final currentLocation = goRouter.state.matchedLocation;
    if (currentLocation == LoginRoute.config.path) return null;

    final from = route.from(goRouter);
    return LoginRoute(from: from).location;
  }
}
