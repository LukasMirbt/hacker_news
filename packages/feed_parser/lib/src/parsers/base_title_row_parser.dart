import 'package:feed_parser/feed_parser.dart';

class BaseTitleRowParser {
  const BaseTitleRowParser({
    IdParser? idParser,
    RankParser? rankParser,
    TitleParser? titleParser,
    UrlParser? urlParser,
    UrlHostParser? urlHostParser,
  }) : _idParser = idParser ?? const IdParser(),
       _rankParser = rankParser ?? const RankParser(),
       _titleParser = titleParser ?? const TitleParser(),
       _urlParser = urlParser ?? const UrlParser(),
       _urlHostParser = urlHostParser ?? const UrlHostParser();

  final IdParser _idParser;
  final RankParser _rankParser;
  final TitleParser _titleParser;
  final UrlParser _urlParser;
  final UrlHostParser _urlHostParser;

  BaseTitleRowData parse(Element athing) {
    final id = _idParser.parse(athing);
    final rank = _rankParser.parse(athing);
    final title = _titleParser.parse(athing);
    final url = _urlParser.parse(athing);
    final urlHost = _urlHostParser.parse(athing);

    return BaseTitleRowData.fromParsed(
      id: id,
      rank: rank,
      title: title,
      url: url,
      urlHost: urlHost,
    );
  }
}
