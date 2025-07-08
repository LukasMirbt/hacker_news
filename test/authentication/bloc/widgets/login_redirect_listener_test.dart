// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_repository/authentication_repository.dart'
    hide AuthenticationState;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/login/login.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nested/nested.dart';

import '../../../app/pump_app.dart';

class _MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class _MockGoRouter extends Mock implements GoRouter {}

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  const initialState = AuthenticationState(
    user: User.empty,
    redirect: LoginRedirect.initial,
    status: AuthenticationStatus.authenticated,
  );

  final unauthenticatedState = initialState.copyWith(
    status: AuthenticationStatus.unauthenticated,
  );

  group(LoginRedirectListener, () {
    late AuthenticationBloc authenticationBloc;
    late GoRouterState goRouterState;
    late GoRouter router;

    setUp(() {
      authenticationBloc = _MockAuthenticationBloc();
      goRouterState = _MockGoRouterState();
      router = _MockGoRouter();
      when(() => authenticationBloc.state).thenReturn(initialState);
      when(() => router.state).thenReturn(goRouterState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: authenticationBloc,
        child: Nested(
          children: [
            LoginRedirectListener(),
          ],
          child: Container(),
        ),
      );
    }

    final pushAnyRoute = () => router.push<void>(any());

    testWidgets('returns when redirect is not $LoginRedirect', (tester) async {
      whenListen(
        authenticationBloc,
        initialState: initialState,
        Stream.value(
          initialState.copyWith(
            redirect: WebRedirectPlaceholder(),
          ),
        ),
      );
      await tester.pumpApp(buildSubject());
      verifyNever(pushAnyRoute);
    });

    testWidgets('returns when isAuthenticated', (tester) async {
      whenListen(
        authenticationBloc,
        initialState: initialState,
        Stream.value(
          initialState.copyWith(
            redirect: LoginRedirect(),
          ),
        ),
      );
      await tester.pumpApp(buildSubject());
      verifyNever(pushAnyRoute);
    });

    testWidgets('returns when matchedLocation '
        'contains $LoginRoute path', (tester) async {
      when(() => goRouterState.matchedLocation).thenReturn(
        LoginRoute.config.path,
      );
      whenListen(
        authenticationBloc,
        initialState: unauthenticatedState,
        Stream.value(
          unauthenticatedState.copyWith(
            redirect: LoginRedirect(),
          ),
        ),
      );
      await tester.pumpApp(
        buildSubject(),
        router: router,
      );
      verifyNever(pushAnyRoute);
    });

    testWidgets('pushes $LoginRoute when redirect is $LoginRedirect '
        'and !isAuthenticated and matchedLocation does not contain '
        '$LoginRoute path', (tester) async {
      const matchedLocation = 'matchedLocation';
      const loginRoute = LoginRoute(from: matchedLocation);
      final pushLoginRoute = () => router.push<void>(loginRoute.location);
      when(() => goRouterState.matchedLocation).thenReturn(matchedLocation);
      when(pushLoginRoute).thenAnswer((_) async {});
      whenListen(
        authenticationBloc,
        initialState: unauthenticatedState,
        Stream.value(
          unauthenticatedState.copyWith(
            redirect: LoginRedirect(),
          ),
        ),
      );
      await tester.pumpApp(
        buildSubject(),
        router: router,
      );
      verify(pushLoginRoute).called(1);
    });
  });
}
