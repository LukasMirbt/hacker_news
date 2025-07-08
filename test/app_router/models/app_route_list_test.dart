// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart' as app_tab;
import 'package:hacker_client/login_loading/login_loading.dart'
    as login_loading;
import 'package:hacker_client/logout_loading/logout_loading.dart'
    as logout_loading;

void main() {
  group(AppRouteList, () {});

  AppRouteList createSubject() => AppRouteList();

  group('routes', () {
    Iterable<String> paths(RouteBase routeBase) {
      if (routeBase is StatefulShellRoute) {
        return routeBase.routes.expand(paths);
      } else if (routeBase is ShellRoute) {
        return routeBase.routes.expand(paths);
      } else if (routeBase is GoRoute) {
        return [
          routeBase.path,
          ...routeBase.routes.expand(paths),
        ];
      }
      throw UnimplementedError(
        'Unexpected route type: ${routeBase.runtimeType}',
      );
    }

    List<String> allPaths() {
      final routeList = createSubject();
      return routeList.routes.expand(paths).toList();
    }

    test('contains loginLoading routes', () {
      final loginLoadingPaths = login_loading.$appRoutes.expand(paths);
      expect(
        allPaths(),
        containsAll(loginLoadingPaths),
      );
    });

    test('contains appTab routes', () {
      final appTabPaths = app_tab.$appRoutes.expand(paths);
      expect(
        allPaths(),
        containsAll(appTabPaths),
      );
    });

    test('contains logoutLoading routes', () {
      final logoutLoadingPaths = logout_loading.$appRoutes.expand(paths);
      expect(
        allPaths(),
        containsAll(logoutLoadingPaths),
      );
    });
  });
}
