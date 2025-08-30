// ignore_for_file: annotate_overrides

part of 'feed_item.dart';

@freezed
class JobFeedItem extends FeedItem with _$JobFeedItem {
  const JobFeedItem({
    required this.id,
    required this.rank,
    required this.title,
    required this.url,
    required this.urlHost,
    required this.age,
  });

  factory JobFeedItem.from(JobFeedItemData data) {
    final titleRowData = data.titleRowData;
    final subtitleRowData = data.subtitleRowData;

    return JobFeedItem(
      id: titleRowData.base.id,
      rank: titleRowData.base.rank,
      title: titleRowData.base.title,
      url: titleRowData.base.url,
      urlHost: titleRowData.base.urlHost,
      age: subtitleRowData.age,
    );
  }

  final String id;
  final int rank;
  final String title;
  final String url;
  final String? urlHost;
  final DateTime age;
}
