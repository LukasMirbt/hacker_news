import 'package:reply_parser/reply_parser.dart';

class ReplyPageParser {
  const ReplyPageParser({
    ReplyParentParser? replyParentParser,
    ReplyFormParser? replyFormParser,
  }) : _parentParser = replyParentParser ?? const ReplyParentParser(),
       _formParser = replyFormParser ?? const ReplyFormParser();

  final ReplyParentParser _parentParser;
  final ReplyFormParser _formParser;

  ReplyPageData parse(Element fatItem) {
    ReplyParentData parentData = OtherUserReplyParentData.empty;
    ReplyFormData? formData;

    final athing = fatItem.querySelector('.athing');

    if (athing != null) {
      parentData = _parentParser.parse(athing);
    }

    final form = fatItem.querySelector('form[action="comment"]');

    if (form != null) {
      formData = _formParser.parse(form);
    }

    return ReplyPageData(
      parentData: parentData,
      formData: formData,
    );
  }
}
