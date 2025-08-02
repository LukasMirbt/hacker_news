// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_comment_options/thread_comment_options.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_repository/thread_repository.dart';
import 'package:web_links/web_links.dart';

class _MockWebLinks extends Mock implements WebLinks {}

class _MockOtherUserThreadComment extends Mock
    implements OtherUserThreadComment {}

void main() {
  final url = Uri.parse('https://example.com');
  const id = 'id';

  group(ThreadCommentModel, () {
    late ThreadComment comment;
    late WebLinks webLinks;

    setUp(() {
      comment = _MockOtherUserThreadComment();
      webLinks = _MockWebLinks();
      when(() => comment.id).thenReturn(id);
    });

    ThreadCommentModel createSubject() {
      return ThreadCommentModel(
        comment,
        webLinks: webLinks,
      );
    }

    group('id', () {
      test('returns comment.id', () {
        when(() => comment.id).thenReturn(id);
        final model = createSubject();
        expect(model.id, id);
      });
    });

    group('postId', () {
      test('returns comment.postId when non-null', () {
        const postId = 'postId';
        when(() => comment.postId).thenReturn(postId);
        final model = createSubject();
        expect(model.postId, postId);
      });

      test('returns null when comment.postId is null', () {
        final model = createSubject();
        expect(model.postId, null);
      });
    });

    group('replyUrl', () {
      test('returns comment.replyUrl when non-null', () {
        const replyUrl = 'replyUrl';
        when(() => comment.replyUrl).thenReturn(replyUrl);
        final model = createSubject();
        expect(model.replyUrl, replyUrl);
      });

      test('returns null when comment.replyUrl is null', () {
        final model = createSubject();
        expect(model.replyUrl, null);
      });
    });

    group('onTitle', () {
      test('returns comment.onTitle when non-null', () {
        const onTitle = 'onTitle';
        when(() => comment.onTitle).thenReturn(onTitle);
        final model = createSubject();
        expect(model.onTitle, onTitle);
      });

      test('returns null when comment.onTitle is null', () {
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

    group('shareText', () {
      final getCommentUrl = () => webLinks.commentUrl(id);

      test('returns correct value', () {
        when(getCommentUrl).thenReturn(url);
        final model = createSubject();
        expect(model.shareText, url.toString());
        verify(getCommentUrl).called(1);
      });
    });

    group('toRepository', () {
      test('returns comment', () {
        final model = createSubject();
        expect(model.toRepository(), comment);
      });
    });
  });
}
