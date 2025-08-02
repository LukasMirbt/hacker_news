import 'package:reply_parser/reply_parser.dart';

class BaseReplyParentParser {
  const BaseReplyParentParser({
    IdParser? idParser,
    HnuserParser? hnuserParser,
    AgeParser? ageParser,
    CommentHtmlTextParser? commentHtmlTextParser,
  }) : _idParser = idParser ?? const IdParser(),
       _hnuserParser = hnuserParser ?? const HnuserParser(),
       _ageParser = ageParser ?? const AgeParser(),
       _htmlTextParser = commentHtmlTextParser ?? const CommentHtmlTextParser();

  final IdParser _idParser;
  final HnuserParser _hnuserParser;
  final AgeParser _ageParser;
  final CommentHtmlTextParser _htmlTextParser;

  BaseReplyParentData parse(Element athing) {
    final id = _idParser.parse(athing);
    final hnuser = _hnuserParser.parse(athing);
    final age = _ageParser.parse(athing);
    final htmlText = _htmlTextParser.parse(athing);

    return BaseReplyParentData.fromParsed(
      id: id,
      hnuser: hnuser,
      age: age,
      htmlText: htmlText,
    );
  }
}
