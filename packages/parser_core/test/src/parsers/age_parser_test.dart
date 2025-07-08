// ignore_for_file: prefer_const_constructors

import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:parser_core/parser_core.dart';

class _MockElement extends Mock implements Element {}

void main() {
  group(AgeParser, () {
    AgeParser createSubject() => AgeParser();

    group('extractText', () {
      late Element element;
      late Element ageElement;

      setUp(() {
        element = _MockElement();
        ageElement = _MockElement();
      });

      test('returns null when querySelector returns null', () {
        final parser = createSubject();
        expect(parser.extractText(element), null);
      });

      test('returns title attribute when ageElement is non-null', () {
        const title = 'title';
        when(() => element.querySelector('.age')).thenReturn(ageElement);
        when(() => ageElement.attributes).thenReturn(
          LinkedHashMap.from({'title': title}),
        );
        final parser = createSubject();
        expect(parser.extractText(element), title);
      });
    });

    group('parseText', () {
      const text = '2025-03-12T15:09:09 1741792149';
      final utcDate = DateTime.utc(2025, 3, 12, 15, 9, 9);
      final localDate = utcDate.toLocal();

      test('returns null when string is empty', () {
        final parser = createSubject();
        expect(parser.parseText(''), null);
      });

      test('returns local $DateTime when string has expected format', () {
        final parser = createSubject();
        expect(parser.parseText(text), localDate);
      });
    });
  });
}
