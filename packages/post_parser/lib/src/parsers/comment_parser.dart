import 'package:post_parser/post_parser.dart';

class CommentParser {
  const CommentParser({
    BaseCommentParser? baseCommentParser,
    UpvoteUrlParser? upvoteUrlParser,
    HasBeenUpvotedParser? hasBeenUpvotedParser,
    ScoreParser? scoreParser,
  }) : _baseParser = baseCommentParser ?? const BaseCommentParser(),
       _upvoteUrlParser = upvoteUrlParser ?? const UpvoteUrlParser(),
       _hasBeenUpvotedParser =
           hasBeenUpvotedParser ?? const HasBeenUpvotedParser(),
       _scoreParser = scoreParser ?? const ScoreParser();

  final BaseCommentParser _baseParser;
  final UpvoteUrlParser _upvoteUrlParser;
  final HasBeenUpvotedParser _hasBeenUpvotedParser;
  final ScoreParser _scoreParser;

  CommentData parse(Element element) {
    final base = _baseParser.parse(element);
    final score = _scoreParser.parse(element);

    if (score != null) {
      return CurrentUserCommentData.fromParsed(
        base: base,
        score: score,
      );
    } else {
      final upvoteUrl = _upvoteUrlParser.parse(element);
      final hasBeenUpvoted = _hasBeenUpvotedParser.parse(element);

      return OtherUserCommentData.fromParsed(
        base: base,
        upvoteUrl: upvoteUrl,
        hasBeenUpvoted: hasBeenUpvoted,
      );
    }
  }
}
