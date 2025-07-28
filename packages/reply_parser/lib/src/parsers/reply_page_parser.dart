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
    var parentData = ReplyParentData.empty;

    final athing = fatItem.querySelector('.athing');

    if (athing != null) {
      parentData = _parentParser.parse(athing);
    }

    final formData = _formParser.parse(fatItem);

    return ReplyPageData(
      parentData: parentData,
      formData: formData,
    );
  }
}
