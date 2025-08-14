// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'package:authentication_api/authentication_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAppClient extends Mock implements AppClient {}

class _MockDio extends Mock implements Dio {}

void main() {
  final cookies = [
    Cookie('name', 'value'),
  ];

  group(AuthenticationApi, () {
    late AppClient client;
    late Dio http;

    setUp(() {
      client = _MockAppClient();
      http = _MockDio();
      when(() => client.http).thenReturn(http);
      registerFallbackValue(RedirectValidationOptions());
    });

    AuthenticationApi createSubject() {
      return AuthenticationApi(appClient: client);
    }

    group('stream', () {
      test('returns client.stream', () {
        final stream = Stream<AuthenticationState>.empty();
        when(() => client.stream).thenAnswer((_) => stream);
        final api = createSubject();
        expect(api.stream, stream);
      });
    });

    group('state', () {
      test('returns client.state', () {
        final state = AuthenticationStatePlaceholder();
        when(() => client.state).thenReturn(state);
        final api = createSubject();
        expect(api.state, state);
      });
    });

    group('cookies', () {
      final getCookies = () => client.cookies();

      test('retuns cookies', () async {
        when(getCookies).thenAnswer((_) async => cookies);
        final api = createSubject();
        expect(api.cookies(), completion(cookies));
        verify(getCookies).called(1);
      });
    });

    group('saveCookies', () {
      final saveCookies = () => client.saveCookies(cookies);

      test('calls client.saveCookies', () async {
        when(saveCookies).thenAnswer((_) async {});
        final api = createSubject();
        await api.saveCookies(cookies);
        verify(saveCookies).called(1);
      });
    });

    group('login', () {
      const username = 'username';
      const password = 'password';

      final loginRequest = () => http.post<String>(
        'login',
        options: any(
          named: 'options',
          that: isA<RedirectValidationOptions>().having(
            (options) => options.contentType,
            'contentType',
            Headers.formUrlEncodedContentType,
          ),
        ),
        data: {
          'goto': 'news',
          'acct': username,
          'pw': password,
        },
      );

      final authenticate = () => client.authenticate(
        User.initial(username),
      );

      test('makes login request and calls authenticate', () async {
        when(loginRequest).thenAnswer(
          (_) async => Response<String>(
            requestOptions: RequestOptions(),
          ),
        );
        when(authenticate).thenAnswer((_) async {});
        final api = createSubject();
        await api.login(
          username: username,
          password: password,
        );
        verify(loginRequest).called(1);
        verify(authenticate).called(1);
      });
    });

    group('createAccount', () {
      const username = 'username';
      const password = 'password';

      final loginRequest = () => http.post<String>(
        'login',
        options: any(
          named: 'options',
          that: isA<RedirectValidationOptions>().having(
            (options) => options.contentType,
            'contentType',
            Headers.formUrlEncodedContentType,
          ),
        ),
        data: {
          'goto': 'news',
          'creating': 't',
          'acct': username,
          'pw': password,
        },
      );

      final authenticate = () => client.authenticate(
        User.initial(username),
      );

      test('makes create account request and calls authenticate', () async {
        when(loginRequest).thenAnswer(
          (_) async => Response<String>(
            requestOptions: RequestOptions(),
          ),
        );
        when(authenticate).thenAnswer((_) async {});
        final api = createSubject();
        await api.createAccount(
          username: username,
          password: password,
        );
        verify(loginRequest).called(1);
        verify(authenticate).called(1);
      });
    });

    group('logout', () {
      final user = UserPlaceholder();
      final state = AuthenticationStatePlaceholder(user: user);

      final logoutRequest = () => http.get<void>(user.logoutUrl);
      final unauthenticate = () => client.unauthenticate();

      test('makes logout request and calls unauthenticate', () async {
        when(() => client.state).thenReturn(state);
        when(logoutRequest).thenAnswer(
          (_) async => Response<void>(
            requestOptions: RequestOptions(),
          ),
        );
        when(unauthenticate).thenAnswer((_) async {});
        final api = createSubject();
        await api.logout();
        verify(logoutRequest).called(1);
        verify(unauthenticate).called(1);
      });
    });
  });
}
