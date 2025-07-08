// ignore_for_file: prefer_function_declarations_over_variables

import 'package:feed_repository/feed_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockFeedApi extends Mock implements FeedApi {}

class _MockPaginatedFeed extends Mock implements PaginatedFeed {}

void main() {
  group(FeedRepository, () {
    late FeedApi api;

    setUp(() {
      api = _MockFeedApi();
    });

    FeedRepository createSubject() {
      return FeedRepository(feedApi: api);
    }

    group('fetchMore', () {
      final feed = _MockPaginatedFeed();
      const nextUrl = 'nextUrl';

      const page = FeedPageDataPlaceholder();
      final extendedFeed = _MockPaginatedFeed();

      final fetchFeedPage = () => api.fetchFeedPage(nextUrl);
      final extendWith = () => feed.extendWith(page);

      test('returns extended $PaginatedFeed', () async {
        when(() => feed.nextUrl).thenReturn(nextUrl);
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
