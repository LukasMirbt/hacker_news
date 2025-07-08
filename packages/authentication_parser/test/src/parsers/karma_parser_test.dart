// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_parser/authentication_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDocument extends Mock implements Document {}

class _MockElement extends Mock implements Element {}

void main() {
  group(KarmaParser, () {
    late Document document;
    late Element element;

    setUp(() {
      document = _MockDocument();
      element = _MockElement();
    });

    KarmaParser createSubject() => KarmaParser();

    group('parse', () {
      final getElementById = () => document.getElementById('karma');

      test('returns null when element is null', () {
        final parser = createSubject();
        expect(parser.parse(document), null);
      });

      test('returns int when element is non-null and text '
          'is parseable', () {
        when(() => element.text).thenReturn('1');
        when(getElementById).thenReturn(element);
        final parser = createSubject();
        expect(parser.parse(document), 1);
      });

      test('returns null when element is non-null and text '
          'is not parseable', () {
        when(() => element.text).thenReturn('text');
        when(getElementById).thenReturn(element);
        final parser = createSubject();
        expect(parser.parse(document), null);
      });
    });
  });
}
