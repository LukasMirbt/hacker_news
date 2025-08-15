// ignore_for_file: prefer_const_constructors

import 'package:authentication_parser/authentication_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDocument extends Mock implements Document {}

class _MockElement extends Mock implements Element {}

void main() {
  group(PasswordInputParser, () {
    late Document document;
    late Element input;

    setUp(() {
      document = _MockDocument();
      input = _MockElement();
    });

    PasswordInputParser createSubject() => PasswordInputParser();

    group('parse', () {
      test('returns null when querySelector returns null', () {
        final parser = createSubject();
        expect(parser.parse(document), null);
      });

      test('returns value attribute when input is non-null', () {
        when(
          () => document.querySelector('input[name="pw"]'),
        ).thenReturn(input);
        final parser = createSubject();
        expect(parser.parse(document), input);
      });
    });
  });
}
