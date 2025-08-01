import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';

class LoginRedirectFromModel {
  const LoginRedirectFromModel();

  String from({
    required AppRoute route,
    required GoRouter goRouter,
  }) {
    final uri = goRouter.state.uri;

    if (route is AppRelativeRoute) {
      final routeUri = Uri.parse(route.location);
      final baseUri = uri.replace(path: '${uri.path}/');
      final newUri = baseUri.resolveUri(routeUri);
      return newUri.toString();
    }

    return uri.toString();
  }
}
