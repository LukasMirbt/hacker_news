// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_repository/authentication_repository.dart'
    hide AuthenticationState;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';
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
    status: AuthenticationStatus.unauthenticated,
  );

  final redirect = WebRedirectPlaceholder();

  group(WebRedirectListener, () {
    late AuthenticationBloc authenticationBloc;
    late GoRouter router;
    late GoRouterState goRouterState;

    setUp(() {
      authenticationBloc = _MockAuthenticationBloc();
      router = _MockGoRouter();
      goRouterState = _MockGoRouterState();
      when(() => authenticationBloc.state).thenReturn(initialState);
      when(() => router.state).thenReturn(goRouterState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: authenticationBloc,
        child: Nested(
          children: [
            WebRedirectListener(),
          ],
          child: Container(),
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
        'contains $WebRedirectRoute path', (tester) async {
      when(
        () => goRouterState.matchedLocation,
      ).thenReturn(
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
      await tester.pumpApp(
        buildSubject(),
        router: router,
      );
      verifyNever(pushAnyRoute);
    });

    testWidgets('pushes $WebRedirectRoute when redirect '
        'is $WebRedirect and matchedLocation does not contain '
        '$WebRedirectRoute path', (tester) async {
      final route = WebRedirectRoute(url: redirect.urlString);
      final pushWebRedirectRoute = () => router.push<void>(route.location);
      when(pushWebRedirectRoute).thenAnswer((_) async {});
      when(() => goRouterState.matchedLocation).thenReturn('matchedLocation');
      whenListen(
        authenticationBloc,
        initialState: initialState,
        Stream.value(
          initialState.copyWith(
            redirect: redirect,
          ),
        ),
      );
      await tester.pumpApp(
        buildSubject(),
        router: router,
      );
      verify(pushWebRedirectRoute).called(1);
    });
  });
}
