import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';

class LoginRedirectFromModel {
  const LoginRedirectFromModel();

  String from({
    required AppRoute route,
    required GoRouter goRouter,
  }) {
    if (route is AppRelativeRoute) {
      final uri = goRouter.state.uri;
      final baseUri = uri.replace(path: '${uri.path}/');
      final routeUri = Uri.parse(route.location);
      final newUri = baseUri.resolveUri(routeUri);
      return newUri.toString();
    }

    return route.location;
  }
}
