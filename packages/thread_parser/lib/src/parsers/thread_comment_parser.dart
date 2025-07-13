import 'package:thread_parser/thread_parser.dart';

class ThreadCommentParser {
  const ThreadCommentParser({
    IdParser? idParser,
    HnuserParser? hnuserParser,
    AgeParser? ageParser,
    CommentHtmlTextParser? commentHtmlTextParser,
    IndentParser? indentParser,
    ScoreParser? scoreParser,
    HasBeenUpvotedParser? hasBeenUpvotedParser,
    ParentUrlParser? parentUrlParser,
    ContextUrlParser? contextUrlParser,
  }) : _idParser = idParser ?? const IdParser(),
       _hnuserParser = hnuserParser ?? const HnuserParser(),
       _ageParser = ageParser ?? const AgeParser(),
       _commentHtmlTextParser =
           commentHtmlTextParser ?? const CommentHtmlTextParser(),
       _indentParser = indentParser ?? const IndentParser(),
       _scoreParser = scoreParser ?? const ScoreParser(),
       _hasBeenUpvotedParser =
           hasBeenUpvotedParser ?? const HasBeenUpvotedParser(),
       _parentUrlParser = parentUrlParser ?? const ParentUrlParser(),
       _contextUrlParser = contextUrlParser ?? const ContextUrlParser();

  final IdParser _idParser;
  final HnuserParser _hnuserParser;
  final AgeParser _ageParser;
  final CommentHtmlTextParser _commentHtmlTextParser;
  final IndentParser _indentParser;
  final ScoreParser _scoreParser;
  final HasBeenUpvotedParser _hasBeenUpvotedParser;
  final ParentUrlParser _parentUrlParser;
  final ContextUrlParser _contextUrlParser;

  ThreadCommentData parse(Element athing) {
    final id = _idParser.parse(athing);
    final hnuser = _hnuserParser.parse(athing);
    final age = _ageParser.parse(athing);
    final htmlText = _commentHtmlTextParser.parse(athing);
    final indent = _indentParser.parse(athing);
    final score = _scoreParser.parse(athing);
    final hasBeenUpvoted = _hasBeenUpvotedParser.parse(athing);
    final parentUrl = _parentUrlParser.parse(athing);
    final contextUrl = _contextUrlParser.parse(athing);

    return ThreadCommentData.fromParsed(
      id: id,
      hnuser: hnuser,
      age: age,
      htmlText: htmlText,
      indent: indent,
      score: score,
      hasBeenUpvoted: hasBeenUpvoted,
      parentUrl: parentUrl,
      contextUrl: contextUrl,
    );
  }
}
