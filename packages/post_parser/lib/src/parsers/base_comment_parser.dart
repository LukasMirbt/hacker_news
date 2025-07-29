import 'package:post_parser/post_parser.dart';

class BaseCommentParser {
  const BaseCommentParser({
    IdParser? idParser,
    IndentParser? indentParser,
    HnuserParser? hnuserParser,
    AgeParser? ageParser,
    CommentHtmlTextParser? commentHtmlTextParser,
    ReplyUrlParser? replyUrlParser,
  }) : _idParser = idParser ?? const IdParser(),
       _indentParser = indentParser ?? const IndentParser(),
       _hnuserParser = hnuserParser ?? const HnuserParser(),
       _ageParser = ageParser ?? const AgeParser(),
       _commentHtmlTextParser =
           commentHtmlTextParser ?? const CommentHtmlTextParser(),
       _replyUrlParser = replyUrlParser ?? const ReplyUrlParser();

  final IdParser _idParser;
  final IndentParser _indentParser;
  final HnuserParser _hnuserParser;
  final AgeParser _ageParser;
  final CommentHtmlTextParser _commentHtmlTextParser;
  final ReplyUrlParser _replyUrlParser;

  BaseCommentData parse(Element element) {
    final id = _idParser.parse(element);
    final indent = _indentParser.parse(element);
    final hnuser = _hnuserParser.parse(element);
    final age = _ageParser.parse(element);
    final htmlText = _commentHtmlTextParser.parse(element);
    final replyUrl = _replyUrlParser.parse(element);

    return BaseCommentData.fromParsed(
      id: id,
      indent: indent,
      hnuser: hnuser,
      age: age,
      htmlText: htmlText,
      replyUrl: replyUrl,
    );
  }
}
