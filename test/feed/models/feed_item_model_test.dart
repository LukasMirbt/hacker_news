// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:date_formatter/date_formatter.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/feed/feed.dart' hide FeedItem;
import 'package:hacker_client/l10n/l10n.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vote_repository/vote_repository.dart';
import 'package:web_links/web_links.dart';

class _MockFeedItem extends Mock implements FeedItem {}

class _MockDateFormatter extends Mock implements DateFormatter {}

class _MockWebLinks extends Mock implements WebLinks {}

void main() async {
  final locale = Locale('en');
  final appL10n = await AppLocalizations.delegate.load(locale);
  final formatterL10n = await DateFormatterLocalizations.delegate.load(locale);

  group(FeedItemModel, () {
    late FeedItem item;
    late DateFormatter formatter;
    late WebLinks webLinks;

    setUp(() {
      item = _MockFeedItem();
      formatter = _MockDateFormatter();
      webLinks = _MockWebLinks();
    });

    FeedItemModel createSubject() {
      return FeedItemModel(
        item,
        formatter: formatter,
        webLinks: webLinks,
      );
    }

    group('id', () {
      test('returns item.id', () {
        const id = 'id';
        when(() => item.id).thenReturn(id);
        final model = createSubject();
        expect(model.id, id);
      });
    });

    group('title', () {
      test('returns item.title', () {
        const title = 'title';
        when(() => item.title).thenReturn(title);
        final model = createSubject();
        expect(model.title, title);
      });
    });

    group('url', () {
      test('returns item.url', () {
        const url = 'url';
        when(() => item.url).thenReturn(url);
        final model = createSubject();
        expect(model.url, url);
      });
    });

    group('user', () {
      test('returns item.hnuser.id when non-null', () {
        const hnuserId = 'hnuserId';
        when(() => item.hnuser).thenReturn(
          HnuserPlaceholder(id: hnuserId),
        );
        final model = createSubject();
        expect(model.user, hnuserId);
      });

      test('returns null when item.hnuser is null', () {
        final model = createSubject();
        expect(model.user, null);
      });
    });

    group('score', () {
      test('returns correct string when item.score '
          'is non-null', () {
        const score = 1;
        when(() => item.score).thenReturn(score);
        final model = createSubject();
        expect(model.score, score.toString());
      });

      test('returns null when item.score is null', () {
        final model = createSubject();
        expect(model.score, null);
      });
    });

    group('urlHost', () {
      test('returns item.urlHost when non-null', () {
        const urlHost = 'urlHost';
        when(() => item.urlHost).thenReturn(urlHost);
        final model = createSubject();
        expect(model.urlHost, urlHost);
      });

      test('returns null when item.urlHost is null', () {
        final model = createSubject();
        expect(model.urlHost, null);
      });
    });

    group('commentCount', () {
      test('returns correct string when item.commentCount '
          'is non-null', () {
        const commentCount = 1;
        when(() => item.commentCount).thenReturn(commentCount);
        final model = createSubject();
        expect(model.commentCount, commentCount.toString());
      });

      test('returns null when item.commentCount is null', () {
        final model = createSubject();
        expect(model.commentCount, null);
      });
    });

    group('upvoteUrl', () {
      test('returns item.upvoteUrl when non-null', () {
        const upvoteUrl = 'upvoteUrl';
        when(() => item.upvoteUrl).thenReturn(upvoteUrl);
        final model = createSubject();
        expect(model.upvoteUrl, upvoteUrl);
      });

      test('returns null when item.upvoteUrl is null', () {
        final model = createSubject();
        expect(model.upvoteUrl, null);
      });
    });

    group('hasBeenUpvoted', () {
      test('returns model.hasBeenUpvoted', () {
        const hasBeenUpvoted = true;
        when(() => item.hasBeenUpvoted).thenReturn(hasBeenUpvoted);
        final model = createSubject();
        expect(model.hasBeenUpvoted, hasBeenUpvoted);
      });
    });

    group('shareText', () {
      test('returns correct text', () {
        const url = 'url';
        const title = 'title';
        final resolvedUrl = Uri.parse('https://www.example.com/item');
        final resolve = () => webLinks.resolve(url);
        when(resolve).thenReturn(resolvedUrl);
        when(() => item.title).thenReturn(title);
        when(() => item.url).thenReturn(url);
        final model = createSubject();
        expect(
          model.shareText(appL10n),
          appL10n.feed_shareText(
            title: title,
            url: resolvedUrl,
          ),
        );
        verify(resolve).called(1);
      });
    });

    group('age', () {
      test('returns correct string', () {
        final age = DateTime(1);
        const formattedAge = 'formattedAge';
        when(() => item.age).thenReturn(age);
        when(
          () => formatter.format(formatterL10n, age),
        ).thenReturn(formattedAge);
        final model = createSubject();
        expect(
          model.age(formatterL10n),
          formattedAge,
        );
      });
    });

    group('rank', () {
      test('returns correct string', () {
        const rank = 1;
        when(() => item.rank).thenReturn(rank);
        final model = createSubject();
        expect(
          model.rank(appL10n),
          appL10n.feed_rank(rank: rank),
        );
      });
    });

    group('toRepository', () {
      test('returns item', () {
        final model = createSubject();
        expect(model.toRepository(), item);
      });
    });

    group('vote', () {
      final upvote = () => item.upvote();
      final unvote = () => item.unvote();

      test('returns upvoted item when type '
          'is ${VoteType.upvote}', () {
        final updatedItem = _MockFeedItem();
        when(upvote).thenReturn(updatedItem);
        final model = createSubject();
        expect(
          model.vote(VoteType.upvote),
          FeedItemModel(updatedItem),
        );
        verify(upvote).called(1);
      });

      test('returns unvoted item when type '
          'is ${VoteType.unvote}', () {
        final updatedItem = _MockFeedItem();
        when(unvote).thenReturn(updatedItem);
        final model = createSubject();
        expect(
          model.vote(VoteType.unvote),
          FeedItemModel(updatedItem),
        );
        verify(unvote).called(1);
      });
    });
  });
}
