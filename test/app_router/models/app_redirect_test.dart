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

  final networkErrorRoute = NetworkErrorRoute(
    from: uri.toString(),
  );

  final networkErrorUrl = Uri.parse(networkErrorRoute.location);

  final analyticsConsentRoute = AnalyticsConsentRoute();
  final analyticsConsentUrl = Uri.parse(analyticsConsentRoute.location);

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

      testWidgets('returns null when isNetworkError and path '
          'is networkErrorPath ', (tester) async {
        when(
          () => authenticationState.status,
        ).thenReturn(AuthenticationStatus.networkError);
        when(() => goRouterState.uri).thenReturn(networkErrorUrl);
        final location = await redirect(tester);
        expect(location, null);
      });

      testWidgets('returns networkErrorUrl when isNetworkError '
          'and path is not networkErrorPath ', (tester) async {
        when(
          () => authenticationState.status,
        ).thenReturn(AuthenticationStatus.networkError);
        final location = await redirect(tester);
        expect(location, networkErrorUrl.toString());
      });

      testWidgets('returns from when !isNetworkError '
          'and path is networkErrorPath ', (tester) async {
        when(() => goRouterState.uri).thenReturn(networkErrorUrl);
        final location = await redirect(tester);
        expect(location, networkErrorUrl.queryParameters['from']);
      });

      testWidgets('returns analyticsConsentUrl when !isNetworkError '
          'and path is not networkErrorPath and appStatus '
          'is ${AppStatus.analyticsConsent}', (tester) async {
        when(() => appState.status).thenReturn(AppStatus.analyticsConsent);
        final location = await redirect(tester);
        expect(location, analyticsConsentUrl.toString());
      });

      testWidgets(
        'returns initialLocation when !isNetworkError and path '
        'is not networkErrorPath and appStatus is not '
        '${AppStatus.analyticsConsent} and path is analyticsConsentPath',
        (tester) async {
          when(() => goRouterState.uri).thenReturn(analyticsConsentUrl);
          final location = await redirect(tester);
          expect(location, initialLocation);
        },
      );

      testWidgets('returns initialLocation when !isNetworkError '
          'and path is not networkErrorPath and appStatus is not '
          '${AppStatus.analyticsConsent} and uri is "/"', (tester) async {
        when(() => goRouterState.uri).thenReturn(
          Uri.parse('/'),
        );
        final location = await redirect(tester);
        expect(location, initialLocation);
      });

      testWidgets('returns null when !isNetworkError and path '
          'is not networkErrorPath and appStatus is not '
          '${AppStatus.analyticsConsent} and uri is not "/"', (tester) async {
        final location = await redirect(tester);
        expect(location, null);
      });
    });
  });
}
