import 'package:feed_parser/feed_parser.dart';

class FeedParser {
  const FeedParser({
    HtmlParser? htmlParser,
    FeedItemParser? feedItemParser,
    MoreLinkParser? moreLinkParser,
  }) : _htmlParser = htmlParser ?? const HtmlParser(),
       _listItemParser = feedItemParser ?? const FeedItemParser(),
       _moreLinkParser = moreLinkParser ?? const MoreLinkParser();

  final HtmlParser _htmlParser;
  final FeedItemParser _listItemParser;
  final MoreLinkParser _moreLinkParser;

  FeedPageData parse(String html) {
    final document = _htmlParser.parse(html);

    final elements = document.querySelectorAll('.athing.submission');

    final items = [
      for (final element in elements) _listItemParser.parse(element),
    ];

    final moreLink = _moreLinkParser.parse(document);

    return FeedPageData(
      items: items,
      moreLink: moreLink,
    );
  }
}
