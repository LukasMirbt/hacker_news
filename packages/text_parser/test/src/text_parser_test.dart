// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:text_parser/text_parser.dart';

void main() {
  group(TextParser, () {
    TextParser createSubject() => TextParser();

    group('parse', () {
      group('returns correct text when htmlText', () {
        test('contains html elements', () {
          const htmlText = 'Lorem ipsum.<p>Dolor sit amet.</p>';
          final model = createSubject();
          expect(
            model.parse(htmlText),
            'Lorem ipsum. Dolor sit amet.',
          );
        });

        test('does not contain html elements', () {
          const htmlText = 'Lorem ipsum. Dolor sit amet.';
          final model = createSubject();
          expect(
            model.parse(htmlText),
            htmlText,
          );
        });

        test('contains newlines', () {
          const htmlText = 'Lorem ipsum.\nDolor sit amet.';
          final model = createSubject();
          expect(
            model.parse(htmlText),
            'Lorem ipsum. Dolor sit amet.',
          );
        });

        test('contains leading and trailing whitespace', () {
          const htmlText = ' Lorem ipsum. Dolor sit amet. ';
          final model = createSubject();
          expect(
            model.parse(htmlText),
            'Lorem ipsum. Dolor sit amet.',
          );
        });

        test('contains more than one space between words', () {
          const htmlText = 'Lorem ipsum.  Dolor sit amet.';
          final model = createSubject();
          expect(
            model.parse(htmlText),
            'Lorem ipsum. Dolor sit amet.',
          );
        });

        test('contains tags that are empty or contain only whitespace', () {
          const htmlText =
              '<p>one</p><div></div><p>two</p><span>  </span><p>three</p>';
          final model = createSubject();
          expect(
            model.parse(htmlText),
            'one two three',
          );
        });

        test('contains non-breaking spaces', () {
          const htmlText = 'one&nbsp;&nbsp;two';
          final model = createSubject();
          expect(
            model.parse(htmlText),
            'one two',
          );
        });

        test('contains html entities', () {
          const htmlText =
              '<p>This is &quot;quoted&quot; &amp; it&apos;s great.</p>';
          final model = createSubject();
          expect(
            model.parse(htmlText),
            'This is "quoted" & it\'s great.',
          );
        });

        test('contains italicized text inside a paragraph', () {
          const htmlText = '<p>This is some <i>italicized</i> text.</p>';
          final model = createSubject();
          expect(
            model.parse(htmlText),
            'This is some italicized text.',
          );
        });
      });
    });
  });
}
