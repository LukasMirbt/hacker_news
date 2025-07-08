// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/login/login.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  const from = 'from';
  const initialState = LoginState(from: from);

  const username = 'username';
  const password = 'password';

  group(LoginBloc, () {
    late AuthenticationRepository repository;

    setUp(() {
      repository = _MockAuthenticationRepository();
    });

    LoginBloc buildBloc() {
      return LoginBloc(
        from: from,
        authenticationRepository: repository,
      );
    }

    test('initial state is $LoginState', () {
      expect(buildBloc().state, initialState);
    });

    group(LoginUsernameChanged, () {
      blocTest<LoginBloc, LoginState>(
        'emits username',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            LoginUsernameChanged(username),
          );
        },
        expect: () => [
          initialState.copyWith(
            username: username,
          ),
        ],
      );
    });

    group(LoginPasswordChanged, () {
      blocTest<LoginBloc, LoginState>(
        'emits password',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            LoginPasswordChanged(password),
          );
        },
        expect: () => [
          initialState.copyWith(
            password: password,
          ),
        ],
      );
    });

    group(LoginPasswordVisibilityToggled, () {
      blocTest<LoginBloc, LoginState>(
        'emits toggled obscurePassword',
        build: buildBloc,
        act: (bloc) {
          bloc
            ..add(
              LoginPasswordVisibilityToggled(),
            )
            ..add(
              LoginPasswordVisibilityToggled(),
            );
        },
        expect: () => [
          initialState.copyWith(
            obscurePassword: !initialState.obscurePassword,
          ),
          initialState.copyWith(
            obscurePassword: initialState.obscurePassword,
          ),
        ],
      );
    });

    group(LoginSubmitted, () {
      final request = () => repository.login(
        username: username,
        password: password,
      );

      final state = initialState.copyWith(
        username: username,
        password: password,
      );

      blocTest<LoginBloc, LoginState>(
        'emits [loading, success] when request succeeds',
        setUp: () {
          when(request).thenAnswer((_) async {});
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            LoginSubmitted(),
          );
        },
        expect: () => [
          state.copyWith(
            status: LoginStatus.loading,
          ),
          state.copyWith(
            status: LoginStatus.success,
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );

      blocTest<LoginBloc, LoginState>(
        'emits [loading, failure] when request throws',
        setUp: () {
          when(request).thenThrow(Exception('oops'));
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            LoginSubmitted(),
          );
        },
        expect: () => [
          state.copyWith(
            status: LoginStatus.loading,
          ),
          state.copyWith(
            status: LoginStatus.failure,
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );
    });
  });
}
