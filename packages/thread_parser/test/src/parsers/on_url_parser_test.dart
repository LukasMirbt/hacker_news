// ignore_for_file: prefer_const_constructors

import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_parser/thread_parser.dart';

class _MockElement extends Mock implements Element {}

void main() {
  group(OnUrlParser, () {
    late Element athing;
    late Element anchor;

    setUp(() {
      athing = _MockElement();
      anchor = _MockElement();
    });

    OnUrlParser createSubject() => OnUrlParser();

    group('parse', () {
      test('returns null when querySelector returns null', () {
        final parser = createSubject();
        expect(parser.parse(athing), null);
      });

      test('returns href attribute when anchor is non-null', () {
        const href = 'href';
        when(() => athing.querySelector('.onstory a')).thenReturn(anchor);
        when(() => anchor.attributes).thenReturn(
          LinkedHashMap.from({'href': href}),
        );
        final parser = createSubject();
        expect(parser.parse(athing), href);
      });
    });
  });
}
