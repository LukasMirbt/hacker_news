// ignore_for_file: prefer_const_constructors

import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:parser_core/parser_core.dart';

class _MockElement extends Mock implements Element {}

void main() {
  group(GotoParser, () {
    late Element element;
    late Element input;

    setUp(() {
      element = _MockElement();
      input = _MockElement();
    });

    GotoParser createSubject() => GotoParser();

    group('parse', () {
      test('returns null when querySelector returns null', () {
        final parser = createSubject();
        expect(parser.parse(element), null);
      });

      test('returns value attribute when input is non-null', () {
        const value = 'value';
        when(
          () => element.querySelector('input[name="goto"]'),
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
