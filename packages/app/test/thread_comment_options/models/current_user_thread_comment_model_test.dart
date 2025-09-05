// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/thread_comment_options/thread_comment_options.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_repository/thread_repository.dart';
import 'package:web_links/web_links.dart';

class _MockCurrentUserThreadComment extends Mock
    implements CurrentUserThreadComment {}

class _MockWebLinks extends Mock implements WebLinks {}

void main() {
  group(CurrentUserThreadCommentModel, () {
    late CurrentUserThreadComment comment;
    late WebLinks links;

    setUp(() {
      comment = _MockCurrentUserThreadComment();
      links = _MockWebLinks();
    });

    CurrentUserThreadCommentModel createSubject() {
      return CurrentUserThreadCommentModel(
        comment,
        webLinks: links,
      );
    }

    test('is a $ThreadCommentModel', () {
      expect(
        createSubject(),
        isA<ThreadCommentModel>(),
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
