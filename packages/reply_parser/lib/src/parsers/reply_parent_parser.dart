import 'package:reply_parser/reply_parser.dart';

class ReplyParentParser {
  const ReplyParentParser({
    BaseReplyParentParser? baseReplyParentParser,
    ScoreParser? scoreParser,
    UpvoteUrlParser? upvoteUrlParser,
    HasBeenUpvotedParser? hasBeenUpvotedParser,
  }) : _baseParser = baseReplyParentParser ?? const BaseReplyParentParser(),
       _scoreParser = scoreParser ?? const ScoreParser(),
       _upvoteUrlParser = upvoteUrlParser ?? const UpvoteUrlParser(),
       _hasBeenUpvotedParser =
           hasBeenUpvotedParser ?? const HasBeenUpvotedParser();

  final BaseReplyParentParser _baseParser;
  final ScoreParser _scoreParser;
  final UpvoteUrlParser _upvoteUrlParser;
  final HasBeenUpvotedParser _hasBeenUpvotedParser;

  ReplyParentData parse(Element athing) {
    final base = _baseParser.parse(athing);
    final score = _scoreParser.parse(athing);

    if (score != null) {
      return CurrentUserReplyParentData.fromParsed(
        base: base,
        score: score,
      );
    } else {
      final upvoteUrl = _upvoteUrlParser.parse(athing);
      final hasBeenUpvoted = _hasBeenUpvotedParser.parse(athing);

      return OtherUserReplyParentData.fromParsed(
        base: base,
        upvoteUrl: upvoteUrl,
        hasBeenUpvoted: hasBeenUpvoted,
      );
    }
  }
}
