// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_repository/authentication_repository.dart'
    hide AuthenticationState;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class _MockAppRouter extends Mock implements AppRouter {}

class _MockGoRouteData extends Mock implements GoRouteData {}

void main() {
  const initialState = AuthenticationState(
    user: User.empty,
    redirect: LoginRedirect.initial,
    status: AuthenticationStatus.unauthenticated,
  );

  final redirect = WebRedirectPlaceholder();

  group(WebRedirectListener, () {
    late AuthenticationBloc authenticationBloc;
    late AppRouter router;

    setUp(() {
      authenticationBloc = _MockAuthenticationBloc();
      router = _MockAppRouter();
      registerFallbackValue(_MockGoRouteData());
      when(() => authenticationBloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: BlocProvider.value(
          value: authenticationBloc,
          child: Nested(
            children: [
              WebRedirectListener(),
            ],
            child: Container(),
          ),
        ),
      );
    }

    final pushAnyRoute = () => router.push<void>(any());

    testWidgets('returns when redirect is not $WebRedirect', (tester) async {
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
        'is $WebRedirectRoute path', (tester) async {
      when(() => router.matchedLocation).thenReturn(
        WebRedirectRoute.config.path,
      );
      whenListen(
        authenticationBloc,
        initialState: initialState,
        Stream.value(
          initialState.copyWith(
            redirect: redirect,
          ),
        ),
      );
      await tester.pumpApp(buildSubject());
      verifyNever(pushAnyRoute);
    });

    testWidgets('pushes $WebRedirectRoute when redirect '
        'is $WebRedirect and matchedLocation is not '
        '$WebRedirectRoute path', (tester) async {
      final pushWebRedirectRoute = () => router.push(
        WebRedirectRoute(
          url: redirect.urlString,
        ),
      );
      when(pushWebRedirectRoute).thenAnswer((_) async => null);
      when(() => router.matchedLocation).thenReturn('matchedLocation');
      whenListen(
        authenticationBloc,
        initialState: initialState,
        Stream.value(
          initialState.copyWith(
            redirect: redirect,
          ),
        ),
      );
      await tester.pumpApp(buildSubject());
      verify(pushWebRedirectRoute).called(1);
    });
  });
}
