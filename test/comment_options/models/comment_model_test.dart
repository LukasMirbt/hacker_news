// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app_client/app_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_options/comment_options.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';
import 'package:web_links/web_links.dart';

class _MockWebLinks extends Mock implements WebLinks {}

class _MockComment extends Mock implements Comment {}

void main() {
  final url = Uri.parse('https://example.com');
  const id = 'id';

  group(CommentModel, () {
    late Comment comment;
    late WebLinks webLinks;

    setUp(() {
      comment = _MockComment();
      webLinks = _MockWebLinks();
      when(() => comment.id).thenReturn(id);
    });

    CommentModel createSubject() {
      return CommentModel(
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
