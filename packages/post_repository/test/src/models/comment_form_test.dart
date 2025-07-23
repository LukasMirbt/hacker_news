import 'package:flutter_test/flutter_test.dart';
import 'package:post_api/post_api.dart' as api;
import 'package:post_repository/post_repository.dart';

void main() {
  group(CommentForm, () {
    group('from', () {
      test('returns $CommentForm', () {
        const data = DetailCommentFormDataPlaceholder();

        expect(
          CommentForm.from(data),
          CommentForm(
            parent: data.parent,
            goto: data.goto,
            hmac: data.hmac,
          ),
        );
      });
    });

    group('toApi', () {
      test('returns ${api.CommentForm}', () {
        const form = CommentFormPlaceholder();

        expect(
          form.toApi(),
          api.CommentForm(
            parent: form.parent,
            goto: form.goto,
            hmac: form.hmac,
            text: form.text,
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
