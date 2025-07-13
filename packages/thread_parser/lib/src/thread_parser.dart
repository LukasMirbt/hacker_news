import 'package:thread_parser/thread_parser.dart';

class ThreadParser {
  const ThreadParser({
    HtmlParser? htmlParser,
    ThreadCommentListParser? threadCommentListParser,
    MoreLinkParser? moreLinkParser,
  }) : _htmlParser = htmlParser ?? const HtmlParser(),
       _commentListParser =
           threadCommentListParser ?? const ThreadCommentListParser(),
       _moreLinkParser = moreLinkParser ?? const MoreLinkParser();

  final HtmlParser _htmlParser;
  final ThreadCommentListParser _commentListParser;
  final MoreLinkParser _moreLinkParser;

  ThreadListPageData parse(String html) {
    final document = _htmlParser.parse(html);
    final comments = _commentListParser.parse(document);
    final moreLink = _moreLinkParser.parse(document);
    return ThreadListPageData(
      comments: comments,
      moreLink: moreLink,
    );
  }
}
