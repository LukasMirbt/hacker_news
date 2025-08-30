import 'package:feed_parser/feed_parser.dart';

class FeedItemParser {
  const FeedItemParser({
    PostTitleRowParser? postTitleRowParser,
    JobTitleRowParser? jobTitleRowParser,
    SubtitleRowParser? subtitleRowParser,
  }) : _postTitleRowParser = postTitleRowParser ?? const PostTitleRowParser(),
       _jobTitleRowParser = jobTitleRowParser ?? const JobTitleRowParser(),
       _subtitleRowParser = subtitleRowParser ?? const SubtitleRowParser();

  final PostTitleRowParser _postTitleRowParser;
  final JobTitleRowParser _jobTitleRowParser;
  final SubtitleRowParser _subtitleRowParser;

  FeedItemData parse(Element athing) {
    final subtitleRow = athing.nextElementSibling;

    if (subtitleRow == null) {
      final titleRowData = _postTitleRowParser.parse(athing);

      return PostFeedItemData(
        titleRowData: titleRowData,
        subtitleRowData: PostSubtitleRowData.empty,
      );
    }

    final subtitleRowData = _subtitleRowParser.parse(subtitleRow);

    switch (subtitleRowData) {
      case PostSubtitleRowData():
        final titleRowData = _postTitleRowParser.parse(athing);

        return PostFeedItemData(
          titleRowData: titleRowData,
          subtitleRowData: subtitleRowData,
        );
      case JobSubtitleRowData():
        final titleRowData = _jobTitleRowParser.parse(athing);

        return JobFeedItemData(
          titleRowData: titleRowData,
          subtitleRowData: subtitleRowData,
        );
    }
  }
}
