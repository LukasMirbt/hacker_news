// ignore_for_file: prefer_const_constructors

import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:parser_core/parser_core.dart';

class _MockDocument extends Mock implements Document {}

class _MockElement extends Mock implements Element {}

void main() {
  group(MoreLinkParser, () {
    late Document document;
    late Element anchor;

    setUp(() {
      document = _MockDocument();
      anchor = _MockElement();
    });

    MoreLinkParser createSubject() => MoreLinkParser();

    group('parse', () {
      test('returns null when querySelector returns null', () {
        final parser = createSubject();
        expect(parser.parse(document), null);
      });

      test('returns href attribute when anchor is non-null', () {
        const href = 'href';
        when(() => document.querySelector('.morelink')).thenReturn(anchor);
        when(() => anchor.attributes).thenReturn(
          LinkedHashMap.from({'href': href}),
        );
        final parser = createSubject();
        expect(parser.parse(document), href);
      });
    });
  });
}
