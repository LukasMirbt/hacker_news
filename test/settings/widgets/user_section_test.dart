// ignore_for_file: prefer_const_constructors

import 'package:authentication_repository/authentication_repository.dart'
    hide AuthenticationState;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/settings/settings.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

void main() {
  final initialState = AuthenticationState(
    user: UserPlaceholder(),
    redirect: LoginRedirect.initial,
    status: AuthenticationStatus.unauthenticated,
  );

  group(UserSection, () {
    late AuthenticationBloc authenticationBloc;

    setUp(() {
      authenticationBloc = _MockAuthenticationBloc();
      when(() => authenticationBloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: authenticationBloc,
        child: UserSection(),
      );
    }

    testWidgets('renders $UserSectionBody '
        'when isAuthenticated', (tester) async {
      when(() => authenticationBloc.state).thenReturn(
        initialState.copyWith(
          status: AuthenticationStatus.authenticated,
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(UserSectionBody), findsOneWidget);
    });

    testWidgets('does not render $UserSectionBody '
        'when !isAuthenticated', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(UserSectionBody), findsNothing);
    });
  });
}
