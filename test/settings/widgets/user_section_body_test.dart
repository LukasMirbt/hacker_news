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
  final user = UserPlaceholder();

  final initialState = AuthenticationState(
    user: user,
    loginRedirect: LoginRedirect.initial,
    webRedirect: WebRedirect.empty,
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
        child: UserSectionBody(),
      );
    }

    testWidgets('renders user.id', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.text(initialState.user.id), findsOneWidget);
    });

    testWidgets('renders $LogoutButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(LogoutButton), findsOneWidget);
    });
  });
}
