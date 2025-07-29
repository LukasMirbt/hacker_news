// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_parser/thread_parser.dart';

class _MockHtmlParser extends Mock implements HtmlParser {}

class _MockThreadCommentListParser extends Mock implements ThreadFeedParser {}

class _MockMoreLinkParser extends Mock implements MoreLinkParser {}

class _MockDocument extends Mock implements Document {}

class _MockOtherUserThreadCommentData extends Mock
    implements OtherUserThreadCommentData {}

void main() {
  group(ThreadParser, () {
    late HtmlParser htmlParser;
    late ThreadFeedParser commentListParser;
    late MoreLinkParser moreLinkParser;
    late Document document;

    setUp(() {
      htmlParser = _MockHtmlParser();
      commentListParser = _MockThreadCommentListParser();
      moreLinkParser = _MockMoreLinkParser();
      document = _MockDocument();
    });

    ThreadParser createSubject() {
      return ThreadParser(
        htmlParser: htmlParser,
        threadCommentListParser: commentListParser,
        moreLinkParser: moreLinkParser,
      );
    }

    group('parse', () {
      const html = 'html';
      final comments = [_MockOtherUserThreadCommentData()];
      const moreLink = 'moreLink';

      final parseHtml = () => htmlParser.parse(html);
      final parseCommentList = () => commentListParser.parse(document);
      final parseMoreLink = () => moreLinkParser.parse(document);

      test('returns $ThreadFeedPageData', () {
        when(parseHtml).thenReturn(document);
        when(parseCommentList).thenReturn(comments);
        when(parseMoreLink).thenReturn(moreLink);
        final parser = createSubject();
        expect(
          parser.parse(html),
          ThreadFeedPageData(
            comments: comments,
            moreLink: moreLink,
          ),
        );
        verify(parseHtml).called(1);
        verify(parseCommentList).called(1);
        verify(parseMoreLink).called(1);
      });
    });
  });
}
