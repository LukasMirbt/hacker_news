import 'package:flutter_test/flutter_test.dart';
import 'package:reply_api/reply_api.dart' as api;
import 'package:reply_repository/reply_repository.dart';

void main() {
  group(ReplyForm, () {
    group('from', () {
      test('returns $ReplyForm', () {
        final data = ReplyDataPlaceholder();
        final commentData = ReplyCommentDataPlaceholder();
        const formData = ReplyFormDataPlaceholder();

        expect(
          ReplyForm.from(data),
          ReplyForm(
            hnuser: commentData.hnuser,
            age: commentData.age,
            htmlText: commentData.htmlText,
            parent: formData.parent,
            goto: formData.goto,
            hmac: formData.hmac,
          ),
        );
      });
    });

    group('toApi', () {
      test('returns ${api.ReplyForm}', () {
        final form = ReplyFormPlaceholder();

        expect(
          form.toApi(),
          api.ReplyForm(
            parent: form.parent,
            goto: form.goto,
            hmac: form.hmac,
            text: form.text,
          ),
        );
      });
    });

    group('empty', () {
      test('returns $ReplyForm', () {
        expect(
          ReplyForm.empty,
          isA<ReplyForm>(),
        );
      });
    });
  });
}
