// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_repository/authentication_repository.dart'
    as authentication_repository;
import 'package:authentication_repository/authentication_repository.dart'
    hide AuthenticationState;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class _MockUser extends Mock implements User {}

void main() {
  final user = _MockUser();
  final redirect = LoginRedirect();
  const status = AuthenticationStatus.unauthenticated;

  final initialState = AuthenticationState(
    user: user,
    redirect: redirect,
    status: status,
  );

  group(AuthenticationBloc, () {
    late AuthenticationRepository authenticationRepository;

    setUp(() {
      authenticationRepository = _MockAuthenticationRepository();
      when(() => authenticationRepository.state).thenReturn(
        authentication_repository.AuthenticationStatePlaceholder(
          user: user,
          redirect: redirect,
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
            redirect: WebRedirectPlaceholder(),
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
            redirect: updatedRepositoryState.redirect,
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
          when(logout).thenAnswer((_) async {});
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
