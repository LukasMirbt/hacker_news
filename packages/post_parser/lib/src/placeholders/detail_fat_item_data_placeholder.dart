import 'package:post_parser/post_parser.dart';

class DetailFatItemDataPlaceholder extends DetailFatItemData {
  DetailFatItemDataPlaceholder({
    DetailTitleRowData? titleRowData,
    DetailSubtitleRowData? subtitleRowData,
    super.htmlText,
    super.hmac,
  }) : super(
         titleRowData: titleRowData ?? const DetailTitleRowDataPlaceholder(),
         subtitleRowData: subtitleRowData ?? DetailSubtitleRowDataPlaceholder(),
       );
}
