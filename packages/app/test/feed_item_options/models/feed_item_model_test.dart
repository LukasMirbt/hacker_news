// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/feed_item_options/feed_item_options.dart';
import 'package:app_client/app_client.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:web_links/web_links.dart';

class _MockWebLinks extends Mock implements WebLinks {}

class _MockPostFeedItem extends Mock implements PostFeedItem {}

void main() {
  group(FeedItemModel, () {
    late PostFeedItem item;
    late WebLinks webLinks;

    setUp(() {
      item = _MockPostFeedItem();
      webLinks = _MockWebLinks();
    });

    FeedItemModel createSubject() {
      return FeedItemModel(
        item,
        webLinks: webLinks,
      );
    }

    group('webRedirect', () {
      const id = 'id';
      final itemUrl = Uri.parse('https://example.com');
      final getItemUrl = () => webLinks.itemUrl(id: id);

      test('returns $WebRedirect', () {
        when(() => item.id).thenReturn(id);
        when(getItemUrl).thenReturn(itemUrl);
        final model = createSubject();
        final redirect = model.webRedirect;
        expect(
          redirect,
          isA<WebRedirect>().having(
            (redirect) => redirect.url,
            'url',
            itemUrl,
          ),
        );
        verify(getItemUrl).called(1);
      });
    });
  });
}
