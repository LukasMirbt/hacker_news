// ignore_for_file: prefer_const_constructors
// ignore_for_file: cascade_invocations
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAppRedirect extends Mock implements AppRedirect {}

class _MockAppRouteList extends Mock implements AppRouteList {}

class _MockAppNavigationModel extends Mock implements AppNavigationModel {}

class _MockBuildContext extends Mock implements BuildContext {}

class _MockGoRouterState extends Mock implements GoRouterState {}

class _MockAppAbsoluteRoute extends Mock implements AppAbsoluteRoute {}

class _MockAppRelativeRoute extends Mock implements AppRelativeRoute {}

class _MockGoRouter extends Mock implements GoRouter {}

void main() {
  group(AppRouter, () {
    late AppRedirect appRedirect;
    late AppRouteList appRouteList;
    late AppNavigationModel navigationModel;
    late GoRouter goRouter;
    late GoRouterState state;
    late BuildContext context;
    late AppRelativeRoute relativeRoute;
    late AppAbsoluteRoute absoluteRoute;

    setUp(() {
      appRedirect = _MockAppRedirect();
      appRouteList = _MockAppRouteList();
      navigationModel = _MockAppNavigationModel();
      goRouter = _MockGoRouter();
      state = _MockGoRouterState();
      context = _MockBuildContext();
      relativeRoute = _MockAppRelativeRoute();
      absoluteRoute = _MockAppAbsoluteRoute();
      registerFallbackValue(relativeRoute);
      registerFallbackValue(absoluteRoute);
      when(() => appRouteList.routes).thenReturn([]);
      when(() => goRouter.state).thenReturn(state);
    });

    AppRouter createSubject() {
      return AppRouter(
        appRedirect: appRedirect,
        appRouteList: appRouteList,
        appNavigationModel: navigationModel,
        goRouter: goRouter,
      );
    }

    group('navigatorKey', () {
      test('returns ${GlobalKey<NavigatorState>}', () {
        expect(
          AppRouter.navigatorKey,
          isA<GlobalKey<NavigatorState>>(),
        );
      });
    });

    group('initialLocation', () {
      test('returns correct value', () {
        expect(
          AppRouter.initialLocation,
          HomeRoute().location,
        );
      });
    });

    group('of', () {
      late AppRouter appRouter;
      late Widget child;

      setUp(() {
        appRouter = createSubject();
        child = Container();
      });

      Widget buildSubject() {
        return Provider.value(
          value: appRouter,
          child: child,
        );
      }

      testWidgets('returns $AppRouter', (tester) async {
        await tester.pumpApp(buildSubject());
        final context = tester.element(find.byWidget(child));
        expect(AppRouter.of(context), appRouter);
      });
    });

    group('matchedLocation', () {
      test('returns goRouter.state.matchedLocation', () {
        const matchedLocation = 'matchedLocation';
        when(() => state.matchedLocation).thenReturn(matchedLocation);
        final appRouter = createSubject();
        expect(appRouter.matchedLocation, matchedLocation);
      });
    });

    group('constructor', () {
      group('goRouter', () {
        AppRouter createSubject() {
          return AppRouter(
            appRedirect: appRedirect,
            appRouteList: appRouteList,
            appNavigationModel: navigationModel,
          );
        }

        test('has correct navigatorKey', () {
          final appRouter = createSubject();
          expect(
            appRouter.goRouter.configuration.navigatorKey,
            AppRouter.navigatorKey,
          );
        });

        test('has correct initialLocation', () {
          final appRouter = createSubject();
          expect(
            appRouter.goRouter.routeInformationProvider.value.uri.path,
            AppRouter.initialLocation,
          );
        });

        test('has correct routes', () {
          final routes = <RouteBase>[];
          when(() => appRouteList.routes).thenReturn(routes);
          final router = createSubject();
          expect(
            router.goRouter.configuration.routes,
            same(routes),
          );
        });

        test('has correct redirect', () {
          final router = createSubject();
          router.goRouter.configuration.topRedirect(context, state);
          verify(
            () => appRedirect.redirect(context, state),
          ).called(1);
        });
      });
    });

    group('go', () {
      test('calls navigationModel.go', () {
        final route = _MockAppAbsoluteRoute();
        final go = () => navigationModel.go(
          goRouter: goRouter,
          route: route,
        );
        final appRouter = createSubject();
        appRouter.go(route);
        verify(go).called(1);
      });
    });

    group('push', () {
      test('calls navigationModel.push', () {
        final route = _MockAppAbsoluteRoute();
        const result = 'result';
        final push = () => navigationModel.push<String>(
          goRouter: goRouter,
          route: route,
        );
        when(push).thenAnswer((_) async => result);
        final appRouter = createSubject();
        expect(
          appRouter.push<String>(route),
          completion(result),
        );
        verify(push).called(1);
      });
    });

    group('goRelative', () {
      test('calls navigationModel.go', () {
        final route = _MockAppRelativeRoute();
        final go = () => navigationModel.go(
          goRouter: goRouter,
          route: route,
        );
        final appRouter = createSubject();
        appRouter.goRelative(route);
        verify(go).called(1);
      });
    });

    group('pushRelative', () {
      test('calls navigationModel.push', () {
        final route = _MockAppRelativeRoute();
        const result = 'result';
        final push = () => navigationModel.push<String>(
          goRouter: goRouter,
          route: route,
        );
        when(push).thenAnswer((_) async => result);
        final appRouter = createSubject();
        expect(
          appRouter.pushRelative<String>(route),
          completion(result),
        );
        verify(push).called(1);
      });
    });
  });
}
