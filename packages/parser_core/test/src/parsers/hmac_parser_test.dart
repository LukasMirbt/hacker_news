// ignore_for_file: prefer_const_constructors

import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:parser_core/parser_core.dart';

class _MockElement extends Mock implements Element {}

void main() {
  group(HmacParser, () {
    late Element element;
    late Element input;

    setUp(() {
      element = _MockElement();
      input = _MockElement();
    });

    HmacParser createSubject() => HmacParser();

    group('parse', () {
      test('returns null when querySelector returns null', () {
        final parser = createSubject();
        expect(parser.parse(element), null);
      });

      test('returns value attribute when input is non-null', () {
        const value = 'value';
        when(
          () => element.querySelector('input[name="hmac"]'),
        ).thenReturn(input);
        when(() => input.attributes).thenReturn(
          LinkedHashMap.from({'value': value}),
        );
        final parser = createSubject();
        expect(parser.parse(element), value);
      });
    });
  });
}
