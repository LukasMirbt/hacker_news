// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/post_header/post_header.dart' hide PostHeader;
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';
import 'package:vote_repository/vote_repository.dart';
import 'package:web_links/web_links.dart';

class _MockPostHeader extends Mock implements PostHeader {}

class _MockDateFormatter extends Mock implements DateFormatter {}

class _MockWebLinks extends Mock implements WebLinks {}

void main() async {
  final locale = Locale('en');
  final appL10n = await AppLocalizations.delegate.load(locale);
  final formatterL10n = await DateFormatterLocalizations.delegate.load(locale);

  group(PostHeaderModel, () {
    late PostHeader header;
    late DateFormatter formatter;
    late WebLinks webLinks;

    setUp(() {
      header = _MockPostHeader();
      formatter = _MockDateFormatter();
      webLinks = _MockWebLinks();
    });

    PostHeaderModel createSubject() {
      return PostHeaderModel(
        header,
        formatter: formatter,
        webLinks: webLinks,
      );
    }

    group('id', () {
      test('returns model.id', () {
        const id = 'id';
        when(() => header.id).thenReturn(id);
        final model = createSubject();
        expect(model.id, id);
      });
    });

    group('title', () {
      test('returns model.title', () {
        const title = 'title';
        when(() => header.title).thenReturn(title);
        final model = createSubject();
        expect(model.title, title);
      });
    });

    group('url', () {
      test('returns model.url', () {
        const url = 'url';
        when(() => header.url).thenReturn(url);
        final model = createSubject();
        expect(model.url, url);
      });
    });

    group('user', () {
      test('returns model.hnuser.id', () {
        const hnuserId = 'hnuserId';
        when(() => header.hnuser).thenReturn(
          HnuserPlaceholder(id: hnuserId),
        );
        final model = createSubject();
        expect(model.user, hnuserId);
      });
    });

    group('score', () {
      test('returns correct string', () {
        const score = 1;
        when(() => header.score).thenReturn(score);
        final model = createSubject();
        expect(model.score, score.toString());
      });
    });

    group('urlHost', () {
      test('returns model.urlHost', () {
        const urlHost = 'urlHost';
        when(() => header.urlHost).thenReturn(urlHost);
        final model = createSubject();
        expect(model.urlHost, urlHost);
      });
    });

    group('commentCount', () {
      test('returns correct string', () {
        const commentCount = 1;
        when(() => header.commentCount).thenReturn(commentCount);
        final model = createSubject();
        expect(model.commentCount, commentCount.toString());
      });
    });

    group('htmlText', () {
      test('returns model.htmlText', () {
        const htmlText = 'htmlText';
        when(() => header.htmlText).thenReturn(htmlText);
        final model = createSubject();
        expect(model.htmlText, htmlText);
      });
    });

    group('hasBeenUpvoted', () {
      test('returns model.hasBeenUpvoted', () {
        const hasBeenUpvoted = true;
        when(() => header.hasBeenUpvoted).thenReturn(hasBeenUpvoted);
        final model = createSubject();
        expect(model.hasBeenUpvoted, hasBeenUpvoted);
      });
    });

    group('upvoteUrl', () {
      test('returns model.upvoteUrl', () {
        const upvoteUrl = 'upvoteUrl';
        when(() => header.upvoteUrl).thenReturn(upvoteUrl);
        final model = createSubject();
        expect(model.upvoteUrl, upvoteUrl);
      });
    });

    group('shareText', () {
      test('returns correct text', () {
        const url = 'url';
        const title = 'title';
        final resolvedUrl = Uri.parse('https://www.example.com/item');
        final resolve = () => webLinks.resolve(url);
        when(resolve).thenReturn(resolvedUrl);
        when(() => header.title).thenReturn(title);
        when(() => header.url).thenReturn(url);
        final model = createSubject();
        expect(
          model.shareText(appL10n),
          appL10n.postHeader_shareText(
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
        when(() => header.age).thenReturn(age);
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

    group('toRepository', () {
      test('returns header', () {
        final model = createSubject();
        expect(model.toRepository(), header);
      });
    });

    group('vote', () {
      final upvote = () => header.upvote();
      final unvote = () => header.unvote();

      test('returns upvoted header when type '
          'is ${VoteType.upvote}', () {
        final updatedItem = _MockPostHeader();
        when(upvote).thenReturn(updatedItem);
        final model = createSubject();
        expect(
          model.vote(VoteType.upvote),
          PostHeaderModel(updatedItem),
        );
        verify(upvote).called(1);
      });

      test('returns unvoted header when type '
          'is ${VoteType.unvote}', () {
        final updatedItem = _MockPostHeader();
        when(unvote).thenReturn(updatedItem);
        final model = createSubject();
        expect(
          model.vote(VoteType.unvote),
          PostHeaderModel(updatedItem),
        );
        verify(unvote).called(1);
      });
    });
  });
}
