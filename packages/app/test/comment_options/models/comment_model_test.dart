// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/comment_options/comment_options.dart';
import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';
import 'package:web_links/web_links.dart';

class _MockWebLinks extends Mock implements WebLinks {}

class _MockOtherUserComment extends Mock implements OtherUserComment {}

void main() {
  final url = Uri.parse('https://example.com');
  const id = 'id';

  group(CommentModel, () {
    late OtherUserComment comment;
    late WebLinks webLinks;

    setUp(() {
      comment = _MockOtherUserComment();
      webLinks = _MockWebLinks();
      when(() => comment.id).thenReturn(id);
    });

    CommentModel createSubject() {
      return OtherUserCommentModel(
        comment,
        webLinks: webLinks,
      );
    }

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
  });
}
