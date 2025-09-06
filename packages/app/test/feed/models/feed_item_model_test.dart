// ignore_for_file: prefer_const_constructors

import 'package:app/feed/feed.dart' hide FeedItem, JobFeedItem, PostFeedItem;
import 'package:app/l10n/l10n.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:web_links/web_links.dart';

class _MockPostFeedItem extends Mock implements PostFeedItem {}

class _MockDateFormatter extends Mock implements DateFormatter {}

class _MockWebLinks extends Mock implements WebLinks {}

void main() async {
  final locale = Locale('en');
  final appL10n = await AppLocalizations.delegate.load(locale);
  final formatterL10n = await DateFormatterLocalizations.delegate.load(locale);

  group(FeedItemModel, () {
    late PostFeedItem item;
    late WebLinks webLinks;
    late DateFormatter formatter;

    setUp(() {
      item = _MockPostFeedItem();
      formatter = _MockDateFormatter();
      webLinks = _MockWebLinks();
    });

    FeedItemModel createSubject() {
      return PostFeedItemModel(
        item,
        formatter: formatter,
        webLinks: webLinks,
      );
    }

    group('from', () {
      test('returns $PostFeedItemModel when item '
          'is $PostFeedItem', () {
        final item = PostFeedItemPlaceholder();
        expect(
          FeedItemModel.from(item),
          PostFeedItemModel(item),
        );
      });

      test('returns $JobFeedItemModel when item '
          'is $JobFeedItem', () {
        final item = JobFeedItemPlaceholder();
        expect(
          FeedItemModel.from(item),
          JobFeedItemModel(item),
        );
      });
    });

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
  });
}
