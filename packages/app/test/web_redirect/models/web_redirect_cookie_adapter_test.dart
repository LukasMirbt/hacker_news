// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'dart:io' as io;

import 'package:app/web_redirect/web_redirect.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' as web_view;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockCookieManager extends Mock implements web_view.CookieManager {}

void main() {
  group(WebRedirectCookieAdapter, () {
    late web_view.CookieManager cookieManager;

    setUp(() {
      cookieManager = _MockCookieManager();
    });

    WebRedirectCookieAdapter createSubject() {
      return WebRedirectCookieAdapter(
        cookieManager: cookieManager,
      );
    }

    group('setCookie', () {
      final url = Uri.parse('https://example.com');
      final webUri = web_view.WebUri.uri(url);

      test('calls setCookie with correct values '
          'when fields are null', () async {
        const name = 'name';
        const value = 'value';
        final cookie = io.Cookie(name, value);
        final setCookie = () => cookieManager.setCookie(
          url: webUri,
          name: name,
          value: value,
          isSecure: cookie.secure,
          isHttpOnly: cookie.httpOnly,
        );
        when(setCookie).thenAnswer((_) async => true);
        final adapter = createSubject();
        await adapter.setCookie(url: url, cookie: cookie);
        verify(setCookie).called(1);
      });

      test('calls setCookie with correct values '
          'when fields are non-null', () async {
        const name = 'name';
        const value = 'value';
        const path = 'path';
        const domain = 'domain';

        final expires = DateTime(1);
        final expiresDate = expires.millisecondsSinceEpoch;

        const isSecure = true;
        const isHttpOnly = true;
        const sameSite = io.SameSite.lax;

        final cookie = io.Cookie(name, value)
          ..path = path
          ..domain = domain
          ..expires = expires
          ..secure = isSecure
          ..httpOnly = isHttpOnly
          ..sameSite = sameSite;

        final setCookie = () => cookieManager.setCookie(
          url: webUri,
          name: name,
          value: value,
          path: path,
          domain: domain,
          expiresDate: expiresDate,
          isSecure: isSecure,
          isHttpOnly: isHttpOnly,
          sameSite: web_view.HTTPCookieSameSitePolicy.LAX,
        );

        when(setCookie).thenAnswer((_) async => true);
        final adapter = createSubject();
        await adapter.setCookie(url: url, cookie: cookie);
        verify(setCookie).called(1);
      });

      test('calls setCookie with correct values '
          'when sameSite is ${io.SameSite.strict}', () async {
        const name = 'name';
        const value = 'value';
        final cookie = io.Cookie(name, value);

        cookie.sameSite = io.SameSite.strict;

        final setCookie = () => cookieManager.setCookie(
          url: webUri,
          name: name,
          value: value,
          isSecure: cookie.secure,
          isHttpOnly: cookie.httpOnly,
          sameSite: web_view.HTTPCookieSameSitePolicy.STRICT,
        );

        when(setCookie).thenAnswer((_) async => true);
        final adapter = createSubject();
        await adapter.setCookie(url: url, cookie: cookie);
        verify(setCookie).called(1);
      });

      test('calls setCookie with correct values '
          'when sameSite is ${io.SameSite.none}', () async {
        const name = 'name';
        const value = 'value';
        final cookie = io.Cookie(name, value);

        cookie.sameSite = io.SameSite.none;

        final setCookie = () => cookieManager.setCookie(
          url: webUri,
          name: name,
          value: value,
          isSecure: cookie.secure,
          isHttpOnly: cookie.httpOnly,
          sameSite: web_view.HTTPCookieSameSitePolicy.NONE,
        );

        when(setCookie).thenAnswer((_) async => true);
        final adapter = createSubject();
        await adapter.setCookie(url: url, cookie: cookie);
        verify(setCookie).called(1);
      });
    });

    group('convert', () {
      test(
        'returns cookie with correct values '
        'when fields are null',
        () {
          const name = 'name';
          const value = 'value';

          final webViewCookie = web_view.Cookie(
            name: name,
            value: value,
          );

          final ioCookie = io.Cookie(name, value);

          final adapter = createSubject();
          final cookie = adapter.convert(webViewCookie);

          expect(
            cookie,
            isA<io.Cookie>()
                .having(
                  (cookie) => cookie.name,
                  'name',
                  name,
                )
                .having(
                  (cookie) => cookie.value,
                  'value',
                  value,
                )
                .having(
                  (cookie) => cookie.expires,
                  'expires',
                  null,
                )
                .having(
                  (cookie) => cookie.domain,
                  'domain',
                  null,
                )
                .having(
                  (cookie) => cookie.path,
                  'path',
                  null,
                )
                .having(
                  (cookie) => cookie.secure,
                  'secure',
                  ioCookie.secure,
                )
                .having(
                  (cookie) => cookie.httpOnly,
                  'httpOnly',
                  ioCookie.httpOnly,
                )
                .having(
                  (cookie) => cookie.sameSite,
                  'sameSite',
                  null,
                ),
          );
        },
      );

      test(
        'returns cookie with correct values '
        'when fields are non-null',
        () {
          const name = 'name';
          const value = 'value';

          final expires = DateTime(1);
          final expiresDate = expires.millisecondsSinceEpoch;

          const domain = 'domain';
          const path = 'path';
          const isSecure = true;
          const isHttpOnly = true;
          const sameSite = web_view.HTTPCookieSameSitePolicy.LAX;

          final webViewCookie = web_view.Cookie(
            name: name,
            value: value,
            expiresDate: expiresDate,
            domain: domain,
            path: path,
            isSecure: isSecure,
            isHttpOnly: isHttpOnly,
            sameSite: sameSite,
          );

          final adapter = createSubject();
          final cookie = adapter.convert(webViewCookie);

          expect(
            cookie,
            isA<io.Cookie>()
                .having(
                  (cookie) => cookie.name,
                  'name',
                  name,
                )
                .having(
                  (cookie) => cookie.value,
                  'value',
                  value,
                )
                .having(
                  (cookie) => cookie.expires,
                  'expires',
                  expires,
                )
                .having(
                  (cookie) => cookie.domain,
                  'domain',
                  domain,
                )
                .having(
                  (cookie) => cookie.path,
                  'path',
                  path,
                )
                .having(
                  (cookie) => cookie.secure,
                  'secure',
                  isSecure,
                )
                .having(
                  (cookie) => cookie.httpOnly,
                  'httpOnly',
                  isHttpOnly,
                )
                .having(
                  (cookie) => cookie.sameSite,
                  'sameSite',
                  io.SameSite.lax,
                ),
          );
        },
      );

      test(
        'returns cookie with correct values '
        'when sameSite is ${web_view.HTTPCookieSameSitePolicy.STRICT}',
        () {
          const name = 'name';
          const value = 'value';

          final webViewCookie = web_view.Cookie(
            name: name,
            value: value,
            sameSite: web_view.HTTPCookieSameSitePolicy.STRICT,
          );

          final adapter = createSubject();
          final cookie = adapter.convert(webViewCookie);

          expect(
            cookie,
            isA<io.Cookie>()
                .having(
                  (cookie) => cookie.name,
                  'name',
                  name,
                )
                .having(
                  (cookie) => cookie.value,
                  'value',
                  value,
                )
                .having(
                  (cookie) => cookie.sameSite,
                  'sameSite',
                  io.SameSite.strict,
                ),
          );
        },
      );

      test(
        'returns cookie with correct values '
        'when sameSite is ${web_view.HTTPCookieSameSitePolicy.NONE}',
        () {
          const name = 'name';
          const value = 'value';

          final webViewCookie = web_view.Cookie(
            name: name,
            value: value,
            sameSite: web_view.HTTPCookieSameSitePolicy.NONE,
          );

          final adapter = createSubject();
          final cookie = adapter.convert(webViewCookie);

          expect(
            cookie,
            isA<io.Cookie>()
                .having(
                  (cookie) => cookie.name,
                  'name',
                  name,
                )
                .having(
                  (cookie) => cookie.value,
                  'value',
                  value,
                )
                .having(
                  (cookie) => cookie.sameSite,
                  'sameSite',
                  io.SameSite.none,
                ),
          );
        },
      );
    });
  });
}
