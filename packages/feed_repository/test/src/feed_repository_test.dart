// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'package:feed_repository/feed_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:visited_post_storage/visited_post_storage.dart';

class _MockFeedApi extends Mock implements FeedApi {}

class _MockVisitedPostStorage extends Mock implements VisitedPostStorage {}

class _MockPaginatedFeed extends Mock implements PaginatedFeed {}

void main() {
  group(FeedRepository, () {
    late FeedApi api;
    late VisitedPostStorage storage;

    setUp(() {
      api = _MockFeedApi();
      storage = _MockVisitedPostStorage();
    });

    FeedRepository createSubject() {
      return FeedRepository(
        feedApi: api,
        visitedPostStorage: storage,
      );
    }

    group('fetchMore', () {
      final feed = _MockPaginatedFeed();
      const nextUrl = NextPageUrl(url: 'url');

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

    group('visitedPosts', () {
      test('returns stream', () {
        final stream = Stream<Set<String>>.empty();
        when(storage.watch).thenAnswer((_) => stream);
        final repository = createSubject();
        expect(repository.visitedPosts, stream);
      });
    });

    group('readVisitedPosts', () {
      final visitedPosts = {'id'};
      final read = () => storage.read();

      test('returns correct value', () {
        when(read).thenReturn(visitedPosts);
        final repository = createSubject();
        expect(
          repository.readVisitedPosts(),
          visitedPosts,
        );
        verify(read).called(1);
      });
    });

    group('addVisitedPost', () {
      const postId = 'postId';
      final add = () => storage.add(postId);

      test('calls storage.add', () {
        when(add).thenAnswer((_) async {});
        final repository = createSubject();
        repository.addVisitedPost(postId);
        verify(add).called(1);
      });
    });
  });
}
