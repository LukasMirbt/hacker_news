import 'package:equatable/equatable.dart';
import 'package:feed_parser/feed_parser.dart';

class FeedItemData extends Equatable {
  const FeedItemData({
    required this.titleRowData,
    required this.subtitleRowData,
  });

  final TitleRowData titleRowData;
  final SubtitleRowData subtitleRowData;

  @override
  List<Object> get props => [
    titleRowData,
    subtitleRowData,
  ];
}
