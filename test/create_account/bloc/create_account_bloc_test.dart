// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/create_account/create_account.dart';
import 'package:hacker_client/external_links/external_links.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class _MockLinkLauncher extends Mock implements LinkLauncher {}

void main() {
  const from = 'from';
  const initialState = CreateAccountState(from: from);

  const username = 'username';
  const password = 'password';

  group(CreateAccountBloc, () {
    late AuthenticationRepository repository;
    late LinkLauncher launcher;

    setUp(() {
      repository = _MockAuthenticationRepository();
      launcher = _MockLinkLauncher();
    });

    CreateAccountBloc buildBloc() {
      return CreateAccountBloc(
        from: from,
        authenticationRepository: repository,
        linkLauncher: launcher,
      );
    }

    test('initial state is $CreateAccountState', () {
      expect(buildBloc().state, initialState);
    });

    group(CreateAccountUsernameChanged, () {
      blocTest(
        'emits username',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CreateAccountUsernameChanged(username),
          );
        },
        expect: () => [
          initialState.copyWith.form(
            username: Username(username),
          ),
        ],
      );
    });

    group(CreateAccountUsernameRestored, () {
      blocTest(
        'emits username',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CreateAccountUsernameRestored(username),
          );
        },
        expect: () => [
          initialState.copyWith.form(
            username: Username(username),
          ),
        ],
      );
    });

    group(CreateAccountPasswordChanged, () {
      blocTest(
        'emits password',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CreateAccountPasswordChanged(password),
          );
        },
        expect: () => [
          initialState.copyWith.form(
            password: Password(password),
          ),
        ],
      );
    });

    group(CreateAccountPasswordVisibilityToggled, () {
      blocTest(
        'emits toggled obscurePassword',
        build: buildBloc,
        act: (bloc) {
          bloc
            ..add(
              CreateAccountPasswordVisibilityToggled(),
            )
            ..add(
              CreateAccountPasswordVisibilityToggled(),
            );
        },
        expect: () => [
          initialState.copyWith.form(
            obscurePassword: !initialState.form.obscurePassword,
          ),
          initialState.copyWith.form(
            obscurePassword: initialState.form.obscurePassword,
          ),
        ],
      );
    });

    group(CreateAccountTermsPressed, () {
      final launch = () => launcher.launch(hackerNewsTermsLink);

      blocTest(
        'calls launch',
        setUp: () {
          when(launch).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CreateAccountTermsPressed(),
          );
        },
        verify: (_) {
          verify(launch).called(1);
        },
      );
    });

    group(CreateAccountPrivacyPolicyPressed, () {
      final launch = () => launcher.launch(hackerNewsPrivacyPolicyLink);

      blocTest(
        'calls launch',
        setUp: () {
          when(launch).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CreateAccountPrivacyPolicyPressed(),
          );
        },
        verify: (_) {
          verify(launch).called(1);
        },
      );
    });

    group(CreateAccountSubmitted, () {
      final request = () => repository.createAccount(
        username: username,
        password: password,
      );

      final state = initialState.copyWith.form(
        username: Username(username),
        password: Password(password),
      );

      blocTest(
        'emits [invalid] when !form.isValid',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CreateAccountSubmitted(),
          );
        },
        expect: () => [
          initialState.copyWith.form(
            status: CreateAccountStatus.invalid,
          ),
        ],
      );

      blocTest(
        'emits [loading, success] when request succeeds',
        setUp: () {
          when(request).thenAnswer((_) async {});
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CreateAccountSubmitted(),
          );
        },
        expect: () => [
          state.copyWith.form(
            status: CreateAccountStatus.loading,
          ),
          state.copyWith.form(
            status: CreateAccountStatus.success,
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );

      blocTest(
        'emits [loading, failure] when request throws',
        setUp: () {
          when(request).thenThrow(Exception('oops'));
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CreateAccountSubmitted(),
          );
        },
        expect: () => [
          state.copyWith.form(
            status: CreateAccountStatus.loading,
          ),
          state.copyWith.form(
            status: CreateAccountStatus.failure,
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );
    });
  });
}
