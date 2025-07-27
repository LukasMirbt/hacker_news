import 'package:feed_parser/feed_parser.dart';

class FeedItemParser {
  const FeedItemParser({
    TitleRowParser? titleRowParser,
    SubtitleRowParser? subtitleRowParser,
  }) : _titleRowParser = titleRowParser ?? const TitleRowParser(),
       _subtitleRowParser = subtitleRowParser ?? const SubtitleRowParser();

  final TitleRowParser _titleRowParser;
  final SubtitleRowParser _subtitleRowParser;

  FeedItemData parse(Element athing) {
    final titleRowData = _titleRowParser.parse(athing);

    final subtitleRow = athing.nextElementSibling;

    var subtitleRowData = SubtitleRowData.empty;

    if (subtitleRow != null) {
      subtitleRowData = _subtitleRowParser.parse(subtitleRow);
    }

    return FeedItemData(
      titleRowData: titleRowData,
      subtitleRowData: subtitleRowData,
    );
  }
}
