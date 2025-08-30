import 'package:feed_parser/feed_parser.dart';

class PostTitleRowParser {
  const PostTitleRowParser({
    BaseTitleRowParser? baseTitleRowParser,
    UpvoteUrlParser? upvoteUrlParser,
    HasBeenUpvotedParser? hasBeenUpvotedParser,
  }) : _baseParser = baseTitleRowParser ?? const BaseTitleRowParser(),
       _upvoteUrlParser = upvoteUrlParser ?? const UpvoteUrlParser(),
       _hasBeenUpvotedParser =
           hasBeenUpvotedParser ?? const HasBeenUpvotedParser();

  final BaseTitleRowParser _baseParser;
  final UpvoteUrlParser _upvoteUrlParser;
  final HasBeenUpvotedParser _hasBeenUpvotedParser;

  PostTitleRowData parse(Element athing) {
    final base = _baseParser.parse(athing);
    final upvoteUrl = _upvoteUrlParser.parse(athing);
    final hasBeenUpvoted = _hasBeenUpvotedParser.parse(athing);

    return PostTitleRowData.fromParsed(
      base: base,
      upvoteUrl: upvoteUrl,
      hasBeenUpvoted: hasBeenUpvoted,
    );
  }
}
