import 'package:reply_parser/reply_parser.dart';

class ReplyParser {
  const ReplyParser({
    HtmlParser? htmlParser,
    ReplyPageParser? replyPageParser,
  }) : _htmlParser = htmlParser ?? const HtmlParser(),
       _pageParser = replyPageParser ?? const ReplyPageParser();

  final HtmlParser _htmlParser;
  final ReplyPageParser _pageParser;

  ReplyPageData parse(String html) {
    final document = _htmlParser.parse(html);
    final fatItem = document.querySelector('.fatitem');

    var data = ReplyPageData.empty;

    if (fatItem != null) {
      data = _pageParser.parse(fatItem);
    }

    return data;
  }
}
