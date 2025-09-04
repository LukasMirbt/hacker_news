// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'package:app_client/app_client.dart';
import 'package:authentication_parser/authentication_parser.dart'
    hide AuthenticationStatus;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:secure_user_id_storage/secure_user_id_storage.dart';

class _MockCookieJar extends Mock implements CookieJar {}

class _MockSecureUserIdStorage extends Mock implements SecureUserIdStorage {}

class _MockAuthenticationStatusService extends Mock
    implements AuthenticationStatusService {}

class _MockPrettyDioLogger extends Mock implements PrettyDioLogger {}

class _MockHtmlInterceptor extends Mock implements HtmlInterceptor {}

class _MockLoginRedirectInterceptor extends Mock
    implements LoginRedirectInterceptor {}

class _MockWebRedirectInterceptor extends Mock
    implements WebRedirectInterceptor {}

void main() {
  final baseUrl = Uri.parse('https://example.com');

  final initialState = AuthenticationState.initial(
    baseUrl: baseUrl,
  );

  group(AppClient, () {
    late CookieJar cookieJar;
    late SecureUserIdStorage userIdStorage;
    late AuthenticationStatusService authenticationStatusService;
    late PrettyDioLogger loggingInterceptor;
    late HtmlInterceptor htmlInterceptor;
    late LoginRedirectInterceptor loginRedirectInterceptor;
    late WebRedirectInterceptor webRedirectInterceptor;

    setUp(() {
      cookieJar = _MockCookieJar();
      userIdStorage = _MockSecureUserIdStorage();
      authenticationStatusService = _MockAuthenticationStatusService();
      loggingInterceptor = _MockPrettyDioLogger();
      htmlInterceptor = _MockHtmlInterceptor();
      loginRedirectInterceptor = _MockLoginRedirectInterceptor();
      webRedirectInterceptor = _MockWebRedirectInterceptor();
      when(() => htmlInterceptor.stream).thenAnswer((_) => Stream.empty());
      when(() => loginRedirectInterceptor.redirect).thenAnswer(
        (_) => Stream.empty(),
      );
      when(() => webRedirectInterceptor.redirect).thenAnswer(
        (_) => Stream.empty(),
      );
      when(() => authenticationStatusService.status).thenAnswer(
        (_) => Stream.empty(),
      );
    });

    AppClient createSubject({
      void Function(Dio, CookieJar)? addPlatformConfiguration,
      void Function(String?)? debugPrint,
      AuthenticationStatus? initialStatus,
    }) {
      return AppClient(
        baseUrl: baseUrl,
        cookieJar: cookieJar,
        userIdStorage: userIdStorage,
        authenticationStatusService: authenticationStatusService,
        loggingInterceptor: loggingInterceptor,
        htmlInterceptor: htmlInterceptor,
        loginRedirectInterceptor: loginRedirectInterceptor,
        webRedirectInterceptor: webRedirectInterceptor,
        addPlatformConfiguration: addPlatformConfiguration ?? (_, __) {},
      );
    }

    test('initial state is $AuthenticationState', () {
      final client = createSubject();
      expect(client.state, initialState);
    });

    group('constructor', () {
      test('calls authenticationStatusService.update '
          'when html stream emits value', () async {
        const html = 'html';
        when(() => htmlInterceptor.stream).thenAnswer(
          (_) => Stream.value(html),
        );
        createSubject();
        await Future<void>.delayed(Duration.zero);
        verify(() => authenticationStatusService.update(html)).called(1);
      });

      test('emits updated state when login redirect '
          'stream emits value', () {
        final redirect = LoginRedirect();
        when(() => loginRedirectInterceptor.redirect).thenAnswer(
          (_) => Stream.value(redirect),
        );
        final client = createSubject();
        expect(
          client.stream,
          emits(
            isA<AuthenticationState>()
                .having(
                  (state) => state.loginRedirect,
                  'redirect',
                  redirect,
                )
                .having(
                  (state) => state.user,
                  'user',
                  User.empty,
                )
                .having(
                  (state) => state.status,
                  'status',
                  AuthenticationStatus.unauthenticated,
                ),
          ),
        );
      });

      test('emits $WebRedirect when web redirect '
          'stream emits value', () {
        final redirect = WebRedirectPlaceholder();
        when(() => webRedirectInterceptor.redirect).thenAnswer(
          (_) => Stream.value(redirect),
        );
        final client = createSubject();
        expect(
          client.stream,
          emits(
            isA<AuthenticationState>().having(
              (state) => state.webRedirect,
              'redirect',
              redirect,
            ),
          ),
        );
      });

      test('writes userId and emits updated state '
          'when status stream emits $Authenticated', () async {
        final data = UserDataPlaceholder();
        final writeUserId = () => userIdStorage.write(data.id);
        when(() => authenticationStatusService.status).thenAnswer(
          (_) => Stream.value(
            Authenticated(data),
          ),
        );
        when(writeUserId).thenAnswer((_) async {});
        final client = createSubject();
        await expectLater(
          client.stream,
          emits(
            isA<AuthenticationState>()
                .having(
                  (state) => state.user,
                  'user',
                  User.fromData(data),
                )
                .having(
                  (state) => state.status,
                  'status',
                  AuthenticationStatus.authenticated,
                ),
          ),
        );
        verify(writeUserId).called(1);
      });

      test('deletes persisted data and emits updated state '
          'when status stream emits $Unauthenticated', () async {
        final deleteAll = () => cookieJar.deleteAll();
        final deleteUserId = () => userIdStorage.delete();
        when(() => authenticationStatusService.status).thenAnswer(
          (_) => Stream.value(Unauthenticated()),
        );
        when(deleteAll).thenAnswer((_) async {});
        when(deleteUserId).thenAnswer((_) async {});
        final client = createSubject();
        await expectLater(
          client.stream,
          emits(
            isA<AuthenticationState>()
                .having(
                  (state) => state.user,
                  'user',
                  User.empty,
                )
                .having(
                  (state) => state.status,
                  'status',
                  AuthenticationStatus.unauthenticated,
                ),
          ),
        );
      });

      test('returns when status stream emits $Unknown', () async {
        when(() => authenticationStatusService.status).thenAnswer(
          (_) => Stream.value(Unknown()),
        );
        final client = createSubject();
        expect(client.stream, neverEmits(anything));
        await Future<void>.delayed(Duration.zero);
        await client.close();
      });
    });

    group('start', () {
      final cookies = [
        Cookie('user', 'value'),
      ];

      const userId = 'userId';

      final loadForRequest = () => cookieJar.loadForRequest(baseUrl);
      final readUserId = () => userIdStorage.read();

      blocTest<AppClient, AuthenticationState>(
        'emits correct state when hasUserCookie '
        'and userId is non-null',
        setUp: () {
          when(loadForRequest).thenAnswer((_) async => cookies);
          when(readUserId).thenReturn(userId);
        },
        build: createSubject,
        act: (client) => client.start(),
        expect: () => [
          initialState.copyWith(
            status: AuthenticationStatus.authenticated,
            user: User.initial(userId),
          ),
        ],
        verify: (_) {
          verify(loadForRequest).called(1);
          verify(readUserId).called(1);
        },
      );

      blocTest<AppClient, AuthenticationState>(
        'emits correct state when !hasUserCookie '
        'and userId is non-null',
        setUp: () {
          when(loadForRequest).thenAnswer((_) async => <Cookie>[]);
          when(readUserId).thenReturn(userId);
        },
        build: createSubject,
        act: (client) => client.start(),
        expect: () => [
          initialState.copyWith(
            status: AuthenticationStatus.unauthenticated,
          ),
        ],
        verify: (_) {
          verify(loadForRequest).called(1);
          verify(readUserId).called(1);
        },
      );

      blocTest<AppClient, AuthenticationState>(
        'emits correct state when hasUserCookie '
        'and userId is null',
        setUp: () {
          when(loadForRequest).thenAnswer((_) async => cookies);
        },
        build: createSubject,
        act: (client) => client.start(),
        expect: () => [
          initialState.copyWith(
            status: AuthenticationStatus.unauthenticated,
          ),
        ],
        verify: (_) {
          verify(loadForRequest).called(1);
          verify(readUserId).called(1);
        },
      );
    });

    group('http', () {
      group('options', () {
        group('connectTimeout', () {
          test('is correct $Duration', () {
            final client = createSubject();
            expect(
              client.http.options.connectTimeout,
              Duration(milliseconds: 10000),
            );
          });
        });

        group('receiveTimeout', () {
          test('is correct $Duration', () {
            final client = createSubject();
            expect(
              client.http.options.receiveTimeout,
              Duration(milliseconds: 10000),
            );
          });
        });

        group('validateStatus', () {
          test('always returns true', () {
            final client = createSubject();
            expect(client.http.options.validateStatus(200), true);
            expect(client.http.options.validateStatus(300), true);
            expect(client.http.options.validateStatus(400), true);
            expect(client.http.options.validateStatus(500), true);
          });
        });

        group('baseUrl', () {
          test('returns correct string', () {
            final client = createSubject();
            expect(
              client.http.options.baseUrl,
              baseUrl.toString(),
            );
          });
        });
      });

      group('added interceptors', () {
        List<Interceptor> addedInterceptors() {
          final client = createSubject();
          final defaultCount = Dio().interceptors.length;
          return client.http.interceptors.sublist(defaultCount);
        }

        test('first is $PrettyDioLogger', () {
          expect(
            addedInterceptors().first,
            isA<PrettyDioLogger>(),
          );
        });

        test('second is $LoginRedirectInterceptor', () {
          expect(
            addedInterceptors()[1],
            isA<LoginRedirectInterceptor>(),
          );
        });

        test('third is $HtmlInterceptor', () {
          expect(
            addedInterceptors()[2],
            isA<HtmlInterceptor>(),
          );
        });
      });

      group('platform configuration', () {
        test('is added', () {
          final calls = <(Dio, CookieJar)>[];

          final client = createSubject(
            addPlatformConfiguration: (dio, cookieJar) {
              calls.add((dio, cookieJar));
            },
          );

          expect(
            calls,
            contains(
              (client.http, cookieJar),
            ),
          );
        });
      });
    });

    group('cookies', () {
      final cookies = [
        Cookie('name1', 'value1'),
        Cookie('name2', 'value2'),
      ];

      final loadForRequest = () => cookieJar.loadForRequest(baseUrl);

      test('returns cookies', () {
        when(loadForRequest).thenAnswer((_) async => cookies);
        final client = createSubject();
        expect(
          client.cookies(),
          completion(cookies),
        );
        verify(loadForRequest).called(1);
      });
    });

    group('saveCookies', () {
      final cookies = [
        Cookie('name1', 'value1'),
        Cookie('name2', 'value2'),
      ];

      final saveFromResponse = () =>
          cookieJar.saveFromResponse(baseUrl, cookies);

      test('calls cookieJar.saveFromResponse', () async {
        when(saveFromResponse).thenAnswer((_) async {});
        final client = createSubject();
        await client.saveCookies(cookies);
        verify(saveFromResponse).called(1);
      });
    });

    group('updateAuthenticationFromHtml', () {
      const html = 'html';
      final update = () => authenticationStatusService.update(html);

      test('calls authenticationStatusService.update', () {
        final client = createSubject();
        client.updateAuthenticationFromHtml(html);
        verify(update).called(1);
      });
    });

    group('authenticate', () {
      const userId = 'userId';
      final writeUserId = () => userIdStorage.write(userId);

      blocTest<AppClient, AuthenticationState>(
        'writes userId and emits updated state',
        setUp: () {
          when(writeUserId).thenAnswer((_) async {});
        },
        build: createSubject,
        act: (client) => client.authenticate(userId: userId),
        expect: () => [
          initialState.copyWith(
            status: AuthenticationStatus.authenticated,
            user: User.initial(userId),
          ),
        ],
        verify: (_) {
          verify(writeUserId).called(1);
        },
      );
    });
  });
}
