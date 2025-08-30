import 'package:feed_parser/feed_parser.dart';

class PostFeedItemDataPlaceholder extends PostFeedItemData {
  PostFeedItemDataPlaceholder({
    PostTitleRowData? titleRowData,
    PostSubtitleRowData? subtitleRowData,
  }) : super(
         titleRowData: titleRowData ?? const PostTitleRowDataPlaceholder(),
         subtitleRowData: subtitleRowData ?? PostSubtitleRowDataPlaceholder(),
       );
}
