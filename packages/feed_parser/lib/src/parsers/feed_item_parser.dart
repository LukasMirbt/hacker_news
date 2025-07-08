import 'package:feed_parser/feed_parser.dart';

class FeedItemParser {
  const FeedItemParser({
    TitleRowDataParser? titleRowDataParser,
    SubtitleRowDataParser? subtitleRowDataParser,
  }) : _titleRowDataParser = titleRowDataParser ?? const TitleRowDataParser(),
       _subtitleRowDataParser =
           subtitleRowDataParser ?? const SubtitleRowDataParser();

  final TitleRowDataParser _titleRowDataParser;
  final SubtitleRowDataParser _subtitleRowDataParser;

  FeedItemData parse(Element athing) {
    final titleRowData = _titleRowDataParser.parse(athing);

    final subtitleRow = athing.nextElementSibling;

    var subtitleRowData = SubtitleRowData.empty;

    if (subtitleRow != null) {
      subtitleRowData = _subtitleRowDataParser.parse(subtitleRow);
    }

    return FeedItemData(
      titleRowData: titleRowData,
      subtitleRowData: subtitleRowData,
    );
  }
}
