import 'package:reply_parser/reply_parser.dart';

class ReplyParser {
  const ReplyParser({
    HtmlParser? htmlParser,
    ReplyDataParser? replyDataParser,
  }) : _htmlParser = htmlParser ?? const HtmlParser(),
       _dataParser = replyDataParser ?? const ReplyDataParser();

  final HtmlParser _htmlParser;
  final ReplyDataParser _dataParser;

  ReplyData parse(String html) {
    final document = _htmlParser.parse(html);
    final fatItem = document.querySelector('.fatitem');

    var data = ReplyData.empty;

    if (fatItem != null) {
      data = _dataParser.parse(fatItem);
    }

    return data;
  }
}
