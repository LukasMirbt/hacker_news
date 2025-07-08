import 'package:equatable/equatable.dart';
import 'package:feed_parser/feed_parser.dart';

class FeedPageData extends Equatable {
  const FeedPageData({
    required this.items,
    required this.moreLink,
  });

  final List<FeedItemData> items;
  final String? moreLink;

  @override
  List<Object?> get props => [
    items,
    moreLink,
  ];
}
