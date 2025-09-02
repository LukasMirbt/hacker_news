import 'dart:async';

import 'package:feed_repository/feed_repository.dart';
import 'package:visited_post_storage/visited_post_storage.dart';

class FeedRepository {
  FeedRepository({
    required FeedApi feedApi,
    required VisitedPostStorage visitedPostStorage,
  }) : _api = feedApi,
       _storage = visitedPostStorage;

  final FeedApi _api;
  final VisitedPostStorage _storage;

  Future<PaginatedFeed> fetchMore(PaginatedFeed feed) async {
    final page = await _api.fetchFeedPage(feed.nextUrl);
    final extendedFeed = feed.extendWith(page);
    return extendedFeed;
  }

  Stream<Set<String>> get visitedPosts => _storage.watch();

  Set<String> readVisitedPosts() => _storage.read();

  void addVisitedPost(String postId) {
    _storage.add(postId);
  }
}
