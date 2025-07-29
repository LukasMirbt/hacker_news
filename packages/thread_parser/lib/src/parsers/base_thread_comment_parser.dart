import 'package:thread_parser/thread_parser.dart';

class BaseThreadCommentParser {
  const BaseThreadCommentParser({
    IdParser? idParser,
    IndentParser? indentParser,
    HnuserParser? hnuserParser,
    AgeParser? ageParser,
    CommentHtmlTextParser? commentHtmlTextParser,
    ReplyUrlParser? replyUrlParser,
    ParentUrlParser? parentUrlParser,
    ContextUrlParser? contextUrlParser,
    OnUrlParser? onUrlParser,
    OnTitleParser? onTitleParser,
  }) : _idParser = idParser ?? const IdParser(),
       _indentParser = indentParser ?? const IndentParser(),
       _hnuserParser = hnuserParser ?? const HnuserParser(),
       _ageParser = ageParser ?? const AgeParser(),
       _commentHtmlTextParser =
           commentHtmlTextParser ?? const CommentHtmlTextParser(),
       _replyUrlParser = replyUrlParser ?? const ReplyUrlParser(),
       _parentUrlParser = parentUrlParser ?? const ParentUrlParser(),
       _contextUrlParser = contextUrlParser ?? const ContextUrlParser(),
       _onUrlParser = onUrlParser ?? const OnUrlParser(),
       _onTitleParser = onTitleParser ?? const OnTitleParser();

  final IdParser _idParser;
  final HnuserParser _hnuserParser;
  final AgeParser _ageParser;
  final CommentHtmlTextParser _commentHtmlTextParser;
  final IndentParser _indentParser;
  final ParentUrlParser _parentUrlParser;
  final ContextUrlParser _contextUrlParser;
  final OnUrlParser _onUrlParser;
  final OnTitleParser _onTitleParser;
  final ReplyUrlParser _replyUrlParser;

  BaseThreadCommentData parse(Element athing) {
    final id = _idParser.parse(athing);
    final hnuser = _hnuserParser.parse(athing);
    final age = _ageParser.parse(athing);
    final htmlText = _commentHtmlTextParser.parse(athing);
    final indent = _indentParser.parse(athing);
    final parentUrl = _parentUrlParser.parse(athing);
    final contextUrl = _contextUrlParser.parse(athing);
    final onTitle = _onTitleParser.parse(athing);
    final onUrl = _onUrlParser.parse(athing);
    final replyUrl = _replyUrlParser.parse(athing);

    return BaseThreadCommentData.fromParsed(
      id: id,
      hnuser: hnuser,
      age: age,
      htmlText: htmlText,
      indent: indent,
      parentUrl: parentUrl,
      contextUrl: contextUrl,
      onUrl: onUrl,
      onTitle: onTitle,
      replyUrl: replyUrl,
    );
  }
}
