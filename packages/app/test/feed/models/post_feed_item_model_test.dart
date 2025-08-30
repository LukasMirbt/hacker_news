// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/feed/feed.dart' hide FeedItem, PostFeedItem;
import 'package:app/l10n/l10n.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vote_repository/vote_repository.dart';
import 'package:web_links/web_links.dart';

class _MockPostFeedItem extends Mock implements PostFeedItem {}

class _MockDateFormatter extends Mock implements DateFormatter {}

class _MockWebLinks extends Mock implements WebLinks {}

void main() async {
  final locale = Locale('en');
  final l10n = await AppLocalizations.delegate.load(locale);

  group(PostFeedItemModel, () {
    late PostFeedItem item;
    late WebLinks webLinks;
    late DateFormatter formatter;

    setUp(() {
      item = _MockPostFeedItem();
      webLinks = _MockWebLinks();
      formatter = _MockDateFormatter();
    });

    PostFeedItemModel createSubject() {
      return PostFeedItemModel(
        item,
        webLinks: webLinks,
        formatter: formatter,
      );
    }

    group('user', () {
      test('returns item.hnuser.id', () {
        const hnuserId = 'hnuserId';
        when(() => item.hnuser).thenReturn(
          HnuserPlaceholder(id: hnuserId),
        );
        final model = createSubject();
        expect(model.user, hnuserId);
      });
    });

    group('score', () {
      test('returns correct string', () {
        const score = 1;
        when(() => item.score).thenReturn(score);
        final model = createSubject();
        expect(model.score, score.toString());
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
      test('returns item.hasBeenUpvoted', () {
        const hasBeenUpvoted = true;
        when(() => item.hasBeenUpvoted).thenReturn(hasBeenUpvoted);
        final model = createSubject();
        expect(model.hasBeenUpvoted, hasBeenUpvoted);
      });
    });

    group('shareText', () {
      const title = 'title';

      test('returns correct text when item.urlHost '
          'is null', () {
        const url = 'url';
        final resolvedUrl = Uri.parse('https://www.example.com/item');
        final resolve = () => webLinks.resolve(url);
        when(resolve).thenReturn(resolvedUrl);
        when(() => item.title).thenReturn(title);
        when(() => item.url).thenReturn(url);
        final model = createSubject();
        expect(
          model.shareText(l10n),
          l10n.feed_postShareText(
            title: title,
            url: resolvedUrl.toString(),
          ),
        );
        verify(resolve).called(1);
      });

      test('returns correct text when item.urlHost '
          'is non-null', () {
        const articleUrl = 'articleUrl';
        const id = 'id';
        final postUrl = Uri.parse('https://www.example.com/post');
        final postUrlMethod = () => webLinks.postUrl(id);
        when(() => item.title).thenReturn(title);
        when(() => item.urlHost).thenReturn('urlHost');
        when(() => item.url).thenReturn(articleUrl);
        when(() => item.id).thenReturn(id);
        when(postUrlMethod).thenReturn(postUrl);
        final model = createSubject();
        expect(
          model.shareText(l10n),
          l10n.feed_postWithArticleShareText(
            title: title,
            articleUrl: articleUrl,
            postUrl: postUrl.toString(),
          ),
        );
        verify(postUrlMethod).called(1);
      });
    });

    group('vote', () {
      final upvote = () => item.upvote();
      final unvote = () => item.unvote();

      test('returns upvoted item when type '
          'is ${VoteType.upvote}', () {
        final updatedItem = _MockPostFeedItem();
        when(upvote).thenReturn(updatedItem);
        final model = createSubject();
        expect(
          model.vote(VoteType.upvote),
          PostFeedItemModel(updatedItem),
        );
        verify(upvote).called(1);
      });

      test('returns unvoted item when type '
          'is ${VoteType.unvote}', () {
        final updatedItem = _MockPostFeedItem();
        when(unvote).thenReturn(updatedItem);
        final model = createSubject();
        expect(
          model.vote(VoteType.unvote),
          PostFeedItemModel(updatedItem),
        );
        verify(unvote).called(1);
      });
    });
  });
}
