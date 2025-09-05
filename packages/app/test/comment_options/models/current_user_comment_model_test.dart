// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/comment_options/comment_options.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';
import 'package:web_links/web_links.dart';

class _MockCurrentUserComment extends Mock implements CurrentUserComment {}

class _MockWebLinks extends Mock implements WebLinks {}

void main() {
  group(CurrentUserCommentModel, () {
    late CurrentUserComment comment;
    late WebLinks links;

    setUp(() {
      comment = _MockCurrentUserComment();
      links = _MockWebLinks();
    });

    CurrentUserCommentModel createSubject() {
      return CurrentUserCommentModel(
        comment,
        webLinks: links,
      );
    }

    test('is a $CommentModel', () {
      expect(
        createSubject(),
        isA<CommentModel>(),
      );
    });

    group('editUrl', () {
      test('returns comment.editUrl when non-null', () {
        const url = 'editUrl';
        final resolve = () => links.resolve(url);
        final resolvedUrl = Uri.parse('resolvedUrl');
        when(resolve).thenReturn(resolvedUrl);
        when(() => comment.editUrl).thenReturn(url);
        final model = createSubject();
        expect(model.editUrl, resolvedUrl);
      });

      test('returns null when comment.editUrl is null', () {
        final model = createSubject();
        expect(model.editUrl, null);
      });
    });

    group('deleteUrl', () {
      test('returns correct value when comment.deleteUrl '
          'is non-null', () {
        const url = 'deleteUrl';
        final resolve = () => links.resolve(url);
        final resolvedUrl = Uri.parse('resolvedUrl');
        when(resolve).thenReturn(resolvedUrl);
        when(() => comment.deleteUrl).thenReturn(url);
        final model = createSubject();
        expect(model.deleteUrl, resolvedUrl);
      });

      test('returns correct value when comment.deleteUrl '
          'is null', () {
        final model = createSubject();
        expect(model.deleteUrl, null);
      });
    });
  });
}
