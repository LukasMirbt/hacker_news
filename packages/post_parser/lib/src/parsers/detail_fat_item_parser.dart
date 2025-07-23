import 'package:post_parser/post_parser.dart';

class DetailFatItemParser {
  const DetailFatItemParser({
    DetailTitleRowParser? titleRowParser,
    DetailSubtitleRowParser? subtitleRowParser,
    DetailHtmlTextParser? htmlTextParser,
    DetailCommentFormParser? commentFormParser,
  }) : _titleRowParser = titleRowParser ?? const DetailTitleRowParser(),
       _subtitleRowParser =
           subtitleRowParser ?? const DetailSubtitleRowParser(),
       _htmlTextParser = htmlTextParser ?? const DetailHtmlTextParser(),
       _commentFormParser =
           commentFormParser ?? const DetailCommentFormParser();

  final DetailTitleRowParser _titleRowParser;
  final DetailSubtitleRowParser _subtitleRowParser;
  final DetailHtmlTextParser _htmlTextParser;
  final DetailCommentFormParser _commentFormParser;

  DetailFatItemData parse(Element fatItem) {
    var titleRowData = DetailTitleRowData.empty;
    var subtitleRowData = DetailSubtitleRowData.empty;

    // Can be both a submission and a comment.
    final athing = fatItem.querySelector('.athing');

    if (athing != null) {
      titleRowData = _titleRowParser.parse(athing);
    }

    final subtext = fatItem.querySelector('.subtext');

    if (subtext != null) {
      subtitleRowData = _subtitleRowParser.parse(subtext);
    }

    final htmlText = _htmlTextParser.parse(fatItem);
    final commentFormData = _commentFormParser.parse(fatItem);

    return DetailFatItemData(
      titleRowData: titleRowData,
      subtitleRowData: subtitleRowData,
      htmlText: htmlText,
      commentFormData: commentFormData,
    );
  }
}
