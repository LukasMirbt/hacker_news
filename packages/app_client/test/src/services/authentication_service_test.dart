// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'package:app_client/app_client.dart';
import 'package:authentication_parser/authentication_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAppClient extends Mock implements AppClient {}

class _MockHtmlParser extends Mock implements HtmlParser {}

class _MockAuthenticationStatusParser extends Mock
    implements AuthenticationStatusParser {}

class _MockDocument extends Mock implements Document {}

void main() {
  final data = UserDataPlaceholder();
  final user = User.fromData(data);

  group(AuthenticationService, () {
    late AppClient client;
    late HtmlParser htmlParser;
    late AuthenticationStatusParser statusParser;
    late Document document;

    setUp(() {
      client = _MockAppClient();
      htmlParser = _MockHtmlParser();
      statusParser = _MockAuthenticationStatusParser();
      document = _MockDocument();
    });

    AuthenticationService createSubject() {
      return AuthenticationService(
        appClient: client,
        htmlParser: htmlParser,
        authenticationStatusParser: statusParser,
      );
    }

    group('update', () {
      const html = 'html';
      final parseHtml = () => htmlParser.parse(html);
      final parseStatus = () => statusParser.parse(document);

      final authenticate = () => client.authenticate(user);

      final unauthenticate = () => client.unauthenticate();

      test('parses html, status and calls authenticate '
          'when status is $Authenticated', () {
        when(parseHtml).thenReturn(document);
        when(parseStatus).thenReturn(Authenticated(data));
        when(authenticate).thenAnswer((_) async {});
        final service = createSubject();
        service.update(html);
        verify(parseHtml).called(1);
        verify(parseStatus).called(1);
        verify(authenticate).called(1);
        verifyNever(unauthenticate);
      });

      test('parses html, status and calls unauthenticate '
          'when status is $Unauthenticated', () {
        when(parseHtml).thenReturn(document);
        when(parseStatus).thenReturn(Unauthenticated());
        when(unauthenticate).thenAnswer((_) async {});
        final service = createSubject();
        service.update(html);
        verify(parseHtml).called(1);
        verify(parseStatus).called(1);
        verify(unauthenticate).called(1);
        verifyNever(authenticate);
      });

      test('parses html, status and returns '
          'when status is $Unknown', () {
        when(parseHtml).thenReturn(document);
        when(parseStatus).thenReturn(Unknown());
        final service = createSubject();
        service.update(html);
        verify(parseHtml).called(1);
        verify(parseStatus).called(1);
        verifyNever(authenticate);
        verifyNever(unauthenticate);
      });
    });
  });
}
