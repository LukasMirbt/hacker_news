// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: avoid_redundant_argument_values

import 'package:authentication_api/authentication_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thread_repository/thread_repository.dart';

void main() {
  final user = UserPlaceholder();

  final items = [
    ThreadFeedItemPlaceholder(),
  ];

  final initialUri = Uri.parse('https://www.example.com/');
  const isInitial = false;
  const next = 'next';

  group(PaginatedThreadFeed, () {
    group('initial', () {
      test('returns $PaginatedThreadFeed', () {
        expect(
          PaginatedThreadFeed.initial(user),
          PaginatedThreadFeed(
            initialUri: Uri(
              path: 'threads',
              queryParameters: {'id': user.id},
            ),
            next: null,
            isInitial: true,
            items: [],
          ),
        );
      });
    });

    group('isEmpty', () {
      test('returns true when !isInitial and items.isEmpty', () {
        final feed = PaginatedThreadFeed(
          initialUri: initialUri,
          next: next,
          isInitial: false,
          items: [],
        );
        expect(feed.isEmpty, true);
      });

      test('returns false when isInitial', () {
        final feed = PaginatedThreadFeed(
          initialUri: initialUri,
          next: next,
          isInitial: true,
          items: [],
        );
        expect(feed.isEmpty, false);
      });

      test('returns false when !items.isEmpty', () {
        final feed = PaginatedThreadFeed(
          initialUri: initialUri,
          isInitial: isInitial,
          next: next,
          items: items,
        );
        expect(feed.isEmpty, false);
      });
    });

    group('hasReachedMax', () {
      test('returns true when !isInitial and next is null', () {
        final feed = PaginatedThreadFeed(
          initialUri: initialUri,
          items: items,
          isInitial: false,
          next: null,
        );
        expect(feed.hasReachedMax, true);
      });

      test('returns false when isInitial', () {
        final feed = PaginatedThreadFeed(
          initialUri: initialUri,
          items: items,
          next: next,
          isInitial: true,
        );
        expect(feed.hasReachedMax, false);
      });

      test('returns false when next is not null', () {
        final feed = PaginatedThreadFeed(
          initialUri: initialUri,
          items: items,
          isInitial: isInitial,
          next: next,
        );
        expect(feed.hasReachedMax, false);
      });
    });

    group('next', () {
      test('returns initialUri when isInitial', () {
        final feed = PaginatedThreadFeed(
          initialUri: initialUri,
          items: items,
          next: next,
          isInitial: true,
        );
        expect(
          feed.next,
          initialUri.toString(),
        );
      });

      test('throws $ReachedMaxFailure when !isInitial and next is null', () {
        final feed = PaginatedThreadFeed(
          initialUri: initialUri,
          items: items,
          isInitial: false,
          next: null,
        );
        expect(
          () => feed.next,
          throwsA(
            ReachedMaxFailure(),
          ),
        );
      });

      test('returns next when !isInitial and next is non-null', () {
        final feed = PaginatedThreadFeed(
          initialUri: initialUri,
          items: items,
          isInitial: isInitial,
          next: next,
        );
        expect(feed.next, next);
      });
    });

    group('extendWith', () {
      final feed = PaginatedThreadFeed.initial(user);

      final nextPage = ThreadListPageDataPlaceholder(
        moreLink: 'moreLink',
        comments: [
          ThreadCommentDataPlaceholder(),
        ],
      );

      test('returns extended feed', () {
        expect(
          feed.extendWith(nextPage),
          PaginatedThreadFeed(
            initialUri: feed.initialUri,
            next: nextPage.moreLink,
            items: [
              ...feed.items,
              for (final item in nextPage.comments) ThreadFeedItem.from(item),
            ],
          ),
        );
      });
    });

    group('update', () {
      const idToUpdate = 'idToUpdate';

      final firstItem = ThreadFeedItemPlaceholder();
      final secondItem = ThreadFeedItemPlaceholder(id: idToUpdate);

      final updatedItem = secondItem.copyWith(
        htmlText: 'updatedHtmlText',
      );

      final feed = PaginatedThreadFeed(
        initialUri: initialUri,
        next: next,
        isInitial: isInitial,
        items: [firstItem, secondItem],
      );

      test('returns $PaginatedThreadFeed with updated item', () {
        expect(
          feed.update(updatedItem),
          PaginatedThreadFeed(
            initialUri: initialUri,
            next: next,
            isInitial: isInitial,
            items: [firstItem, updatedItem],
          ),
        );
      });
    });
  });
}
