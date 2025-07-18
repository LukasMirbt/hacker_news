// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_parser/authentication_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDocument extends Mock implements Document {}

class _MockElement extends Mock implements Element {}

void main() {
  group(HasLoginLinkParser, () {
    late Document document;

    setUp(() {
      document = _MockDocument();
    });

    HasLoginLinkParser createSubject() => HasLoginLinkParser();

    group('parse', () {
      final querySelectorAll = () => document.querySelectorAll('.pagetop a');

      test('returns true when topLinks has a link '
          'with text "login"', () {
        final otherLink = _MockElement();
        final loginLink = _MockElement();
        final topLinks = [otherLink, loginLink];
        when(() => loginLink.text).thenReturn('login');
        when(() => otherLink.text).thenReturn('other');
        when(querySelectorAll).thenReturn(topLinks);
        final parser = createSubject();
        expect(parser.parse(document), true);
      });

      test('returns false when topLinks does not have a link '
          'with text "login"', () {
        final otherLink = _MockElement();
        final anotherLink = _MockElement();
        final topLinks = [otherLink, anotherLink];
        when(() => otherLink.text).thenReturn('other');
        when(() => anotherLink.text).thenReturn('another');
        when(querySelectorAll).thenReturn(topLinks);
        final parser = createSubject();
        expect(parser.parse(document), false);
      });

      test('returns false when topLinks is empty', () {
        final topLinks = <Element>[];
        when(querySelectorAll).thenReturn(topLinks);
        final parser = createSubject();
        expect(parser.parse(document), false);
      });
    });
  });
}
