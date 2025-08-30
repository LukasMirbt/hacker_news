import 'package:equatable/equatable.dart';
import 'package:feed_parser/feed_parser.dart';

part 'job_feed_item_data.dart';
part 'post_feed_item_data.dart';

sealed class FeedItemData extends Equatable {
  const FeedItemData({
    required this.titleRowData,
    required this.subtitleRowData,
  });

  final TitleRowData titleRowData;
  final SubtitleRowData subtitleRowData;
}
