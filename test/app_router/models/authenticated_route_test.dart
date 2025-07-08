// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_repository/authentication_repository.dart'
    hide AuthenticationState;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/login/login.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class _MockAuthenticationState extends Mock implements AuthenticationState {}

class _MockAppRouterBloc extends MockBloc<AppRouterEvent, AppRouterState>
    implements AppRouterBloc {}

class _MockAppRouterState extends Mock implements AppRouterState {}

class _MockGoRouterState extends Mock implements GoRouterState {}

class _MockGoRouter extends Mock implements GoRouter {}

class _TestAuthenticatedRoute extends GoRouteData with AuthenticatedRoute {}

void main() {
  group(AuthenticatedRoute, () {
    late AuthenticationBloc authenticationBloc;
    late AuthenticationState authenticationState;
    late AppRouterBloc appRouterBloc;
    late AppRouterState appRouterState;
    late GoRouterState state;
    late GoRouter router;

    setUp(() {
      authenticationBloc = _MockAuthenticationBloc();
      authenticationState = _MockAuthenticationState();
      appRouterBloc = _MockAppRouterBloc();
      appRouterState = _MockAppRouterState();
      state = _MockGoRouterState();
      router = _MockGoRouter();
      when(() => authenticationBloc.state).thenReturn(
        authenticationState,
      );
      when(() => authenticationState.status).thenReturn(
        AuthenticationStatus.authenticated,
      );
      when(() => appRouterBloc.state).thenReturn(appRouterState);
    });

    AuthenticatedRoute createSubject() => _TestAuthenticatedRoute();

    group('redirect', () {
      Future<String?> redirect(WidgetTester tester) async {
        final child = Container();
        await tester.pumpApp(
          BlocProvider.value(
            value: authenticationBloc,
            child: BlocProvider.value(
              value: appRouterBloc,
              child: child,
            ),
          ),
          router: router,
        );
        final context = tester.element(find.byWidget(child));
        final route = createSubject();
        return route.redirect(context, state);
      }

      testWidgets(
        'returns previousLocation and pushes $LoginRoute '
        'when !isAuthenticated',
        (tester) async {
          const previousLocation = 'previousLocation';
          const matchedLocation = 'matchedLocation';
          final route = LoginRoute(from: matchedLocation);
          final pushLoginRoute = () => router.push<void>(route.location);
          when(() => authenticationState.status).thenReturn(
            AuthenticationStatus.unauthenticated,
          );
          when(() => appRouterState.location).thenReturn(previousLocation);
          when(() => state.matchedLocation).thenReturn(matchedLocation);
          when(pushLoginRoute).thenAnswer((_) async {});
          final location = await redirect(tester);
          await tester.pump();
          expect(location, previousLocation);
          verify(pushLoginRoute).called(1);
        },
      );

      testWidgets(
        'returns null when isAuthenticated',
        (tester) async {
          final location = await redirect(tester);
          expect(location, null);
        },
      );
    });
  });
}
