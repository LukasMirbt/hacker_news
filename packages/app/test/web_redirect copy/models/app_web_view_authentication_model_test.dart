// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/app_web_view/app_web_view.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAppWebViewController extends Mock implements AppWebViewController {}

class _MockAppWebViewCookieManager extends Mock
    implements AppWebViewCookieManager {}

class _MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class _MockAuthenticationState extends Mock implements AuthenticationState {}

void main() {
  final baseUrl = Uri.parse('https://test.example.com');

  final cookies = [
    Cookie('name', 'value'),
  ];

  group(AppWebViewAuthenticationModel, () {
    late AppWebViewController controller;
    late AppWebViewCookieManager cookieManager;
    late AuthenticationRepository repository;
    late AuthenticationState state;

    setUp(() {
      controller = _MockAppWebViewController();
      cookieManager = _MockAppWebViewCookieManager();
      repository = _MockAuthenticationRepository();
      state = _MockAuthenticationState();
      when(() => repository.state).thenReturn(state);
      when(() => state.baseUrl).thenReturn(baseUrl);
    });

    AppWebViewAuthenticationModel createSubject() {
      return AppWebViewAuthenticationModel(
        controller: controller,
        cookieManager: cookieManager,
        repository: repository,
      );
    }

    group('matchesAppHost', () {
      test('returns false when url is null', () {
        final model = createSubject();
        expect(
          model.matchesAppHost(null),
          false,
        );
      });

      test('returns false when url.host != baseUrl.host', () {
        final model = createSubject();
        final url = Uri.parse('https://www.google.com');
        expect(
          model.matchesAppHost(url),
          false,
        );
      });

      test('returns true when url.host == baseUrl.host', () {
        final model = createSubject();
        final url = Uri.parse('https://test.example.com/item?id=id');
        expect(
          model.matchesAppHost(url),
          true,
        );
      });
    });

    group('syncCookiesToWebView', () {
      final getCookies = () => repository.cookies();

      final setCookies = () => cookieManager.setCookies(
        url: baseUrl,
        cookies: cookies,
      );

      test('gets and sets cookies', () async {
        when(getCookies).thenAnswer((_) async => cookies);
        when(setCookies).thenAnswer((_) async {});
        final model = createSubject();
        await model.syncCookiesToWebView();
        verify(getCookies).called(1);
        verify(setCookies).called(1);
      });
    });

    group('syncCookiesToApp', () {
      final getCookies = () => cookieManager.cookies(baseUrl);
      final setCookies = () => repository.saveCookies(cookies);

      test('gets and sets cookies', () async {
        when(getCookies).thenAnswer((_) async => cookies);
        when(setCookies).thenAnswer((_) async {});
        final model = createSubject();
        await model.syncCookiesToApp();
        verify(getCookies).called(1);
        verify(setCookies).called(1);
      });
    });

    group('updateAuthenticationFromHtml', () {
      const html = 'html';

      final getHtml = () => controller.html();

      final updateAuthenticationFromHtml = () =>
          repository.updateAuthenticationFromHtml(html);

      test('gets html and calls '
          'repository.updateAuthenticationFromHtml', () async {
        when(getHtml).thenAnswer((_) async => html);
        final model = createSubject();
        await model.updateAuthenticationFromHtml();
        verify(getHtml).called(1);
        verify(updateAuthenticationFromHtml).called(1);
      });
    });
  });
}
