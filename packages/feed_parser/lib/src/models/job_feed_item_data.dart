part of 'feed_item_data.dart';

class JobFeedItemData extends FeedItemData {
  const JobFeedItemData({
    required this.titleRowData,
    required this.subtitleRowData,
  });

  @override
  final JobTitleRowData titleRowData;

  @override
  final JobSubtitleRowData subtitleRowData;

  @override
  List<Object> get props => [
    titleRowData,
    subtitleRowData,
  ];
}
