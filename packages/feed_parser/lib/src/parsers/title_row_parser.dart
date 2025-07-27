import 'package:feed_parser/feed_parser.dart';

class TitleRowParser {
  const TitleRowParser({
    IdParser? idParser,
    RankParser? rankParser,
    TitleParser? titleParser,
    UrlParser? urlParser,
    UrlHostParser? urlHostParser,
    UpvoteUrlParser? upvoteUrlParser,
    HasBeenUpvotedParser? hasBeenUpvotedParser,
  }) : _idParser = idParser ?? const IdParser(),
       _rankParser = rankParser ?? const RankParser(),
       _titleParser = titleParser ?? const TitleParser(),
       _urlParser = urlParser ?? const UrlParser(),
       _urlHostParser = urlHostParser ?? const UrlHostParser(),
       _upvoteUrlParser = upvoteUrlParser ?? const UpvoteUrlParser(),
       _hasBeenUpvotedParser =
           hasBeenUpvotedParser ?? const HasBeenUpvotedParser();

  final IdParser _idParser;
  final RankParser _rankParser;
  final TitleParser _titleParser;
  final UrlParser _urlParser;
  final UrlHostParser _urlHostParser;
  final UpvoteUrlParser _upvoteUrlParser;
  final HasBeenUpvotedParser _hasBeenUpvotedParser;

  TitleRowData parse(Element athing) {
    final id = _idParser.parse(athing);
    final rank = _rankParser.parse(athing);
    final title = _titleParser.parse(athing);
    final url = _urlParser.parse(athing);
    final urlHost = _urlHostParser.parse(athing);
    final upvoteUrl = _upvoteUrlParser.parse(athing);
    final hasBeenUpvoted = _hasBeenUpvotedParser.parse(athing);

    return TitleRowData.fromParsed(
      id: id,
      rank: rank,
      title: title,
      url: url,
      urlHost: urlHost,
      upvoteUrl: upvoteUrl,
      hasBeenUpvoted: hasBeenUpvoted,
    );
  }
}
