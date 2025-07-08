// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_parser/post_parser.dart';

class _MockElement extends Mock implements Element {}

void main() {
  group(DetailHtmlTextParser, () {
    late Element item;
    late Element div;

    setUp(() {
      item = _MockElement();
      div = _MockElement();
    });

    DetailHtmlTextParser createSubject() => DetailHtmlTextParser();

    group('parse', () {
      test('returns null when querySelector returns null', () {
        final parser = createSubject();
        expect(parser.parse(item), null);
      });

      test('returns innerHtml when querySelector returns non-null value', () {
        const innerHtml = 'innerHtml';
        when(() => item.querySelector('.toptext')).thenReturn(div);
        when(() => div.innerHtml).thenReturn(innerHtml);
        final parser = createSubject();
        expect(parser.parse(item), innerHtml);
      });
    });
  });
}
