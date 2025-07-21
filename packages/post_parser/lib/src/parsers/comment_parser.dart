import 'package:post_parser/post_parser.dart';

class CommentParser {
  const CommentParser({
    IdParser? idParser,
    IndentParser? indentParser,
    UpvoteUrlParser? upvoteUrlParser,
    HasBeenUpvotedParser? hasBeenUpvotedParser,
    ScoreParser? scoreParser,
    HnuserParser? hnuserParser,
    AgeParser? ageParser,
    CommentHtmlTextParser? commentHtmlTextParser,
    ReplyUrlParser? replyUrlParser,
  }) : _idParser = idParser ?? const IdParser(),
       _indentParser = indentParser ?? const IndentParser(),
       _upvoteUrlParser = upvoteUrlParser ?? const UpvoteUrlParser(),
       _hasBeenUpvotedParser =
           hasBeenUpvotedParser ?? const HasBeenUpvotedParser(),
       _scoreParser = scoreParser ?? const ScoreParser(),
       _hnuserParser = hnuserParser ?? const HnuserParser(),
       _ageParser = ageParser ?? const AgeParser(),
       _commentHtmlTextParser =
           commentHtmlTextParser ?? const CommentHtmlTextParser(),
       _replyUrlParser = replyUrlParser ?? const ReplyUrlParser();

  final IdParser _idParser;
  final IndentParser _indentParser;
  final UpvoteUrlParser _upvoteUrlParser;
  final HasBeenUpvotedParser _hasBeenUpvotedParser;
  final ScoreParser _scoreParser;
  final HnuserParser _hnuserParser;
  final AgeParser _ageParser;
  final CommentHtmlTextParser _commentHtmlTextParser;
  final ReplyUrlParser _replyUrlParser;

  CommentData parse(Element element) {
    final id = _idParser.parse(element);
    final indent = _indentParser.parse(element);
    final upvoteUrl = _upvoteUrlParser.parse(element);
    final hasBeenUpvoted = _hasBeenUpvotedParser.parse(element);
    final score = _scoreParser.parse(element);
    final hnuser = _hnuserParser.parse(element);
    final age = _ageParser.parse(element);
    final htmlText = _commentHtmlTextParser.parse(element);
    final replyUrl = _replyUrlParser.parse(element);

    return CommentData.fromParsed(
      id: id,
      indent: indent,
      upvoteUrl: upvoteUrl,
      hasBeenUpvoted: hasBeenUpvoted,
      score: score,
      hnuser: hnuser,
      age: age,
      htmlText: htmlText,
      replyUrl: replyUrl,
    );
  }
}
