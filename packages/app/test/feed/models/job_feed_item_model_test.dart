// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/feed/feed.dart' hide JobFeedItem;
import 'package:app/l10n/l10n.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:web_links/web_links.dart';

class _MockFeedItem extends Mock implements JobFeedItem {}

class _MockDateFormatter extends Mock implements DateFormatter {}

class _MockWebLinks extends Mock implements WebLinks {}

void main() async {
  final locale = Locale('en');
  final l10n = await AppLocalizations.delegate.load(locale);

  group(JobFeedItemModel, () {
    late JobFeedItem item;
    late DateFormatter formatter;
    late WebLinks webLinks;

    setUp(() {
      item = _MockFeedItem();
      formatter = _MockDateFormatter();
      webLinks = _MockWebLinks();
    });

    JobFeedItemModel createSubject() {
      return JobFeedItemModel(
        item,
        formatter: formatter,
        webLinks: webLinks,
      );
    }

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
          model.shareText(l10n),
          l10n.feed_jobShareText(
            title: title,
            url: resolvedUrl.toString(),
          ),
        );
        verify(resolve).called(1);
      });
    });
  });
}
