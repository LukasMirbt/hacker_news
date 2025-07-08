// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:parser_core/parser_core.dart';

class _MockElement extends Mock implements Element {}

void main() {
  group(CommentCountParser, () {
    CommentCountParser createSubject() => CommentCountParser();

    group('extractText', () {
      late Element element;

      setUp(() {
        element = _MockElement();
      });

      final querySelectorAll = () => element.querySelectorAll('a');

      test('returns null when element has no anchor descendants', () {
        when(querySelectorAll).thenReturn([]);
        final parser = createSubject();
        expect(parser.extractText(element), null);
      });

      test('returns null when element has no anchor descendant '
          'that contains "comment"', () {
        final anchor = _MockElement();
        final anchors = [anchor];
        when(() => anchor.text).thenReturn('text');
        when(querySelectorAll).thenReturn(anchors);
        final parser = createSubject();
        expect(parser.extractText(element), null);
      });

      test('returns text of first anchor that contains "comment" '
          'when element has anchor descendants', () {
        final otherAnchor = _MockElement();
        final commentAnchor = _MockElement();
        const commentAnchorText = '227&nbsp;comments';
        final anchors = [otherAnchor, commentAnchor];
        when(() => otherAnchor.text).thenReturn('text');
        when(() => commentAnchor.text).thenReturn(commentAnchorText);
        when(querySelectorAll).thenReturn(anchors);
        final parser = createSubject();
        expect(parser.extractText(element), commentAnchorText);
      });
    });

    group('parseText', () {
      const oneCommentText = '1&nbsp;comment';
      const singleDigitText = '4&nbsp;comments';
      const twoDigitText = '13&nbsp;comments';
      const threeDigitText = '227&nbsp;comments';
      const fourDigitText = '2530&nbsp;comments';

      const oneCommentCount = 1;
      const singleDigitCount = 4;
      const twoDigitCount = 13;
      const threeDigitCount = 227;
      const fourDigitCount = 2530;

      test('returns null when string is empty', () {
        final parser = createSubject();
        expect(parser.parseText(''), null);
      });

      test('returns correct value when text contains '
          'a one-digit count', () {
        final parser = createSubject();
        expect(parser.parseText(oneCommentText), oneCommentCount);
      });

      test('returns correct value when text contains '
          'a single-digit count', () {
        final parser = createSubject();
        expect(parser.parseText(singleDigitText), singleDigitCount);
      });

      test('returns correct value when text contains '
          'a two-digit count', () {
        final parser = createSubject();
        expect(parser.parseText(twoDigitText), twoDigitCount);
      });

      test('returns correct value when text contains '
          'a three-digit count', () {
        final parser = createSubject();
        expect(parser.parseText(threeDigitText), threeDigitCount);
      });

      test('returns correct value when text contains '
          'a four-digit count', () {
        final parser = createSubject();
        expect(parser.parseText(fourDigitText), fourDigitCount);
      });
    });
  });
}
