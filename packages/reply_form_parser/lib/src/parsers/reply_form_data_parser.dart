import 'package:reply_form_parser/reply_form_parser.dart';

class ReplyFormDataParser {
  const ReplyFormDataParser({
    ReplyFormTitleRowDataParser? replyFormTitleRowDataParser,
    CommentHtmlTextParser? commentHtmlTextParser,
    HmacParser? hmacParser,
  }) : _titleRowDataParser =
           replyFormTitleRowDataParser ?? const ReplyFormTitleRowDataParser(),
       _commentHtmlTextParser =
           commentHtmlTextParser ?? const CommentHtmlTextParser(),
       _hmacParser = hmacParser ?? const HmacParser();

  final ReplyFormTitleRowDataParser _titleRowDataParser;
  final CommentHtmlTextParser _commentHtmlTextParser;
  final HmacParser _hmacParser;

  ReplyFormData parse(Element fatItem) {
    var titleRowData = ReplyFormTitleRowData.empty;
    String? htmlText;
    String? hmac;

    final athing = fatItem.querySelector('.athing');

    if (athing != null) {
      titleRowData = _titleRowDataParser.parse(athing);
    }

    htmlText = _commentHtmlTextParser.parse(fatItem);
    hmac = _hmacParser.parse(fatItem);

    return ReplyFormData(
      titleRowData: titleRowData,
      htmlText: htmlText,
      hmac: hmac,
    );
  }
}
