// ignore_for_file: prefer_const_constructors

import 'package:authentication_repository/authentication_repository.dart'
    hide AuthenticationState;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/logout_loading/logout_loading.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class _MockAppRouter extends Mock implements AppRouter {}

void main() {
  const initialState = AuthenticationState(
    user: User.empty,
    redirect: LoginRedirect.initial,
    status: AuthenticationStatus.authenticated,
  );

  group(LogoutListener, () {
    late AuthenticationBloc authenticationBloc;
    late AppRouter router;

    setUp(() {
      authenticationBloc = _MockAuthenticationBloc();
      router = _MockAppRouter();
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: BlocProvider.value(
          value: authenticationBloc,
          child: Nested(
            children: [
              LogoutListener(),
            ],
            child: Container(),
          ),
        ),
      );
    }

    testWidgets('navigates to $LogoutLoadingRoute when status changes '
        'from ${AuthenticationStatus.authenticated} '
        'to ${AuthenticationStatus.unauthenticated}', (tester) async {
      whenListen(
        authenticationBloc,
        initialState: initialState,
        Stream.value(
          initialState.copyWith(
            status: AuthenticationStatus.unauthenticated,
          ),
        ),
      );
      await tester.pumpApp(buildSubject());
      verify(
        () => router.go(
          LogoutLoadingRoute(),
        ),
      ).called(1);
    });
  });
}
