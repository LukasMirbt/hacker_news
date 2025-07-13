import 'dart:async';

import 'package:thread_repository/thread_repository.dart';

class ThreadRepository {
  ThreadRepository({
    required ThreadApi threadApi,
  }) : _api = threadApi;

  final ThreadApi _api;

  Future<PaginatedThreadList> fetchMore(PaginatedThreadList list) async {
    final page = await _api.fetchThreadListPage(list.nextUrl);
    final extendedFeed = list.extendWith(page);
    return extendedFeed;
  }
}
