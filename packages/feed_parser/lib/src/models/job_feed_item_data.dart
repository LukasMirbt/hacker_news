part of 'feed_item_data.dart';

class JobFeedItemData extends FeedItemData {
  const JobFeedItemData({
    required JobTitleRowData super.titleRowData,
    required JobSubtitleRowData super.subtitleRowData,
  });

  @override
  List<Object> get props => [
    titleRowData,
    subtitleRowData,
  ];
}
