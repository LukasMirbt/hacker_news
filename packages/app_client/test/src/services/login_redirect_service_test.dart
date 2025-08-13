// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'package:app_client/app_client.dart';
import 'package:authentication_parser/authentication_parser.dart'
    hide AuthenticationStatus;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAppClient extends Mock implements AppClient {}

class _MockHtmlParser extends Mock implements HtmlParser {}

class _MockIsLoginPageParser extends Mock implements IsLoginPageParser {}

class _MockAuthenticationState extends Mock implements AuthenticationState {}

class _MockDocument extends Mock implements Document {}

void main() {
  group(LoginRedirectService, () {
    late AppClient client;
    late HtmlParser htmlParser;
    late IsLoginPageParser isLoginPageParser;
    late AuthenticationState state;
    late Document document;

    setUp(() {
      client = _MockAppClient();
      htmlParser = _MockHtmlParser();
      isLoginPageParser = _MockIsLoginPageParser();
      state = _MockAuthenticationState();
      document = _MockDocument();
      when(() => client.state).thenReturn(state);
    });

    LoginRedirectService createService() {
      return LoginRedirectService(
        appClient: client,
        htmlParser: htmlParser,
        isLoginPageParser: isLoginPageParser,
      );
    }

    group('shouldRedirect', () {
      const html = 'html';
      final parseHtml = () => htmlParser.parse(html);
      final parseIsLoginPage = () => isLoginPageParser.parse(document);

      test('parses html and returns isLoginPage', () {
        const isLoginPage = true;
        when(parseHtml).thenReturn(document);
        when(parseIsLoginPage).thenReturn(isLoginPage);
        final service = createService();
        final value = service.shouldRedirect(html);
        expect(value, isLoginPage);
        verify(parseHtml).called(1);
        verify(parseIsLoginPage).called(1);
      });
    });

    group('redirect', () {
      final redirectToLogin = () => client.redirectToLogin();

      test('calls client.redirectToLogin', () {
        final service = createService();
        service.redirect();
        verify(redirectToLogin).called(1);
      });
    });
  });
}
