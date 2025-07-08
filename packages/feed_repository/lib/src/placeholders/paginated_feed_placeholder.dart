import 'package:feed_repository/feed_repository.dart';

class PaginatedFeedPlaceholder extends PaginatedFeed {
  const PaginatedFeedPlaceholder({
    FeedType? type,
    String? next,
    bool? isInitial,
    List<FeedItem>? items,
  }) : super(
         type: type ?? FeedType.top,
         next: next ?? 'next',
         isInitial: isInitial ?? false,
         items: items ?? const [],
       );
}
