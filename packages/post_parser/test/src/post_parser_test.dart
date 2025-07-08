// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_parser/post_parser.dart';

class _MockHtmlParser extends Mock implements HtmlParser {}

class _MockDetailFatItemParser extends Mock implements DetailFatItemParser {}

class _MockCommentListParser extends Mock implements CommentListParser {}

class _MockDocument extends Mock implements Document {}

class _MockElement extends Mock implements Element {}

class _MockCommentData extends Mock implements CommentData {}

void main() {
  group(PostParser, () {
    late HtmlParser htmlParser;
    late DetailFatItemParser detailFatItemParser;
    late CommentListParser commentListParser;
    late Document document;

    setUp(() {
      htmlParser = _MockHtmlParser();
      detailFatItemParser = _MockDetailFatItemParser();
      commentListParser = _MockCommentListParser();
      document = _MockDocument();
    });

    PostParser createSubject() {
      return PostParser(
        htmlParser: htmlParser,
        detailFatItemParser: detailFatItemParser,
        commentListParser: commentListParser,
      );
    }

    group('parse', () {
      const html = 'html';

      final fatItemElement = _MockElement();
      final commentTreeElement = _MockElement();

      final fatItemData = DetailFatItemDataPlaceholder();
      final comments = [_MockCommentData()];

      final parseHtml = () => htmlParser.parse(html);

      final fatItemSelector = () => document.querySelector('.fatitem');

      final commentTreeSelector = () => document.querySelector('.comment-tree');

      final parseFatItem = () => detailFatItemParser.parse(fatItemElement);

      final parseCommentList = () =>
          commentListParser.parse(commentTreeElement);

      test('returns $PostData with correct values '
          'when data is non-null', () {
        when(parseHtml).thenReturn(document);
        when(fatItemSelector).thenReturn(fatItemElement);
        when(parseFatItem).thenReturn(fatItemData);
        when(commentTreeSelector).thenReturn(commentTreeElement);
        when(parseCommentList).thenReturn(comments);
        final parser = createSubject();
        expect(
          parser.parse(html),
          PostData(
            fatItemData: fatItemData,
            comments: comments,
          ),
        );
        verify(parseHtml).called(1);
        verify(fatItemSelector).called(1);
        verify(parseFatItem).called(1);
        verify(commentTreeSelector).called(1);
        verify(parseCommentList).called(1);
      });

      test('returns $PostData with correct values '
          'when fatItemData is null', () {
        when(parseHtml).thenReturn(document);
        final parser = createSubject();
        expect(
          parser.parse(html),
          PostData(
            fatItemData: DetailFatItemData.empty,
            comments: [],
          ),
        );
        verify(parseHtml).called(1);
      });
    });
  });
}
