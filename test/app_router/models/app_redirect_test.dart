// ignore_for_file: prefer_const_constructors

import 'package:authentication_repository/authentication_repository.dart'
    hide AuthenticationState;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';
import 'package:hacker_client/app/app.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/network_error/network_error.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class _MockAuthenticationState extends Mock implements AuthenticationState {}

class _MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

class _MockAppState extends Mock implements AppState {}

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  final uri = Uri.parse('/home?from=%2Fthreads%3Fid%3Duser');
  const matchedLocation = '/home';

  final networkErrorRoute = NetworkErrorRoute(
    from: uri.toString(),
  );

  final networkErrorUri = Uri.parse(networkErrorRoute.location);

  final analyticsConsentRoute = AnalyticsConsentRoute();
  final analyticsConsentUri = Uri.parse(analyticsConsentRoute.location);

  final initialLocation = AppRouter.initialLocation;

  group(AppRedirect, () {
    late AuthenticationBloc authenticationBloc;
    late AuthenticationState authenticationState;
    late AppBloc appBloc;
    late AppState appState;
    late GoRouterState goRouterState;

    setUp(() {
      authenticationBloc = _MockAuthenticationBloc();
      authenticationState = _MockAuthenticationState();
      appBloc = _MockAppBloc();
      appState = _MockAppState();
      goRouterState = _MockGoRouterState();
      when(() => authenticationBloc.state).thenReturn(authenticationState);
      when(() => authenticationState.status).thenReturn(
        AuthenticationStatus.authenticated,
      );
      when(() => goRouterState.uri).thenReturn(uri);
      when(() => goRouterState.matchedLocation).thenReturn(matchedLocation);
      when(() => appBloc.state).thenReturn(appState);
      when(() => appState.status).thenReturn(AppStatus.home);
    });

    AppRedirect createSubject() => AppRedirect();

    group('redirect', () {
      Future<String?> redirect(
        WidgetTester tester, {
        bool? isWeb,
      }) async {
        final child = Container();
        await tester.pumpApp(
          BlocProvider.value(
            value: authenticationBloc,
            child: BlocProvider.value(
              value: appBloc,
              child: child,
            ),
          ),
        );
        final context = tester.element(find.byWidget(child));
        final appRedirect = createSubject();
        return appRedirect.redirect(context, goRouterState);
      }

      testWidgets('returns null when isNetworkError '
          'and matchedLocation is networkErrorPath ', (tester) async {
        when(
          () => authenticationState.status,
        ).thenReturn(AuthenticationStatus.networkError);
        when(
          () => goRouterState.matchedLocation,
        ).thenReturn(networkErrorUri.path);
        final location = await redirect(tester);
        expect(location, null);
      });

      testWidgets('returns networkErrorUri when isNetworkError '
          'and matchedLocation is not networkErrorPath ', (tester) async {
        when(
          () => authenticationState.status,
        ).thenReturn(AuthenticationStatus.networkError);
        final location = await redirect(tester);
        expect(location, networkErrorUri.toString());
      });

      testWidgets('returns from when !isNetworkError '
          'and matchedLocation is networkErrorPath ', (tester) async {
        when(() => goRouterState.uri).thenReturn(networkErrorUri);
        when(
          () => goRouterState.matchedLocation,
        ).thenReturn(networkErrorUri.path);
        final location = await redirect(tester);
        expect(location, networkErrorUri.queryParameters['from']);
      });

      testWidgets('returns analyticsConsentUri when !isNetworkError '
          'and matchedLocation is not networkErrorPath and appStatus '
          'is ${AppStatus.analyticsConsent}', (tester) async {
        when(() => appState.status).thenReturn(AppStatus.analyticsConsent);
        final location = await redirect(tester);
        expect(location, analyticsConsentUri.toString());
      });

      testWidgets('returns null when !isNetworkError '
          'and matchedLocation is analyticsConsentPath and appStatus '
          'is ${AppStatus.analyticsConsent}', (tester) async {
        when(
          () => goRouterState.matchedLocation,
        ).thenReturn(analyticsConsentUri.path);
        when(() => appState.status).thenReturn(AppStatus.analyticsConsent);
        final location = await redirect(tester);
        expect(location, null);
      });

      testWidgets(
        'returns initialLocation when !isNetworkError and appStatus '
        'is not ${AppStatus.analyticsConsent} and matchedLocation '
        'is analyticsConsentPath',
        (tester) async {
          when(() => goRouterState.uri).thenReturn(analyticsConsentUri);
          when(
            () => goRouterState.matchedLocation,
          ).thenReturn(analyticsConsentUri.path);
          final location = await redirect(tester);
          expect(location, initialLocation);
        },
      );

      testWidgets('returns initialLocation when !isNetworkError '
          'and appStatus is not ${AppStatus.analyticsConsent} '
          'and matchedLoaction is "/"', (tester) async {
        when(() => goRouterState.matchedLocation).thenReturn('/');
        final location = await redirect(tester);
        expect(location, initialLocation);
      });

      testWidgets('returns null when !isNetworkError '
          'and appStatus is not ${AppStatus.analyticsConsent} '
          'and matchedLocation is not "/"', (tester) async {
        final location = await redirect(tester);
        expect(location, null);
      });
    });
  });
}
