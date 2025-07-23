// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_item_options/thread_item_options.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_repository/thread_repository.dart';
import 'package:web_links/web_links.dart';

class _MockWebLinks extends Mock implements WebLinks {}

class _MockThreadFeedItem extends Mock implements ThreadFeedItem {}

void main() {
  final url = Uri.parse('https://example.com');
  const id = 'id';

  group(ThreadItemModel, () {
    late ThreadFeedItem item;
    late WebLinks webLinks;

    setUp(() {
      item = _MockThreadFeedItem();
      webLinks = _MockWebLinks();
      when(() => item.id).thenReturn(id);
    });

    ThreadItemModel createSubject() {
      return ThreadItemModel(
        item,
        webLinks: webLinks,
      );
    }

    group('id', () {
      test('returns item.id', () {
        when(() => item.id).thenReturn(id);
        final model = createSubject();
        expect(model.id, id);
      });
    });

    group('postId', () {
      test('returns item.postId when non-null', () {
        const postId = 'postId';
        when(() => item.postId).thenReturn(postId);
        final model = createSubject();
        expect(model.postId, postId);
      });

      test('returns null when item.postId is null', () {
        final model = createSubject();
        expect(model.postId, null);
      });
    });

    group('replyUrl', () {
      test('returns item.replyUrl when non-null', () {
        const replyUrl = 'replyUrl';
        when(() => item.replyUrl).thenReturn(replyUrl);
        final model = createSubject();
        expect(model.replyUrl, replyUrl);
      });

      test('returns null when item.replyUrl is null', () {
        final model = createSubject();
        expect(model.replyUrl, null);
      });
    });

    group('onTitle', () {
      test('returns item.onTitle when non-null', () {
        const onTitle = 'onTitle';
        when(() => item.onTitle).thenReturn(onTitle);
        final model = createSubject();
        expect(model.onTitle, onTitle);
      });

      test('returns null when item.onTitle is null', () {
        final model = createSubject();
        expect(model.onTitle, null);
      });
    });

    group('webRedirect', () {
      final getCommentUrl = () => webLinks.commentUrl(id);

      test('returns $WebRedirect with correct url', () {
        when(getCommentUrl).thenReturn(url);
        final model = createSubject();
        final redirect = model.webRedirect;
        expect(
          redirect,
          isA<WebRedirect>().having(
            (redirect) => redirect.url,
            'url',
            url,
          ),
        );
        verify(getCommentUrl).called(1);
      });
    });
  });
}
