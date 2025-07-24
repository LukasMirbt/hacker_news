// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: prefer_const_constructors

import 'package:authentication_repository/authentication_repository.dart'
    hide AuthenticationState;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/login/login.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import '../../../app/pump_app.dart';

class _MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class _MockAppRouter extends Mock implements AppRouter {}

class _MockAppAbsoluteRoute extends Mock implements AppAbsoluteRoute {}

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
    late AppRouter router;

    setUp(() {
      authenticationBloc = _MockAuthenticationBloc();
      router = _MockAppRouter();
      when(() => authenticationBloc.state).thenReturn(initialState);
      registerFallbackValue(_MockAppAbsoluteRoute());
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: BlocProvider.value(
          value: authenticationBloc,
          child: Nested(
            children: [
              LoginRedirectListener(),
            ],
            child: Container(),
          ),
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
        'is $LoginRoute path', (tester) async {
      when(() => router.matchedLocation).thenReturn(
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
      await tester.pumpApp(buildSubject());
      verifyNever(pushAnyRoute);
    });

    testWidgets('pushes $LoginRoute when redirect is $LoginRedirect '
        'and !isAuthenticated and matchedLocation is not '
        '$LoginRoute path', (tester) async {
      const matchedLocation = 'matchedLocation';
      final pushLoginRoute = () => router.push(
        LoginRoute(from: matchedLocation),
      );
      when(() => router.matchedLocation).thenReturn(matchedLocation);
      when(pushLoginRoute).thenAnswer((_) async => null);
      whenListen(
        authenticationBloc,
        initialState: unauthenticatedState,
        Stream.value(
          unauthenticatedState.copyWith(
            redirect: LoginRedirect(),
          ),
        ),
      );
      await tester.pumpApp(buildSubject());
      verify(pushLoginRoute).called(1);
    });
  });
}
