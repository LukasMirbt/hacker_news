// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_parser/authentication_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockHtmlParser extends Mock implements HtmlParser {}

class _MockUserParser extends Mock implements UserParser {}

class _MockLoginLinkParser extends Mock implements LoginLinkParser {}

class _MockDocument extends Mock implements Document {}

class _MockElement extends Mock implements Element {}

void main() {
  const html = 'html';
  final user = UserDataPlaceholder();

  group(AuthenticationStatusParser, () {
    late HtmlParser htmlParser;
    late UserParser userParser;
    late LoginLinkParser loginLinkParser;
    late Document document;
    late Element loginLink;

    setUp(() {
      htmlParser = _MockHtmlParser();
      userParser = _MockUserParser();
      loginLinkParser = _MockLoginLinkParser();
      document = _MockDocument();
      loginLink = _MockElement();
    });

    AuthenticationStatusParser createSubject() {
      return AuthenticationStatusParser(
        htmlParser: htmlParser,
        userParser: userParser,
        loginLinkParser: loginLinkParser,
      );
    }

    group('parse', () {
      final parseHtml = () => htmlParser.parse(html);
      final parseUserData = () => userParser.parse(document);
      final parseLoginLink = () => loginLinkParser.parse(document);

      test('returns $Authenticated when user is non-null', () {
        when(parseHtml).thenReturn(document);
        when(parseUserData).thenReturn(user);
        final parser = createSubject();
        expect(parser.parse(html), Authenticated(user));
        verify(parseHtml).called(1);
        verify(parseUserData).called(1);
      });

      test('returns $Unauthenticated when user is null '
          'and loginLink is non-null', () {
        when(parseHtml).thenReturn(document);
        when(parseLoginLink).thenReturn(loginLink);
        final parser = createSubject();
        expect(parser.parse(html), Unauthenticated());
        verify(parseHtml).called(1);
        verify(parseUserData).called(1);
        verify(parseLoginLink).called(1);
      });

      test('returns $Unknown when user is null '
          'and loginLink is null', () {
        when(parseHtml).thenReturn(document);
        final parser = createSubject();
        expect(parser.parse(html), Unknown());
        verify(parseHtml).called(1);
        verify(parseUserData).called(1);
        verify(parseLoginLink).called(1);
      });
    });
  });
}
