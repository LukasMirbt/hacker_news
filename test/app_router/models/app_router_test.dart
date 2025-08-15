// ignore_for_file: prefer_const_constructors
// ignore_for_file: cascade_invocations
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/login/login.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAppRedirect extends Mock implements AppRedirect {}

class _MockAppRouteList extends Mock implements AppRouteList {}

class _MockLoginRedirectModel extends Mock implements LoginRedirectModel {}

class _MockBuildContext extends Mock implements BuildContext {}

class _MockGoRouterState extends Mock implements GoRouterState {}

class _MockGoRouteData extends Mock implements GoRouteData {}

class _MockRelativeGoRouteData extends Mock implements RelativeGoRouteData {}

class _MockGoRouter extends Mock implements GoRouter {}

class _MockStatefulNavigationShell extends Mock
    with Diagnosticable
    implements StatefulNavigationShell {}

void main() {
  const redirect = 'redirect';
  const location = 'location';
  const relativeLocation = 'relativeLocation';

  group(AppRouter, () {
    late AppRedirect appRedirect;
    late AppRouteList appRouteList;
    late LoginRedirectModel redirectModel;
    late GoRouter goRouter;
    late GoRouterState state;
    late BuildContext context;
    late RelativeGoRouteData relativeRoute;
    late GoRouteData absoluteRoute;

    setUp(() {
      appRedirect = _MockAppRedirect();
      appRouteList = _MockAppRouteList();
      redirectModel = _MockLoginRedirectModel();
      goRouter = _MockGoRouter();
      state = _MockGoRouterState();
      context = _MockBuildContext();
      relativeRoute = _MockRelativeGoRouteData();
      absoluteRoute = _MockGoRouteData();
      registerFallbackValue(relativeRoute);
      registerFallbackValue(absoluteRoute);
      when(() => appRouteList.routes).thenReturn([]);
      when(() => goRouter.state).thenReturn(state);
    });

    AppRouter createSubject() {
      return AppRouter(
        appRedirect: appRedirect,
        appRouteList: appRouteList,
        loginRedirectModel: redirectModel,
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
      test('returns correct value', () {
        const matchedLocation = 'matchedLocation';
        when(() => state.matchedLocation).thenReturn(matchedLocation);
        final appRouter = createSubject();
        expect(appRouter.matchedLocation, matchedLocation);
      });
    });

    group('currentLocation', () {
      test('returns correct value', () {
        const currentLocation = '/home?id=123';
        final uri = Uri.parse(currentLocation);
        when(() => state.uri).thenReturn(uri);
        final appRouter = createSubject();
        expect(appRouter.currentLocation, currentLocation);
      });
    });

    group('from', () {
      test('returns correct value when "from" query parameter '
          'is non-null', () {
        const from = 'from';
        when(() => state.uri).thenReturn(
          Uri(
            queryParameters: {'from': from},
          ),
        );
        final appRouter = createSubject();
        expect(appRouter.from, from);
      });

      test('returns initialLocation when "from" query parameter '
          'is null', () {
        when(() => state.uri).thenReturn(Uri());
        final appRouter = createSubject();
        expect(appRouter.from, AppRouter.initialLocation);
      });
    });

    group('constructor', () {
      group('goRouter', () {
        AppRouter createSubject() {
          return AppRouter(
            appRedirect: appRedirect,
            appRouteList: appRouteList,
            loginRedirectModel: redirectModel,
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
      final route = _MockGoRouteData();

      final redirectMethod = () => redirectModel.redirect(
        route: route,
        goRouter: goRouter,
      );

      test('pushes redirect and returns when redirect '
          'is non-null', () {
        final pushRedirect = () => goRouter.push(redirect);
        when(redirectMethod).thenReturn(redirect);
        when(pushRedirect).thenAnswer((_) async => null);
        final appRouter = createSubject();
        appRouter.go(route);
        verify(pushRedirect).called(1);
        verifyNever(() => goRouter.go(any()));
      });

      test('calls go when redirect is null', () {
        when(() => route.location).thenReturn(location);
        final appRouter = createSubject();
        appRouter.go(route);
        verify(() => goRouter.go(location)).called(1);
      });
    });

    group('push', () {
      final route = _MockGoRouteData();

      final redirectMethod = () => redirectModel.redirect(
        route: route,
        goRouter: goRouter,
      );

      test('pushes redirect and returns when non-null', () async {
        final pushRedirect = () => goRouter.push(redirect);
        when(redirectMethod).thenReturn(redirect);
        when(pushRedirect).thenAnswer((_) async => null);
        final model = createSubject();
        await model.push(route);
        verify(pushRedirect).called(1);
        verifyNever(() => goRouter.push(location));
      });

      test('calls push with extra when redirect is null '
          r'and route has an "$extra" member', () async {
        final route = WebRedirectRoute(
          url: 'url',
          $extra: 'html',
        );
        final push = () => goRouter.push<String>(
          route.location,
          extra: route.$extra,
        );
        const result = 'result';
        when(push).thenAnswer((_) async => result);
        final model = createSubject();
        await expectLater(
          model.push<String>(route),
          completion(result),
        );
        verify(push).called(1);
      });

      test('calls push when redirect is null '
          r'and route does not have an "$extra" member', () async {
        final route = LoginRoute(from: 'from');
        final push = () => goRouter.push<String>(route.location);
        const result = 'result';
        when(push).thenAnswer((_) async => result);
        final model = createSubject();
        await expectLater(
          model.push<String>(route),
          completion(result),
        );
        verify(push).called(1);
      });
    });

    group('goRelative', () {
      final route = _MockRelativeGoRouteData();

      final redirectMethod = () => redirectModel.redirect(
        route: route,
        goRouter: goRouter,
      );

      test('pushes redirect and returns when redirect '
          'is non-null', () {
        final pushRedirect = () => goRouter.push(redirect);
        when(redirectMethod).thenReturn(redirect);
        when(pushRedirect).thenAnswer((_) async => null);
        final appRouter = createSubject();
        appRouter.goRelative(route);
        verify(pushRedirect).called(1);
        verifyNever(() => goRouter.go(any()));
      });

      test('calls go when redirect is null', () {
        when(() => route.relativeLocation).thenReturn(relativeLocation);
        final appRouter = createSubject();
        appRouter.goRelative(route);
        verify(() => goRouter.go(relativeLocation)).called(1);
      });
    });

    group('pushRelative', () {
      final route = _MockRelativeGoRouteData();

      final redirectMethod = () => redirectModel.redirect(
        route: route,
        goRouter: goRouter,
      );

      test('pushes redirect and returns when non-null', () async {
        final pushRedirect = () => goRouter.push(redirect);
        when(redirectMethod).thenReturn(redirect);
        when(pushRedirect).thenAnswer((_) async => null);
        final model = createSubject();
        await model.pushRelative(route);
        verify(pushRedirect).called(1);
        verifyNever(() => goRouter.push(location));
      });

      test('calls push when redirect is null', () async {
        when(() => route.relativeLocation).thenReturn(relativeLocation);
        final push = () => goRouter.push<String>(relativeLocation);
        const result = 'result';
        when(push).thenAnswer((_) async => result);
        final model = createSubject();
        await expectLater(
          model.pushRelative<String>(route),
          completion(result),
        );
        verify(push).called(1);
      });
    });

    group('goBranch', () {
      late StatefulNavigationShell shell;

      setUp(() {
        shell = _MockStatefulNavigationShell();
      });

      const index = 1;
      final destination = AppDestination.values[index];
      final route = destination.route;

      final redirectMethod = () => redirectModel.redirect(
        route: route,
        goRouter: goRouter,
      );

      test('pushes redirect and returns when redirect '
          'is non-null', () {
        final pushRedirect = () => goRouter.push(redirect);
        when(redirectMethod).thenReturn(redirect);
        when(pushRedirect).thenAnswer((_) async => null);
        final appRouter = createSubject();
        appRouter.goBranch(shell, index);
        verify(pushRedirect).called(1);
        verifyNever(() => shell.goBranch(any()));
      });

      test('calls goBranch when redirect is null', () {
        final appRouter = createSubject();
        appRouter.goBranch(shell, index);
        verify(() => shell.goBranch(index)).called(1);
      });
    });
  });
}
