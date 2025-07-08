// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:parser_core/parser_core.dart';

class _MockElement extends Mock implements Element {}

void main() {
  group(CommentHtmlTextParser, () {
    late Element element;
    late Element commtextElement;

    setUp(() {
      element = _MockElement();
      commtextElement = _MockElement();
    });

    CommentHtmlTextParser createSubject() => CommentHtmlTextParser();

    group('parse', () {
      test('returns null when querySelector returns null', () {
        final parser = createSubject();
        expect(parser.parse(element), null);
      });

      test('returns innerHtml when commtextElement is non-null', () {
        const innerHtml = 'innerHtml';
        when(
          () => element.querySelector('.commtext'),
        ).thenReturn(commtextElement);
        when(() => commtextElement.innerHtml).thenReturn(innerHtml);
        final parser = createSubject();
        expect(parser.parse(element), innerHtml);
      });
    });
  });
}
