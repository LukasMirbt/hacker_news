import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:path/path.dart';

class LoginRedirectFromModel {
  const LoginRedirectFromModel();

  String from({
    required AppRoute route,
    required GoRouter goRouter,
  }) {
    // TODO: Take logic from other branch

    final currentLocation = goRouter.state.matchedLocation;

    if (route is AppRelativeRoute) {
      return join(currentLocation, route.location);
    }

    return currentLocation;
  }
}
