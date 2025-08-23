// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/authentication/authentication.dart';
import 'package:authentication_repository/authentication_repository.dart'
    as authentication_repository;
import 'package:authentication_repository/authentication_repository.dart'
    hide AuthenticationState;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class _MockAuthenticationState extends Mock
    implements authentication_repository.AuthenticationState {}

class _MockUser extends Mock implements User {}

void main() {
  final user = _MockUser();
  final loginRedirect = LoginRedirect();
  final webRedirect = WebRedirectPlaceholder();
  const status = AuthenticationStatus.unauthenticated;

  final initialState = AuthenticationState(
    user: user,
    loginRedirect: loginRedirect,
    webRedirect: webRedirect,
    status: status,
  );

  group(AuthenticationBloc, () {
    late AuthenticationRepository authenticationRepository;
    late authentication_repository.AuthenticationState repositoryState;

    setUp(() {
      authenticationRepository = _MockAuthenticationRepository();
      repositoryState = _MockAuthenticationState();
      when(() => repositoryState.user).thenReturn(user);
      when(() => repositoryState.loginRedirect).thenReturn(loginRedirect);
      when(() => repositoryState.webRedirect).thenReturn(webRedirect);
      when(() => repositoryState.status).thenReturn(status);
      when(() => authenticationRepository.state).thenReturn(
        authentication_repository.AuthenticationStatePlaceholder(
          user: user,
          loginRedirect: loginRedirect,
          webRedirect: webRedirect,
          status: status,
        ),
      );
    });

    AuthenticationBloc buildBloc() {
      return AuthenticationBloc(
        authenticationRepository: authenticationRepository,
      );
    }

    test('initial state is $AuthenticationState', () {
      expect(buildBloc().state, initialState);
    });

    group(AuthenticationSubscriptionRequested, () {
      final updatedRepositoryState =
          authentication_repository.AuthenticationStatePlaceholder(
            user: _MockUser(),
            loginRedirect: LoginRedirect(),
            webRedirect: WebRedirectPlaceholder(),
            status: AuthenticationStatus.authenticated,
          );

      blocTest<AuthenticationBloc, AuthenticationState>(
        'emits updated values when repository stream emits new state',
        setUp: () {
          when(() => authenticationRepository.stream).thenAnswer(
            (_) => Stream.value(updatedRepositoryState),
          );
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AuthenticationSubscriptionRequested(),
          );
        },
        expect: () => [
          initialState.copyWith(
            user: updatedRepositoryState.user,
            loginRedirect: updatedRepositoryState.loginRedirect,
            webRedirect: updatedRepositoryState.webRedirect,
            status: updatedRepositoryState.status,
          ),
        ],
      );
    });

    group(AuthenticationLogoutPressed, () {
      final logout = () => authenticationRepository.logout();

      blocTest<AuthenticationBloc, AuthenticationState>(
        'emits [loading, success] when logout succeeds',
        setUp: () {
          when(logout).thenAnswer((_) async {
            return;
          });
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AuthenticationLogoutPressed(),
          );
        },
        expect: () => [
          initialState.copyWith(
            logoutStatus: LogoutStatus.loading,
          ),
          initialState.copyWith(
            logoutStatus: LogoutStatus.success,
          ),
        ],
        verify: (_) {
          verify(logout).called(1);
        },
      );

      blocTest<AuthenticationBloc, AuthenticationState>(
        'emits [loading, failure] when logout fails',
        setUp: () {
          when(logout).thenThrow(Exception());
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AuthenticationLogoutPressed(),
          );
        },
        expect: () => [
          initialState.copyWith(
            logoutStatus: LogoutStatus.loading,
          ),
          initialState.copyWith(
            logoutStatus: LogoutStatus.failure,
          ),
        ],
        verify: (_) {
          verify(logout).called(1);
        },
      );
    });
  });
}
