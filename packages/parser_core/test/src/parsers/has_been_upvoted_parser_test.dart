// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:parser_core/parser_core.dart';

class _MockElement extends Mock implements Element {}

void main() {
  group(HasBeenUpvotedParser, () {
    late Element element;
    late Element anchor;

    setUp(() {
      element = _MockElement();
      anchor = _MockElement();
    });

    HasBeenUpvotedParser createSubject() => HasBeenUpvotedParser();

    group('parse', () {
      test('returns null when querySelector returns null', () {
        final parser = createSubject();
        expect(parser.parse(element), null);
      });

      test('returns false when anchor is non-null '
          'and className does not contain "nosee"', () {
        const className = 'clicky';
        when(() => element.querySelector('.votelinks a')).thenReturn(anchor);
        when(() => anchor.className).thenReturn(className);
        final parser = createSubject();
        expect(parser.parse(element), false);
      });

      test('returns true when anchor is non-null '
          'and className contains "nosee"', () {
        const className = 'nosee clicky';
        when(() => element.querySelector('.votelinks a')).thenReturn(anchor);
        when(() => anchor.className).thenReturn(className);
        final parser = createSubject();
        expect(parser.parse(element), true);
      });
    });
  });
}
