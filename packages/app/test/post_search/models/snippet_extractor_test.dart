// ignore_for_file: prefer_const_constructors

import 'package:app/post_search/post_search.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const text =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
      'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
      'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
      'reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla '
      'pariatur. Excepteur sint occaecat cupidatat non proident, sunt in '
      'culpa qui officia deserunt mollit anim id est laborum.';

  group(SnippetExtractor, () {
    SnippetExtractor createSubject() => SnippetExtractor();

    group('extract', () {
      test('returns correct $SearchResultSnippet '
          'when query matches start of text', () {
        const query = 'Lorem';
        final extractor = createSubject();
        expect(
          extractor.extract(
            text: text,
            query: query,
          ),
          SearchResultSnippet(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                'sed do eiusmod tempor incididunt',
            match: SearchMatch(
              start: 0,
              end: 5,
              isStartOfText: true,
              isEndOfText: false,
            ),
          ),
        );
      });

      test('returns correct $SearchResultSnippet '
          'when query matches middle of text', () {
        const query = 'nostrud';
        final extractor = createSubject();
        expect(
          extractor.extract(
            text: text,
            query: query,
          ),
          SearchResultSnippet(
            text:
                'magna aliqua. Ut enim ad minim veniam, quis nostrud '
                'exercitation ullamco laboris nisi ut aliquip',
            match: SearchMatch(
              start: 44,
              end: 51,
              isStartOfText: false,
              isEndOfText: false,
            ),
          ),
        );
      });

      test('returns correct $SearchResultSnippet '
          'when query matches end of text', () {
        const query = 'laborum.';
        final extractor = createSubject();
        expect(
          extractor.extract(
            text: text,
            query: query,
          ),
          SearchResultSnippet(
            text:
                'occaecat cupidatat non proident, sunt in culpa '
                'qui officia deserunt mollit anim id est laborum.',
            match: SearchMatch(
              start: 87,
              end: 95,
              isStartOfText: false,
              isEndOfText: true,
            ),
          ),
        );
      });

      test('returns correct $SearchResultSnippet '
          'when query matches case-insensitive text', () {
        const query = 'NOSTRUD';
        final extractor = createSubject();
        expect(
          extractor.extract(
            text: text,
            query: query,
          ),
          SearchResultSnippet(
            text:
                'magna aliqua. Ut enim ad minim veniam, quis nostrud '
                'exercitation ullamco laboris nisi ut aliquip',
            match: SearchMatch(
              start: 44,
              end: 51,
              isStartOfText: false,
              isEndOfText: false,
            ),
          ),
        );
      });

      test('returns correct $SearchResultSnippet '
          'when text is short', () {
        const text = 'Lorem ipsum dolor';
        const query = 'ipsum';
        final extractor = createSubject();
        expect(
          extractor.extract(
            text: text,
            query: query,
          ),
          SearchResultSnippet(
            text: text,
            match: SearchMatch(
              start: 6,
              end: 11,
              isStartOfText: true,
              isEndOfText: true,
            ),
          ),
        );
      });

      test('returns correct $SearchResultSnippet '
          'when query is empty', () {
        const query = '';
        final extractor = createSubject();
        expect(
          extractor.extract(
            text: text,
            query: query,
          ),
          SearchResultSnippet(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                'sed do eiusmod tempor incididunt',
            match: SearchMatch(
              start: 0,
              end: 0,
              isStartOfText: true,
              isEndOfText: false,
            ),
          ),
        );
      });
    });
  });
}
