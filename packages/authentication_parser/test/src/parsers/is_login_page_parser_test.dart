// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_parser/authentication_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockHtmlParser extends Mock implements HtmlParser {}

class _MockAccountInputParser extends Mock implements AccountInputParser {}

class _MockPasswordInputParser extends Mock implements PasswordInputParser {}

class _MockDocument extends Mock implements Document {}

class _MockElement extends Mock implements Element {}

void main() {
  const html = 'html';

  group(IsLoginPageParser, () {
    late HtmlParser htmlParser;
    late AccountInputParser accountInputParser;
    late PasswordInputParser passwordInputParser;
    late Document document;
    late Element accountInput;
    late Element passwordInput;

    setUp(() {
      htmlParser = _MockHtmlParser();
      accountInputParser = _MockAccountInputParser();
      passwordInputParser = _MockPasswordInputParser();
      document = _MockDocument();
      accountInput = _MockElement();
      passwordInput = _MockElement();
    });

    IsLoginPageParser createSubject() {
      return IsLoginPageParser(
        htmlParser: htmlParser,
        accountInputParser: accountInputParser,
        passwordInputParser: passwordInputParser,
      );
    }

    group('parse', () {
      final parseHtml = () => htmlParser.parse(html);
      final parseAccountInput = () => accountInputParser.parse(document);
      final parsePasswordInput = () => passwordInputParser.parse(document);

      test('returns true when accountInput and passwordInput '
          'are non-null', () {
        when(parseHtml).thenReturn(document);
        when(parseAccountInput).thenReturn(accountInput);
        when(parsePasswordInput).thenReturn(passwordInput);
        final parser = createSubject();
        final isLoginPage = parser.parse(html);
        expect(isLoginPage, true);
        verify(parseHtml).called(1);
        verify(parseAccountInput).called(1);
        verify(parsePasswordInput).called(1);
      });

      test('returns false when accountInput and passwordInput '
          'are null', () {
        when(parseHtml).thenReturn(document);
        final parser = createSubject();
        final isLoginPage = parser.parse(html);
        expect(isLoginPage, false);
        verify(parseHtml).called(1);
        verify(parseAccountInput).called(1);
        verify(parsePasswordInput).called(1);
      });
    });
  });
}
