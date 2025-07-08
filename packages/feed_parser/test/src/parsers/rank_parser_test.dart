// ignore_for_file: prefer_const_constructors

import 'package:feed_parser/feed_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockElement extends Mock implements Element {}

void main() {
  group(RankParser, () {
    RankParser createSubject() => RankParser();

    group('extractText', () {
      late Element item;
      late Element rankElement;

      setUp(() {
        item = _MockElement();
        rankElement = _MockElement();
      });

      test('returns null when querySelector returns null', () {
        final parser = createSubject();
        expect(parser.extractText(item), null);
      });

      test('returns text when querySelector returns rankElement', () {
        const text = 'text';
        when(() => item.querySelector('.rank')).thenReturn(rankElement);
        when(() => rankElement.text).thenReturn(text);
        final parser = createSubject();
        expect(parser.extractText(item), text);
      });
    });

    group('parseText', () {
      const singleDigitText = '4.';
      const twoDigitText = '13.';

      const singleDigitRank = 4;
      const twoDigitRank = 13;

      test('returns null when string is empty', () {
        final parser = createSubject();
        expect(parser.parseText(''), null);
      });

      test('returns correct value when text contains '
          'a single-digit rank', () {
        final parser = createSubject();
        expect(parser.parseText(singleDigitText), singleDigitRank);
      });

      test('returns correct value when text contains '
          'a two-digit rank', () {
        final parser = createSubject();
        expect(parser.parseText(twoDigitText), twoDigitRank);
      });
    });
  });
}
