import 'dart:async';

import 'package:feed_repository/feed_repository.dart';

class FeedRepository {
  FeedRepository({
    required FeedApi feedApi,
  }) : _api = feedApi;

  final FeedApi _api;

  Future<PaginatedFeed> fetchMore(PaginatedFeed feed) async {
    final page = await _api.fetchFeedPage(feed.nextUrl);
    final extendedFeed = feed.extendWith(page);
    return extendedFeed;
  }
}
