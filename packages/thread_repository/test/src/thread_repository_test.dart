// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_repository/thread_repository.dart';

class _MockThreadApi extends Mock implements ThreadApi {}

class _MockPaginatedThreadFeed extends Mock implements PaginatedThreadFeed {}

void main() {
  group(ThreadRepository, () {
    late ThreadApi api;

    setUp(() {
      api = _MockThreadApi();
    });

    ThreadRepository createSubject() {
      return ThreadRepository(threadApi: api);
    }

    group('fetchMore', () {
      final feed = _MockPaginatedThreadFeed();
      const next = 'next';

      const page = ThreadListPageDataPlaceholder();
      final extendedFeed = _MockPaginatedThreadFeed();

      final fetchFeedPage = () => api.fetchFeedPage(next);
      final extendWith = () => feed.extendWith(page);

      test('returns extended $PaginatedThreadFeed', () async {
        when(() => feed.next).thenReturn(next);
        when(fetchFeedPage).thenAnswer((_) async => page);
        when(extendWith).thenReturn(extendedFeed);
        final repository = createSubject();
        await expectLater(
          repository.fetchMore(feed),
          completion(extendedFeed),
        );
        verify(fetchFeedPage).called(1);
        verify(extendWith).called(1);
      });
    });
  });
}
