// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:parser_core/parser_core.dart';

class _MockElement extends Mock implements Element {}

void main() {
  group(HnuserParser, () {
    late Element element;
    late Element userAnchor;
    late Element fontElement;

    setUp(() {
      element = _MockElement();
      userAnchor = _MockElement();
      fontElement = _MockElement();
    });

    HnuserParser createSubject() => HnuserParser();

    group('parse', () {
      test('returns null when querySelector returns null', () {
        final parser = createSubject();
        expect(parser.parse(element), null);
      });

      test('returns $Hnuser with !isNew when userAnchor is non-null '
          'and has no children', () {
        const text = 'text';
        when(() => element.querySelector('.hnuser')).thenReturn(userAnchor);
        when(() => userAnchor.children).thenReturn([]);
        when(() => userAnchor.text).thenReturn(text);
        final parser = createSubject();
        expect(
          parser.parse(element),
          Hnuser(
            id: text,
            isNew: false,
          ),
        );
      });

      test('returns $Hnuser with isNew when userAnchor is non-null '
          'and has children', () {
        const text = 'text';
        final children = [fontElement];
        when(() => element.querySelector('.hnuser')).thenReturn(userAnchor);
        when(() => userAnchor.children).thenReturn(children);
        when(() => fontElement.text).thenReturn(text);
        final parser = createSubject();
        expect(
          parser.parse(element),
          Hnuser(
            id: text,
            isNew: true,
          ),
        );
      });
    });
  });
}
