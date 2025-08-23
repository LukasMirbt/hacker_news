// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:io' as io;

import 'package:app/web_redirect/web_redirect.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' as web_view;
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockCookieManager extends Mock implements CookieManager {}

class _MockWebRedirectCookieAdapter extends Mock
    implements WebRedirectCookieAdapter {}

void main() {
  group(WebRedirectCookieManager, () {
    late CookieManager cookieManager;
    late WebRedirectCookieAdapter adapter;

    setUp(() {
      cookieManager = _MockCookieManager();
      adapter = _MockWebRedirectCookieAdapter();
      registerFallbackValue(
        io.Cookie('name', 'value'),
      );
    });

    WebRedirectCookieManager createSubject() {
      return WebRedirectCookieManager(
        cookieManager: cookieManager,
        cookieAdapter: adapter,
      );
    }

    group('setCookies', () {
      final url = Uri.parse('https://example.com');

      final cookies = [
        io.Cookie('name1', 'value1'),
        io.Cookie('name2', 'value2'),
      ];

      final setCookie = (io.Cookie cookie) =>
          () => adapter.setCookie(
            url: url,
            cookie: cookie,
          );

      test('calls setCookie for each cookie', () async {
        for (final cookie in cookies) {
          when(setCookie(cookie)).thenAnswer((_) async {
            return;
          });
        }

        final manager = createSubject();
        await manager.setCookies(url: url, cookies: cookies);

        for (final cookie in cookies) {
          verify(setCookie(cookie)).called(1);
        }
      });
    });

    group('getCookies', () {
      final uri = Uri.parse('https://example.com');
      final webUri = WebUri.uri(uri);

      final firstCookie = web_view.Cookie(
        name: 'name1',
        value: 'value1',
      );

      final secondCookie = web_view.Cookie(
        name: 'name2',
        value: 'value2',
      );

      final webViewCookies = [
        firstCookie,
        secondCookie,
      ];

      final ioCookie = io.Cookie('name', 'value');

      final getCookies = () => cookieManager.getCookies(url: webUri);

      final convert = (web_view.Cookie cookie) =>
          () => adapter.convert(cookie);

      test('calls getCookies, converts each cookie '
          'and returns the result', () async {
        when(getCookies).thenAnswer((_) async => webViewCookies);

        for (final cookie in webViewCookies) {
          when(convert(cookie)).thenReturn(ioCookie);
        }

        final manager = createSubject();

        await expectLater(
          manager.cookies(uri),
          completion(
            [ioCookie, ioCookie],
          ),
        );

        verify(getCookies).called(1);

        for (final cookie in webViewCookies) {
          verify(convert(cookie)).called(1);
        }
      });
    });
  });
}
