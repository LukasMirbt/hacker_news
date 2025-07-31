// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_parser/authentication_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDocument extends Mock implements Document {}

class _MockElement extends Mock implements Element {}

void main() {
  group(UserIdParser, () {
    late Document document;
    late Element element;

    setUp(() {
      document = _MockDocument();
      element = _MockElement();
    });

    UserIdParser createSubject() => UserIdParser();

    group('parse', () {
      final getElementById = () => document.getElementById('me');

      test('returns null when getElementById returns null', () {
        final parser = createSubject();
        expect(parser.parse(document), null);
      });

      test('returns text when element is non-null', () {
        const text = 'text';
        when(getElementById).thenReturn(element);
        when(() => element.text).thenReturn(text);
        final parser = createSubject();
        expect(parser.parse(document), text);
      });
    });
  });
}
