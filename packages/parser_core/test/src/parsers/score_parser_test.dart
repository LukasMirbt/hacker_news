// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:parser_core/parser_core.dart';

class _MockElement extends Mock implements Element {}

void main() {
  group(ScoreParser, () {
    ScoreParser createSubject() => ScoreParser();

    group('extractText', () {
      late Element element;
      late Element scoreElement;

      setUp(() {
        element = _MockElement();
        scoreElement = _MockElement();
      });

      test('returns null when querySelector returns null', () {
        final parser = createSubject();
        expect(parser.extractText(element), null);
      });

      test('returns text when scoreElement is non-null', () {
        const text = 'text';
        when(() => element.querySelector('.score')).thenReturn(scoreElement);
        when(() => scoreElement.text).thenReturn(text);
        final parser = createSubject();
        expect(parser.extractText(element), text);
      });
    });

    group('parseText', () {
      const onePointText = '1 point';
      const singleDigitText = '4 points';
      const twoDigitText = '13 points';
      const threeDigitText = '187 points';
      const fourDigitText = '6015 points';

      const onePointScore = 1;
      const singleDigitScore = 4;
      const twoDigitScore = 13;
      const threeDigitScore = 187;
      const fourDigitScore = 6015;

      test('returns null when string is empty', () {
        final parser = createSubject();
        expect(parser.parseText(''), null);
      });

      test('returns correct value when text contains '
          'a one-point score', () {
        final parser = createSubject();
        expect(parser.parseText(onePointText), onePointScore);
      });

      test('returns correct value when text contains '
          'a single-digit score', () {
        final parser = createSubject();
        expect(parser.parseText(singleDigitText), singleDigitScore);
      });

      test('returns correct value when text contains '
          'a two-digit score', () {
        final parser = createSubject();
        expect(parser.parseText(twoDigitText), twoDigitScore);
      });

      test('returns correct value when text contains '
          'a three-digit score', () {
        final parser = createSubject();
        expect(parser.parseText(threeDigitText), threeDigitScore);
      });

      test('returns correct value when text contains '
          'a four-digit score', () {
        final parser = createSubject();
        expect(parser.parseText(fourDigitText), fourDigitScore);
      });
    });
  });
}
