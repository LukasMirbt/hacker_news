// ignore_for_file: prefer_const_constructors

import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:parser_core/parser_core.dart';

class _MockElement extends Mock implements Element {}

void main() {
  group(UrlParser, () {
    late Element element;
    late Element anchor;

    setUp(() {
      element = _MockElement();
      anchor = _MockElement();
    });

    UrlParser createSubject() => UrlParser();

    group('parse', () {
      test('returns null when querySelector returns null', () {
        final parser = createSubject();
        expect(parser.parse(element), null);
      });

      test('returns href attribute when anchor is non-null', () {
        const href = 'href';
        when(() => element.querySelector('.titleline a')).thenReturn(anchor);
        when(() => anchor.attributes).thenReturn(
          LinkedHashMap.from({'href': href}),
        );
        final parser = createSubject();
        expect(parser.parse(element), href);
      });
    });
  });
}
