import 'package:reply_form_parser/reply_form_parser.dart';

class ReplyFormParser {
  const ReplyFormParser({
    HtmlParser? htmlParser,
    ReplyFormDataParser? replyFormDataParser,
  }) : _htmlParser = htmlParser ?? const HtmlParser(),
       _dataParser = replyFormDataParser ?? const ReplyFormDataParser();

  final HtmlParser _htmlParser;
  final ReplyFormDataParser _dataParser;

  ReplyFormData parse(String html) {
    final document = _htmlParser.parse(html);
    final fatItem = document.querySelector('.fatitem');

    var data = ReplyFormData.empty;

    if (fatItem != null) {
      data = _dataParser.parse(fatItem);
    }

    return data;
  }
}
