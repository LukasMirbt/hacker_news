import 'package:feed_parser/feed_parser.dart';

class FeedParser {
  const FeedParser({
    HtmlParser? htmlParser,
    FeedItemParser? feedItemParser,
    MoreLinkParser? moreLinkParser,
  }) : _htmlParser = htmlParser ?? const HtmlParser(),
       _itemParser = feedItemParser ?? const FeedItemParser(),
       _moreLinkParser = moreLinkParser ?? const MoreLinkParser();

  final HtmlParser _htmlParser;
  final FeedItemParser _itemParser;
  final MoreLinkParser _moreLinkParser;

  FeedPageData parse(String html) {
    final document = _htmlParser.parse(html);

    final elements = document.querySelectorAll('.athing.submission');

    final items = [
      for (final element in elements) _itemParser.parse(element),
    ];

    final moreLink = _moreLinkParser.parse(document);

    return FeedPageData(
      items: items,
      moreLink: moreLink,
    );
  }
}
