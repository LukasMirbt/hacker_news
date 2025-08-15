// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthenticationApi extends Mock implements AuthenticationApi {}

void main() {
  final cookies = [
    Cookie('name', 'value'),
  ];

  group(AuthenticationRepository, () {
    late AuthenticationApi api;

    setUp(() {
      api = _MockAuthenticationApi();
    });

    AuthenticationRepository createSubject() {
      return AuthenticationRepository(authenticationApi: api);
    }

    group('stream', () {
      test('returns api.stream', () {
        final stream = Stream<AuthenticationState>.empty();
        when(() => api.stream).thenAnswer((_) => stream);
        final repository = createSubject();
        expect(repository.stream, stream);
      });
    });

    group('state', () {
      test('returns api.state', () {
        final state = AuthenticationStatePlaceholder();
        when(() => api.state).thenReturn(state);
        final repository = createSubject();
        expect(repository.state, state);
      });
    });

    group('cookies', () {
      final getCookies = () => api.cookies();

      test('retuns cookies', () async {
        when(getCookies).thenAnswer((_) async => cookies);
        final repository = createSubject();
        expect(repository.cookies(), completion(cookies));
        verify(getCookies).called(1);
      });
    });

    group('saveCookies', () {
      final saveCookies = () => api.saveCookies(cookies);

      test('calls api.saveCookies', () async {
        when(saveCookies).thenAnswer((_) async {});
        final repository = createSubject();
        await repository.saveCookies(cookies);
        verify(saveCookies).called(1);
      });
    });

    group('updateAuthenticationFromHtml', () {
      const html = 'html';
      final updateAuthenticationFromHtml = () =>
          api.updateAuthenticationFromHtml(html);

      test('calls api.updateAuthenticationFromHtml', () {
        when(updateAuthenticationFromHtml).thenReturn(null);
        final repository = createSubject();
        repository.updateAuthenticationFromHtml(html);
        verify(updateAuthenticationFromHtml).called(1);
      });
    });

    group('login', () {
      const username = 'username';
      const password = 'password';

      final login = () => api.login(
        username: username,
        password: password,
      );

      test('calls api.login', () async {
        when(login).thenAnswer((_) async {});
        final repository = createSubject();
        await repository.login(
          username: username,
          password: password,
        );
        verify(login).called(1);
      });
    });

    group('createAccount', () {
      const username = 'username';
      const password = 'password';

      final createAccount = () => api.createAccount(
        username: username,
        password: password,
      );

      test('calls api.createAccount', () async {
        when(createAccount).thenAnswer((_) async {});
        final repository = createSubject();
        await repository.createAccount(
          username: username,
          password: password,
        );
        verify(createAccount).called(1);
      });
    });

    group('logout', () {
      final logout = () => api.logout();

      test('calls api.logout', () async {
        when(logout).thenAnswer((_) async {});
        final repository = createSubject();
        await repository.logout();
        verify(logout).called(1);
      });
    });
  });
}
