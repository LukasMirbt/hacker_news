import 'package:thread_parser/thread_parser.dart';

class ThreadCommentParser {
  const ThreadCommentParser({
    BaseThreadCommentParser? baseThreadCommentParser,
    ScoreParser? scoreParser,
    UpvoteUrlParser? upvoteUrlParser,
    HasBeenUpvotedParser? hasBeenUpvotedParser,
  }) : _baseParser = baseThreadCommentParser ?? const BaseThreadCommentParser(),
       _scoreParser = scoreParser ?? const ScoreParser(),
       _hasBeenUpvotedParser =
           hasBeenUpvotedParser ?? const HasBeenUpvotedParser(),
       _upvoteUrlParser = upvoteUrlParser ?? const UpvoteUrlParser();

  final BaseThreadCommentParser _baseParser;
  final ScoreParser _scoreParser;
  final HasBeenUpvotedParser _hasBeenUpvotedParser;
  final UpvoteUrlParser _upvoteUrlParser;

  ThreadCommentData parse(Element athing) {
    final base = _baseParser.parse(athing);
    final score = _scoreParser.parse(athing);

    if (score != null) {
      return CurrentUserThreadCommentData.fromParsed(
        base: base,
        score: score,
      );
    } else {
      final hasBeenUpvoted = _hasBeenUpvotedParser.parse(athing);
      final upvoteUrl = _upvoteUrlParser.parse(athing);

      return OtherUserThreadCommentData.fromParsed(
        base: base,
        upvoteUrl: upvoteUrl,
        hasBeenUpvoted: hasBeenUpvoted,
      );
    }
  }
}
