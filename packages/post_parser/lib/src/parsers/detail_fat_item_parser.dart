import 'package:post_parser/post_parser.dart';

class DetailFatItemParser {
  const DetailFatItemParser({
    DetailTitleRowParser? titleRowParser,
    DetailSubtitleRowParser? subtitleRowParser,
    DetailHtmlTextParser? htmlTextParser,
    HmacParser? detailHmacParser,
  }) : _titleRowParser = titleRowParser ?? const DetailTitleRowParser(),
       _subtitleRowParser =
           subtitleRowParser ?? const DetailSubtitleRowParser(),
       _htmlTextParser = htmlTextParser ?? const DetailHtmlTextParser(),
       _hmacParser = detailHmacParser ?? const HmacParser();

  final DetailTitleRowParser _titleRowParser;
  final DetailSubtitleRowParser _subtitleRowParser;
  final DetailHtmlTextParser _htmlTextParser;
  final HmacParser _hmacParser;

  DetailFatItemData parse(Element fatItem) {
    var titleRowData = DetailTitleRowData.empty;
    var subtitleRowData = DetailSubtitleRowData.empty;
    String? htmlText;
    String? hmac;

    // Can be both a submission and a comment.
    final athing = fatItem.querySelector('.athing');

    if (athing != null) {
      titleRowData = _titleRowParser.parse(athing);
    }

    final subtext = fatItem.querySelector('.subtext');

    if (subtext != null) {
      subtitleRowData = _subtitleRowParser.parse(subtext);
    }

    htmlText = _htmlTextParser.parse(fatItem);
    hmac = _hmacParser.parse(fatItem);

    return DetailFatItemData(
      titleRowData: titleRowData,
      subtitleRowData: subtitleRowData,
      htmlText: htmlText,
      hmac: hmac,
    );
  }
}
