// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:post_api/post_api.dart' as api;
import 'package:post_repository/post_repository.dart';

void main() {
  group(CommentForm, () {
    group('from', () {
      test('returns $CommentForm', () {
        const data = DetailCommentFormDataPlaceholder();
        const savedComment = 'savedComment';

        expect(
          CommentForm.from(
            data: data,
            savedComment: savedComment,
          ),
          CommentForm(
            parentId: data.parent,
            goto: data.goto,
            hmac: data.hmac,
            text: savedComment,
          ),
        );
      });
    });

    group('toApi', () {
      test('throws $NullCommentFormTextException when text '
          'is null', () {
        final form = CommentForm(
          parentId: 'parentId',
          goto: 'goto',
          hmac: 'hmac',
        );
        expect(
          form.toApi,
          throwsA(
            NullCommentFormTextException(),
          ),
        );
      });

      test('returns ${api.CommentForm} when text '
          'is non-null', () {
        const text = 'text';
        const form = CommentFormPlaceholder(text: text);
        expect(
          form.toApi(),
          api.CommentForm(
            parent: form.parentId,
            goto: form.goto,
            hmac: form.hmac,
            text: text,
          ),
        );
      });
    });

    group('empty', () {
      test('returns $CommentForm', () {
        expect(
          CommentForm.empty,
          isA<CommentForm>(),
        );
      });
    });
  });
}
