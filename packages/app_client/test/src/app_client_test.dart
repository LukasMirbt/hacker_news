// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app_client/app_client.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class _MockCookieJar extends Mock implements CookieJar {}

class _MockUser extends Mock implements User {}

void main() {
  final baseUrl = Uri.parse('https://example.com');

  final initialState = AuthenticationState(
    baseUrl: baseUrl,
  );

  group(AppClient, () {
    late CookieJar cookieJar;

    setUp(() {
      cookieJar = _MockCookieJar();
    });

    AppClient createSubject({
      void Function(Dio, CookieJar)? addPlatformConfiguration,
      void Function(String?)? debugPrint,
      AuthenticationStatus? initialStatus,
    }) {
      return AppClient(
        baseUrl: baseUrl,
        cookieJar: cookieJar,
        addPlatformConfiguration: addPlatformConfiguration ?? (_, __) {},
        debugPrint: debugPrint,
      );
    }

    test('initial state is $AuthenticationState', () {
      final client = createSubject();
      expect(client.state, initialState);
    });

    group('start', () {
      final loadForRequest = () => cookieJar.loadForRequest(baseUrl);

      final cookies = [
        Cookie('user', 'value'),
      ];

      blocTest<AppClient, AuthenticationState>(
        'emits [authenticated] when cookieJar '
        'contains user cookie',
        setUp: () {
          when(loadForRequest).thenAnswer((_) async => cookies);
        },
        build: createSubject,
        act: (client) => client.start(),
        expect: () => [
          initialState.copyWith(
            status: AuthenticationStatus.authenticated,
          ),
        ],
        verify: (_) => verify(loadForRequest).called(1),
      );

      blocTest<AppClient, AuthenticationState>(
        'emits [unauthenticated] when cookieJar '
        'does not contain user cookie',
        setUp: () {
          when(loadForRequest).thenAnswer((_) async => []);
        },
        build: createSubject,
        act: (client) => client.start(),
        expect: () => [
          initialState.copyWith(
            status: AuthenticationStatus.unauthenticated,
          ),
        ],
        verify: (_) => verify(loadForRequest).called(1),
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

        test('second is $RedirectInterceptor', () {
          expect(
            addedInterceptors()[1],
            isA<RedirectInterceptor>(),
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
      final url = Uri.parse('https://example.com');

      blocTest<AppClient, AuthenticationState>(
        'emits $WebRedirect',
        build: createSubject,
        act: (client) => client.redirectToWeb(url),
        expect: () => [
          isA<AuthenticationState>().having(
            (state) => state.redirect,
            'redirect',
            isA<WebRedirect>(),
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
      final user = _MockUser();

      blocTest<AppClient, AuthenticationState>(
        'emits user and ${AuthenticationStatus.authenticated}',
        build: createSubject,
        act: (client) => client.authenticate(user),
        expect: () => [
          initialState.copyWith(
            user: user,
            status: AuthenticationStatus.authenticated,
          ),
        ],
      );
    });

    group('unauthenticate', () {
      final deleteAll = () => cookieJar.deleteAll();

      blocTest<AppClient, AuthenticationState>(
        'calls cookieJar.deleteAll, emits empty user '
        'and ${AuthenticationStatus.unauthenticated}',
        setUp: () {
          when(deleteAll).thenAnswer((_) async {});
        },
        build: createSubject,
        act: (client) => client.unauthenticate(),
        expect: () => [
          initialState.copyWith(
            user: User.empty,
            status: AuthenticationStatus.unauthenticated,
          ),
        ],
        verify: (_) => verify(deleteAll).called(1),
      );
    });
  });
}
