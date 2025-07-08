// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:parser_core/parser_core.dart';

class _MockElement extends Mock implements Element {}

void main() {
  group(UrlHostParser, () {
    late Element item;
    late Element span;

    setUp(() {
      item = _MockElement();
      span = _MockElement();
    });

    UrlHostParser createSubject() => UrlHostParser();

    group('parse', () {
      test('returns null when querySelector returns null', () {
        final parser = createSubject();
        expect(parser.parse(item), null);
      });

      test('returns text when querySelector returns non-null value', () {
        const text = 'text';
        when(() => item.querySelector('.sitestr')).thenReturn(span);
        when(() => span.text).thenReturn(text);
        final parser = createSubject();
        expect(parser.parse(item), text);
      });
    });
  });
}
