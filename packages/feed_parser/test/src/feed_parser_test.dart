// ignore_for_file: prefer_function_declarations_over_variables

import 'package:feed_parser/feed_parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockHtmlParser extends Mock implements HtmlParser {}

class _MockFeedItemParser extends Mock implements FeedItemParser {}

class _MockMoreLinkParser extends Mock implements MoreLinkParser {}

class _MockDocument extends Mock implements Document {}

class _MockElement extends Mock implements Element {}

class _MockFeedItemData extends Mock implements FeedItemData {}

void main() {
  group(FeedParser, () {
    late HtmlParser htmlParser;
    late FeedItemParser feedItemParser;
    late MoreLinkParser moreLinkParser;
    late Document document;

    setUp(() {
      htmlParser = _MockHtmlParser();
      feedItemParser = _MockFeedItemParser();
      moreLinkParser = _MockMoreLinkParser();
      document = _MockDocument();
    });

    FeedParser createSubject() {
      return FeedParser(
        htmlParser: htmlParser,
        feedItemParser: feedItemParser,
        moreLinkParser: moreLinkParser,
      );
    }

    group('parse', () {
      const html = 'html';
      const moreLink = 'moreLink';

      final element = _MockElement();
      final elements = [element];

      final listItem = _MockFeedItemData();
      final items = [listItem];

      final parseHtml = () => htmlParser.parse(html);

      final querySelectorAll = () =>
          document.querySelectorAll('.athing.submission');

      final parseItem = () => feedItemParser.parse(element);
      final parseMoreLink = () => moreLinkParser.parse(document);

      test('returns $FeedPageData', () {
        when(parseHtml).thenReturn(document);
        when(querySelectorAll).thenReturn(elements);
        when(parseItem).thenReturn(listItem);
        when(parseMoreLink).thenReturn(moreLink);
        final parser = createSubject();
        expect(
          parser.parse(html),
          FeedPageData(
            items: items,
            moreLink: moreLink,
          ),
        );
        verify(parseHtml).called(1);
        verify(querySelectorAll).called(1);
        verify(parseItem).called(elements.length);
        verify(parseMoreLink).called(1);
      });
    });
  });
}
