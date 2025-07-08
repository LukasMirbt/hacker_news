// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: avoid_redundant_argument_values

import 'package:feed_repository/feed_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const type = FeedType.top;

  final items = [
    FeedItemPlaceholder(),
  ];

  const isInitial = false;
  const next = 'next';

  group(PaginatedFeed, () {
    group('initial', () {
      test('returns $PaginatedFeed', () {
        expect(
          PaginatedFeed.initial(type),
          PaginatedFeed(
            type: type,
            next: null,
            isInitial: true,
            items: [],
          ),
        );
      });
    });

    group('isEmpty', () {
      test('returns true when !isInitial and items.isEmpty', () {
        final feed = PaginatedFeed(
          type: type,
          next: next,
          isInitial: false,
          items: [],
        );
        expect(feed.isEmpty, true);
      });

      test('returns false when isInitial', () {
        final feed = PaginatedFeed(
          type: type,
          next: next,
          isInitial: true,
          items: [],
        );
        expect(feed.isEmpty, false);
      });

      test('returns false when !items.isEmpty', () {
        final feed = PaginatedFeed(
          type: type,
          isInitial: isInitial,
          next: next,
          items: items,
        );
        expect(feed.isEmpty, false);
      });
    });

    group('hasReachedMax', () {
      test('returns true when !isInitial and next is null', () {
        final feed = PaginatedFeed(
          type: type,
          items: items,
          isInitial: false,
          next: null,
        );
        expect(feed.hasReachedMax, true);
      });

      test('returns false when isInitial', () {
        final feed = PaginatedFeed(
          type: type,
          items: items,
          next: next,
          isInitial: true,
        );
        expect(feed.hasReachedMax, false);
      });

      test('returns false when next is not null', () {
        final feed = PaginatedFeed(
          type: type,
          items: items,
          isInitial: isInitial,
          next: next,
        );
        expect(feed.hasReachedMax, false);
      });
    });

    group('nextUrl', () {
      test('returns type.endpoint when isInitial', () {
        final feed = PaginatedFeed(
          type: type,
          items: items,
          next: next,
          isInitial: true,
        );
        expect(feed.nextUrl, type.endpoint);
      });

      test('throws $ReachedMaxFailure when !isInitial and next is null', () {
        final feed = PaginatedFeed(
          type: type,
          items: items,
          isInitial: false,
          next: null,
        );
        expect(
          () => feed.nextUrl,
          throwsA(
            ReachedMaxFailure(),
          ),
        );
      });

      test('returns next when !isInitial and next is non-null', () {
        final feed = PaginatedFeed(
          type: type,
          items: items,
          isInitial: isInitial,
          next: next,
        );
        expect(feed.nextUrl, next);
      });
    });

    group('extendWith', () {
      final feed = PaginatedFeed.initial(type);

      final nextPage = FeedPageDataPlaceholder(
        moreLink: 'moreLink',
        items: [
          FeedItemDataPlaceholder(),
        ],
      );

      test('returns extended feed', () {
        expect(
          feed.extendWith(nextPage),
          PaginatedFeed(
            type: feed.type,
            next: nextPage.moreLink,
            items: [
              ...feed.items,
              for (final item in nextPage.items) FeedItem.from(item),
            ],
          ),
        );
      });
    });

    group('update', () {
      const idToUpdate = 'idToUpdate';

      final firstItem = FeedItemPlaceholder();
      final secondItem = FeedItemPlaceholder(id: idToUpdate);

      final updatedItem = secondItem.copyWith(
        title: 'Updated Title',
      );

      final feed = PaginatedFeed(
        type: type,
        next: next,
        isInitial: isInitial,
        items: [firstItem, secondItem],
      );

      test('returns $PaginatedFeed with updated item', () {
        expect(
          feed.update(updatedItem),
          PaginatedFeed(
            type: type,
            next: next,
            isInitial: isInitial,
            items: [firstItem, updatedItem],
          ),
        );
      });
    });
  });
}
