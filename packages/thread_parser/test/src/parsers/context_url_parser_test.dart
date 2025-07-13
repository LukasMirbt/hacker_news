// ignore_for_file: prefer_const_constructors

import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_parser/thread_parser.dart';

class _MockElement extends Mock implements Element {}

void main() {
  group(ContextUrlParser, () {
    late Element athing;
    late Element navsElement;

    setUp(() {
      athing = _MockElement();
      navsElement = _MockElement();
    });

    ContextUrlParser createSubject() => ContextUrlParser();

    group('parse', () {
      test('returns null when querySelector returns null', () {
        final parser = createSubject();
        expect(parser.parse(athing), null);
      });

      test('returns null when navsElement is non-null '
          'and has no anchor descendants', () {
        when(() => athing.querySelector('.navs')).thenReturn(navsElement);
        when(() => navsElement.querySelectorAll('a')).thenReturn([]);
        final parser = createSubject();
        expect(parser.parse(athing), null);
      });

      test('returns null when navsElement is non-null '
          'and has no anchor descendant that contains "context"', () {
        final anchor = _MockElement();
        final anchors = [anchor];
        when(() => anchor.text).thenReturn('text');
        when(() => athing.querySelector('.navs')).thenReturn(navsElement);
        when(() => navsElement.querySelectorAll('a')).thenReturn(anchors);
        final parser = createSubject();
        expect(parser.parse(athing), null);
      });

      test('returns href attribute of first anchor that contains "context" '
          'when navsElement has anchor descendants', () {
        const href = 'href';
        final otherAnchor = _MockElement();
        final contextAnchor = _MockElement();
        final anchors = [otherAnchor, contextAnchor];
        when(() => otherAnchor.text).thenReturn('text');
        when(() => contextAnchor.text).thenReturn('context');
        when(() => athing.querySelector('.navs')).thenReturn(navsElement);
        when(() => navsElement.querySelectorAll('a')).thenReturn(anchors);
        when(() => contextAnchor.attributes).thenReturn(
          LinkedHashMap.from({'href': href}),
        );
        final parser = createSubject();
        expect(parser.parse(athing), href);
      });
    });
  });
}
