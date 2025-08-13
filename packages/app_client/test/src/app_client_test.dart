// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app_client/app_client.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:secure_user_id_storage/secure_user_id_storage.dart';

class _MockCookieJar extends Mock implements CookieJar {}

class _MockSecureUserIdStorage extends Mock implements SecureUserIdStorage {}

void main() {
  final baseUrl = Uri.parse('https://example.com');

  final initialState = AuthenticationState(
    baseUrl: baseUrl,
  );

  group(AppClient, () {
    late CookieJar cookieJar;
    late SecureUserIdStorage userIdStorage;

    setUp(() {
      cookieJar = _MockCookieJar();
      userIdStorage = _MockSecureUserIdStorage();
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
        addPlatformConfiguration: addPlatformConfiguration ?? (_, __) {},
        debugPrint: debugPrint,
      );
    }

    test('initial state is $AuthenticationState', () {
      final client = createSubject();
      expect(client.state, initialState);
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

        test('$PrettyDioLogger logPrint calls debugPrint', () {
          String? printed;

          void debugPrint(String? object) {
            printed = object;
          }

          final client = createSubject(
            debugPrint: debugPrint,
          );

          const object = 'object';

          client.http.interceptors.whereType<PrettyDioLogger>().first.logPrint(
            object,
          );

          expect(printed, object);
        });

        test('second is $LoginRedirectInterceptor', () {
          expect(
            addedInterceptors()[1],
            isA<LoginRedirectInterceptor>(),
          );
        });

        test('third is $AuthenticationInterceptor', () {
          expect(
            addedInterceptors()[2],
            isA<AuthenticationInterceptor>(),
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

    group('redirectToLogin', () {
      blocTest<AppClient, AuthenticationState>(
        'emits empty user, ${AuthenticationStatus.unauthenticated} '
        'and $LoginRedirect',
        build: createSubject,
        act: (client) => client.redirectToLogin(),
        expect: () => [
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
              )
              .having(
                (state) => state.redirect,
                'redirect',
                isNot(initialState.redirect),
              ),
        ],
      );
    });

    group('redirectToWeb', () {
      final redirect = WebRedirectPlaceholder();

      blocTest<AppClient, AuthenticationState>(
        'emits $WebRedirect',
        build: createSubject,
        act: (client) => client.redirectToWeb(redirect),
        expect: () => [
          isA<AuthenticationState>().having(
            (state) => state.redirect,
            'redirect',
            redirect,
          ),
        ],
      );
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

    group('authenticate', () {
      final user = UserPlaceholder();
      final write = () => userIdStorage.write(user.id);

      blocTest<AppClient, AuthenticationState>(
        'calls write and emits updated state',
        setUp: () {
          when(write).thenAnswer((_) async {
            return;
          });
        },
        build: createSubject,
        act: (client) => client.authenticate(user),
        expect: () => [
          initialState.copyWith(
            status: AuthenticationStatus.authenticated,
            user: user,
          ),
        ],
        verify: (_) {
          verify(write).called(1);
        },
      );
    });

    group('unauthenticate', () {
      final deleteAll = () => cookieJar.deleteAll();
      final deleteUser = () => userIdStorage.delete();

      blocTest<AppClient, AuthenticationState>(
        'deletes persisted data and emits updated state',
        setUp: () {
          when(deleteAll).thenAnswer((_) async {});
          when(deleteUser).thenAnswer((_) async {
            return;
          });
        },
        build: createSubject,
        act: (client) => client.unauthenticate(),
        expect: () => [
          initialState.copyWith(
            user: User.empty,
            status: AuthenticationStatus.unauthenticated,
          ),
        ],
        verify: (_) {
          verify(deleteAll).called(1);
          verify(deleteUser).called(1);
        },
      );
    });
  });
}
