import 'dart:async';

import 'package:thread_repository/thread_repository.dart';

class ThreadRepository {
  ThreadRepository({
    required ThreadApi threadApi,
  }) : _api = threadApi;

  final ThreadApi _api;

  Future<PaginatedThreadFeed> fetchMore(
    PaginatedThreadFeed paginatedList,
  ) async {
    final page = await _api.fetchThreadListPage(paginatedList.nextUrl);
    final extendedFeed = paginatedList.extendWith(page);
    return extendedFeed;
  }
}
