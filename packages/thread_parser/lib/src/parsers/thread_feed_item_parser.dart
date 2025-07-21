import 'package:thread_parser/thread_parser.dart';

class ThreadFeedItemParser {
  const ThreadFeedItemParser({
    IdParser? idParser,
    HnuserParser? hnuserParser,
    AgeParser? ageParser,
    CommentHtmlTextParser? commentHtmlTextParser,
    IndentParser? indentParser,
    ScoreParser? scoreParser,
    HasBeenUpvotedParser? hasBeenUpvotedParser,
    UpvoteUrlParser? upvoteUrlParser,
    ParentUrlParser? parentUrlParser,
    ContextUrlParser? contextUrlParser,
    OnUrlParser? onUrlParser,
    ReplyUrlParser? replyUrlParser,
  }) : _idParser = idParser ?? const IdParser(),
       _hnuserParser = hnuserParser ?? const HnuserParser(),
       _ageParser = ageParser ?? const AgeParser(),
       _commentHtmlTextParser =
           commentHtmlTextParser ?? const CommentHtmlTextParser(),
       _indentParser = indentParser ?? const IndentParser(),
       _scoreParser = scoreParser ?? const ScoreParser(),
       _hasBeenUpvotedParser =
           hasBeenUpvotedParser ?? const HasBeenUpvotedParser(),
       _upvoteUrlParser = upvoteUrlParser ?? const UpvoteUrlParser(),
       _parentUrlParser = parentUrlParser ?? const ParentUrlParser(),
       _contextUrlParser = contextUrlParser ?? const ContextUrlParser(),
       _onUrlParser = onUrlParser ?? const OnUrlParser(),
       _replyUrlParser = replyUrlParser ?? const ReplyUrlParser();

  final IdParser _idParser;
  final HnuserParser _hnuserParser;
  final AgeParser _ageParser;
  final CommentHtmlTextParser _commentHtmlTextParser;
  final IndentParser _indentParser;
  final ScoreParser _scoreParser;
  final HasBeenUpvotedParser _hasBeenUpvotedParser;
  final UpvoteUrlParser _upvoteUrlParser;
  final ParentUrlParser _parentUrlParser;
  final ContextUrlParser _contextUrlParser;
  final OnUrlParser _onUrlParser;
  final ReplyUrlParser _replyUrlParser;

  ThreadFeedItemData parse(Element athing) {
    final id = _idParser.parse(athing);
    final hnuser = _hnuserParser.parse(athing);
    final age = _ageParser.parse(athing);
    final htmlText = _commentHtmlTextParser.parse(athing);
    final indent = _indentParser.parse(athing);
    final score = _scoreParser.parse(athing);
    final hasBeenUpvoted = _hasBeenUpvotedParser.parse(athing);
    final upvoteUrl = _upvoteUrlParser.parse(athing);
    final parentUrl = _parentUrlParser.parse(athing);
    final contextUrl = _contextUrlParser.parse(athing);
    final onUrl = _onUrlParser.parse(athing);
    final replyUrl = _replyUrlParser.parse(athing);

    return ThreadFeedItemData.fromParsed(
      id: id,
      hnuser: hnuser,
      age: age,
      htmlText: htmlText,
      indent: indent,
      score: score,
      hasBeenUpvoted: hasBeenUpvoted,
      upvoteUrl: upvoteUrl,
      parentUrl: parentUrl,
      contextUrl: contextUrl,
      onUrl: onUrl,
      replyUrl: replyUrl,
    );
  }
}
