import 'package:feed_parser/feed_parser.dart';

class FeedItemDataPlaceholder extends FeedItemData {
  FeedItemDataPlaceholder({
    TitleRowData? titleRowData,
    SubtitleRowData? subtitleRowData,
  }) : super(
         titleRowData: titleRowData ?? const TitleRowDataPlaceholder(),
         subtitleRowData: subtitleRowData ?? SubtitleRowDataPlaceholder(),
       );
}
