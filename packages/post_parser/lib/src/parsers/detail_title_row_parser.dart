import 'package:post_parser/post_parser.dart';

class DetailTitleRowParser {
  const DetailTitleRowParser({
    IdParser? idParser,
    TitleParser? titleParser,
    UrlParser? urlParser,
    UpvoteUrlParser? upvoteUrlParser,
    HasBeenUpvotedParser? hasBeenUpvotedParser,
    UrlHostParser? urlHostParser,
  }) : _idParser = idParser ?? const IdParser(),
       _titleParser = titleParser ?? const TitleParser(),
       _urlParser = urlParser ?? const UrlParser(),
       _upvoteUrlParser = upvoteUrlParser ?? const UpvoteUrlParser(),
       _hasBeenUpvotedParser =
           hasBeenUpvotedParser ?? const HasBeenUpvotedParser(),
       _urlHostParser = urlHostParser ?? const UrlHostParser();

  final IdParser _idParser;
  final TitleParser _titleParser;
  final UrlParser _urlParser;
  final UpvoteUrlParser _upvoteUrlParser;
  final HasBeenUpvotedParser _hasBeenUpvotedParser;
  final UrlHostParser _urlHostParser;

  DetailTitleRowData parse(Element athing) {
    final id = _idParser.parse(athing);
    final title = _titleParser.parse(athing);
    final url = _urlParser.parse(athing);
    final upvoteUrl = _upvoteUrlParser.parse(athing);
    final hasBeenUpvoted = _hasBeenUpvotedParser.parse(athing);
    final urlHost = _urlHostParser.parse(athing);

    return DetailTitleRowData.fromParsed(
      id: id,
      title: title,
      url: url,
      upvoteUrl: upvoteUrl,
      hasBeenUpvoted: hasBeenUpvoted,
      urlHost: urlHost,
    );
  }
}
