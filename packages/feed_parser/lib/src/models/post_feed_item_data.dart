part of 'feed_item_data.dart';

class PostFeedItemData extends FeedItemData {
  const PostFeedItemData({
    required this.titleRowData,
    required this.subtitleRowData,
  });

  @override
  final PostTitleRowData titleRowData;

  @override
  final PostSubtitleRowData subtitleRowData;

  @override
  List<Object> get props => [
    titleRowData,
    subtitleRowData,
  ];
}
