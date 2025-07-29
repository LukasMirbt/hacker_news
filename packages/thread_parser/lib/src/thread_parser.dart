import 'package:thread_parser/thread_parser.dart';

class ThreadParser {
  const ThreadParser({
    HtmlParser? htmlParser,
    ThreadFeedParser? threadCommentListParser,
    MoreLinkParser? moreLinkParser,
  }) : _htmlParser = htmlParser ?? const HtmlParser(),
       _commentListParser = threadCommentListParser ?? const ThreadFeedParser(),
       _moreLinkParser = moreLinkParser ?? const MoreLinkParser();

  final HtmlParser _htmlParser;
  final ThreadFeedParser _commentListParser;
  final MoreLinkParser _moreLinkParser;

  ThreadFeedPageData parse(String html) {
    final document = _htmlParser.parse(html);
    final comments = _commentListParser.parse(document);
    final moreLink = _moreLinkParser.parse(document);

    return ThreadFeedPageData(
      comments: comments,
      moreLink: moreLink,
    );
  }
}
