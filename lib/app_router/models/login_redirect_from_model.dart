import 'package:go_router/go_router.dart';

class LoginRedirectFromModel {
  const LoginRedirectFromModel();

  String from({
    required RouteData route,
    required GoRouter goRouter,
  }) {
    if (route is GoRouteData) return route.location;

    if (route is RelativeGoRouteData) {
      final uri = goRouter.state.uri;
      final baseUri = uri.replace(path: '${uri.path}/');
      final routeUri = Uri.parse(route.location);
      final newUri = baseUri.resolveUri(routeUri);
      return newUri.toString();
    }

    throw UnsupportedError('Unsupported route type: ${route.runtimeType}');
  }
}
