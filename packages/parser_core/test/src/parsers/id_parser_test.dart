// ignore_for_file: prefer_const_constructors

import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:parser_core/parser_core.dart';

class _MockElement extends Mock implements Element {}

void main() {
  group(IdParser, () {
    late Element element;

    setUp(() {
      element = _MockElement();
    });

    IdParser createSubject() => IdParser();

    group('parse', () {
      test('returns id attribute', () {
        const id = 'id';
        when(() => element.attributes).thenReturn(
          LinkedHashMap.from({'id': id}),
        );
        final parser = createSubject();
        expect(parser.parse(element), id);
      });
    });
  });
}
