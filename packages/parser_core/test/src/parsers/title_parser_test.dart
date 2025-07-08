// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:parser_core/parser_core.dart';

class _MockElement extends Mock implements Element {}

void main() {
  group(TitleParser, () {
    late Element element;
    late Element anchor;

    setUp(() {
      element = _MockElement();
      anchor = _MockElement();
    });

    TitleParser createSubject() => TitleParser();

    group('parse', () {
      test('returns null when querySelector returns null', () {
        final parser = createSubject();
        expect(parser.parse(element), null);
      });

      test('returns text when anchor is non-null', () {
        const text = 'text';
        when(() => anchor.text).thenReturn(text);
        when(() => element.querySelector('.titleline a')).thenReturn(anchor);
        final parser = createSubject();
        expect(parser.parse(element), text);
      });
    });
  });
}
