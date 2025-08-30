import 'package:feed_parser/feed_parser.dart';

class JobFeedItemDataPlaceholder extends JobFeedItemData {
  JobFeedItemDataPlaceholder({
    JobTitleRowData? titleRowData,
    JobSubtitleRowData? subtitleRowData,
  }) : super(
         titleRowData: titleRowData ?? const JobTitleRowDataPlaceholder(),
         subtitleRowData: subtitleRowData ?? JobSubtitleRowDataPlaceholder(),
       );
}
