import 'package:post_parser/post_parser.dart';

class CommentParser {
  const CommentParser({
    BaseCommentParser? baseCommentParser,
    ScoreParser? scoreParser,
    UpvoteUrlParser? upvoteUrlParser,
    HasBeenUpvotedParser? hasBeenUpvotedParser,
  }) : _baseParser = baseCommentParser ?? const BaseCommentParser(),
       _scoreParser = scoreParser ?? const ScoreParser(),
       _upvoteUrlParser = upvoteUrlParser ?? const UpvoteUrlParser(),
       _hasBeenUpvotedParser =
           hasBeenUpvotedParser ?? const HasBeenUpvotedParser();

  final BaseCommentParser _baseParser;
  final ScoreParser _scoreParser;
  final UpvoteUrlParser _upvoteUrlParser;
  final HasBeenUpvotedParser _hasBeenUpvotedParser;

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
