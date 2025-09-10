// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/post_search/post_search.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockTextParser extends Mock implements TextParser {}

class _MockSnipperExtractor extends Mock implements SnippetExtractor {}

class _MockSearchResultSnippet extends Mock implements SearchResultSnippet {}

void main() {
  group(SearchResultListModel, () {
    late TextParser textParser;
    late SnippetExtractor snippetExtractor;

    setUp(() {
      textParser = _MockTextParser();
      snippetExtractor = _MockSnipperExtractor();
    });

    SearchResultListModel createSubject({
      List<Comment>? comments,
      String? query,
    }) {
      return SearchResultListModel(
        comments: comments ?? [],
        query: query ?? '',
        textParser: textParser,
        snippetExtractor: snippetExtractor,
      );
    }

    group('items', () {
      test('returns empty list when query.isEmpty', () {
        final model = createSubject();
        expect(model.items, isEmpty);
      });

      test('returns correct items when !query.isEmpty', () {
        const query = 'second';

        const firstHtmlText = 'firstHtmlText';
        const secondHtmlText = 'secondHtmlText';

        final firstComment = OtherUserCommentPlaceholder(
          htmlText: firstHtmlText,
        );
        final secondComment = OtherUserCommentPlaceholder(
          htmlText: secondHtmlText,
        );
        final comments = [firstComment, secondComment];

        const firstText = 'firstText';
        const secondText = 'secondText';

        final parseFirstText = () => textParser.parse(
          firstComment.htmlText,
        );
        final parseSecondText = () => textParser.parse(
          secondComment.htmlText,
        );

        when(parseFirstText).thenReturn(firstText);
        when(parseSecondText).thenReturn(secondText);

        final snippet = _MockSearchResultSnippet();

        final extractSnippet = () => snippetExtractor.extract(
          text: secondText,
          query: query,
        );
        when(extractSnippet).thenReturn(snippet);

        final model = createSubject(
          comments: comments,
          query: query,
        );

        expect(
          model.items,
          [
            SearchResultModel(
              comment: secondComment,
              snippet: snippet,
            ),
          ],
        );

        verify(parseFirstText).called(1);
        verify(parseSecondText).called(1);
        verify(extractSnippet).called(1);
      });

      test('returns 100 results at most', () {
        const query = 'text';
        const text = 'text';
        final snippet = _MockSearchResultSnippet();

        final parseText = () => textParser.parse(any());

        final extractSnippet = () => snippetExtractor.extract(
          text: text,
          query: query,
        );

        when(parseText).thenReturn(text);
        when(extractSnippet).thenReturn(snippet);

        final model = createSubject(
          query: query,
          comments: List.generate(
            200,
            (index) => OtherUserCommentPlaceholder(),
          ),
        );

        expect(model.items.length, 100);
      });
    });
  });
}
