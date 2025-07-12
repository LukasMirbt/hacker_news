// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: inference_failure_on_collection_literal

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/external_links/external_links.dart';
import 'package:hacker_client/login/login.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class _MockLinkLauncher extends Mock implements LinkLauncher {}

void main() {
  const from = 'from';
  const initialState = LoginState(from: from);

  const username = 'username';
  const password = 'password';

  group(LoginBloc, () {
    late AuthenticationRepository repository;
    late LinkLauncher launcher;

    setUp(() {
      repository = _MockAuthenticationRepository();
      launcher = _MockLinkLauncher();
    });

    LoginBloc buildBloc() {
      return LoginBloc(
        from: from,
        authenticationRepository: repository,
        linkLauncher: launcher,
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

    group(LoginTermsPressed, () {
      final launch = () => launcher.launch(hackerNewsTermsLink);

      blocTest<LoginBloc, LoginState>(
        'calls launch',
        setUp: () {
          when(launch).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            LoginTermsPressed(),
          );
        },
        verify: (_) {
          verify(launch).called(1);
        },
      );
    });

    group(LoginPrivacyPolicyPressed, () {
      final launch = () => launcher.launch(hackerNewsPrivacyPolicyLink);

      blocTest<LoginBloc, LoginState>(
        'calls launch',
        setUp: () {
          when(launch).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            LoginPrivacyPolicyPressed(),
          );
        },
        verify: (_) {
          verify(launch).called(1);
        },
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
        'returns when !isValid',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            LoginSubmitted(),
          );
        },
        expect: () => [],
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
