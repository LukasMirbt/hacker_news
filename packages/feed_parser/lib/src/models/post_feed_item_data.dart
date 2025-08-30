part of 'feed_item_data.dart';

class PostFeedItemData extends FeedItemData {
  const PostFeedItemData({
    required PostTitleRowData super.titleRowData,
    required PostSubtitleRowData super.subtitleRowData,
  });

  @override
  List<Object> get props => [
    titleRowData,
    subtitleRowData,
  ];
}
