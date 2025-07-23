import 'package:reply_parser/reply_parser.dart';

class ReplyDataParser {
  const ReplyDataParser({
    ReplyCommentDataParser? replyCommentDataParser,
    ReplyFormDataParser? replyFormDataParser,
  }) : _commentDataParser =
           replyCommentDataParser ?? const ReplyCommentDataParser(),
       _formDataParser = replyFormDataParser ?? const ReplyFormDataParser();

  final ReplyCommentDataParser _commentDataParser;
  final ReplyFormDataParser _formDataParser;

  ReplyData parse(Element fatItem) {
    var commentData = ReplyCommentData.empty;

    final athing = fatItem.querySelector('.athing');

    if (athing != null) {
      commentData = _commentDataParser.parse(athing);
    }

    final formData = _formDataParser.parse(fatItem);

    return ReplyData(
      commentData: commentData,
      formData: formData,
    );
  }
}
