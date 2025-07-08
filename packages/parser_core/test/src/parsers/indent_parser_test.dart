// ignore_for_file: prefer_const_constructors

import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:parser_core/parser_core.dart';

class _MockElement extends Mock implements Element {}

void main() {
  group(IndentParser, () {
    IndentParser createSubject() => IndentParser();

    group('extractText', () {
      late Element element;
      late Element indentElement;

      setUp(() {
        element = _MockElement();
        indentElement = _MockElement();
      });

      test('returns null when querySelector returns null', () {
        final parser = createSubject();
        expect(parser.parse(element), null);
      });

      test('returns indent attribute when indentElement is non-null', () {
        const indent = 'indent';
        when(() => element.querySelector('.ind')).thenReturn(indentElement);
        when(() => indentElement.attributes).thenReturn(
          LinkedHashMap.from({'indent': indent}),
        );
        final parser = createSubject();
        expect(parser.extractText(element), indent);
      });
    });

    group('parseText', () {
      const text = '1';
      const value = 1;

      test('returns null when string is empty', () {
        final parser = createSubject();
        expect(parser.parseText(''), null);
      });

      test('returns int when string contains number', () {
        final parser = createSubject();
        expect(parser.parseText(text), value);
      });
    });
  });
}
