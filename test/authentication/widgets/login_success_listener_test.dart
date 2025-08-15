// ignore_for_file: prefer_const_constructors

import 'package:authentication_repository/authentication_repository.dart'
    hide AuthenticationState;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/login_loading/login_loading.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class _MockAppRouter extends Mock implements AppRouter {}

void main() {
  final initialState = AuthenticationState(
    user: User.empty,
    loginRedirect: LoginRedirect.initial,
    webRedirect: WebRedirect.empty,
    status: AuthenticationStatus.unauthenticated,
  );

  const from = 'from';

  group(LoginSuccessListener, () {
    late AuthenticationBloc authenticationBloc;
    late AppRouter router;

    setUp(() {
      authenticationBloc = _MockAuthenticationBloc();
      router = _MockAppRouter();
      when(() => router.from).thenReturn(from);
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: BlocProvider.value(
          value: authenticationBloc,
          child: Nested(
            children: [
              LoginSuccessListener(),
            ],
            child: Container(),
          ),
        ),
      );
    }

    testWidgets('navigates to $LoginLoadingRoute when status changes '
        'from ${AuthenticationStatus.unauthenticated} '
        'to ${AuthenticationStatus.authenticated}', (tester) async {
      whenListen(
        authenticationBloc,
        initialState: initialState,
        Stream.value(
          initialState.copyWith(
            status: AuthenticationStatus.authenticated,
          ),
        ),
      );
      await tester.pumpApp(buildSubject());
      verify(
        () => router.go(
          LoginLoadingRoute(from: from),
        ),
      ).called(1);
    });
  });
}
