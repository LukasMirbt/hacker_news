import 'package:post_parser/post_parser.dart';

class DetailFatItemDataPlaceholder extends DetailFatItemData {
  DetailFatItemDataPlaceholder({
    DetailTitleRowData? titleRowData,
    DetailSubtitleRowData? subtitleRowData,
    DetailCommentFormData? commentFormData,
    super.htmlText,
  }) : super(
         titleRowData: titleRowData ?? const DetailTitleRowDataPlaceholder(),
         subtitleRowData: subtitleRowData ?? DetailSubtitleRowDataPlaceholder(),
         commentFormData:
             commentFormData ?? const DetailCommentFormDataPlaceholder(),
       );
}
