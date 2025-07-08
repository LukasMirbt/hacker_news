import 'package:feed_parser/feed_parser.dart';

class FeedPageDataPlaceholder extends FeedPageData {
  const FeedPageDataPlaceholder({
    List<FeedItemData>? items,
    super.moreLink,
  }) : super(
         items: items ?? const [],
       );
}
