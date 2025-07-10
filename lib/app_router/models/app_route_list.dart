import 'package:go_router/go_router.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart'
    as analytics_consent;
import 'package:hacker_client/app_shell/app_shell.dart' as app_tab;
import 'package:hacker_client/login/login.dart' as login;
import 'package:hacker_client/login_loading/login_loading.dart'
    as login_loading;
import 'package:hacker_client/logout_loading/logout_loading.dart'
    as logout_loading;
import 'package:hacker_client/web_redirect/web_redirect.dart' as web_redirect;

class AppRouteList {
  AppRouteList()
    : routes = [
        ...analytics_consent.$appRoutes,
        ...login.$appRoutes,
        ...web_redirect.$appRoutes,
        ...login_loading.$appRoutes,
        ...logout_loading.$appRoutes,
        ...app_tab.$appRoutes,
      ];

  final List<RouteBase> routes;
}
