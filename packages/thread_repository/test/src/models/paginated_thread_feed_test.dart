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

  const isInitial = false;
  const next = 'next';

  group(PaginatedThreadFeed, () {
    group('initial', () {
      test('returns $PaginatedThreadFeed', () {
        expect(
          PaginatedThreadFeed.initial(user),
          PaginatedThreadFeed(
            user: user,
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
          user: user,
          next: next,
          isInitial: false,
          items: [],
        );
        expect(feed.isEmpty, true);
      });

      test('returns false when isInitial', () {
        final feed = PaginatedThreadFeed(
          user: user,
          next: next,
          isInitial: true,
          items: [],
        );
        expect(feed.isEmpty, false);
      });

      test('returns false when !items.isEmpty', () {
        final feed = PaginatedThreadFeed(
          user: user,
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
          user: user,
          items: items,
          isInitial: false,
          next: null,
        );
        expect(feed.hasReachedMax, true);
      });

      test('returns false when isInitial', () {
        final feed = PaginatedThreadFeed(
          user: user,
          items: items,
          next: next,
          isInitial: true,
        );
        expect(feed.hasReachedMax, false);
      });

      test('returns false when next is not null', () {
        final feed = PaginatedThreadFeed(
          user: user,
          items: items,
          isInitial: isInitial,
          next: next,
        );
        expect(feed.hasReachedMax, false);
      });
    });

    group('nextUrl', () {
      test('returns $InitialPageUrl when isInitial', () {
        final feed = PaginatedThreadFeed(
          user: user,
          items: items,
          next: next,
          isInitial: true,
        );
        expect(
          feed.nextUrl,
          InitialPageUrl(id: user.id),
        );
      });

      test('throws $ReachedMaxFailure when !isInitial and next is null', () {
        final feed = PaginatedThreadFeed(
          user: user,
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

      test('returns $NextPageUrl when !isInitial and next '
          'is non-null', () {
        final feed = PaginatedThreadFeed(
          user: user,
          items: items,
          isInitial: isInitial,
          next: next,
        );
        expect(
          feed.nextUrl,
          NextPageUrl(url: next),
        );
      });
    });

    group('extendWith', () {
      final feed = PaginatedThreadFeed.initial(user);

      final nextPage = ThreadFeedPageDataPlaceholder(
        moreLink: 'moreLink',
        comments: [
          ThreadFeedItemDataPlaceholder(),
        ],
      );

      test('returns extended feed', () {
        expect(
          feed.extendWith(nextPage),
          PaginatedThreadFeed(
            user: feed.user,
            next: nextPage.moreLink,
            items: [
              ...feed.items,
              for (final item in nextPage.comments) ThreadFeedItem.from(item),
            ],
          ),
        );
      });
    });
  });
}
