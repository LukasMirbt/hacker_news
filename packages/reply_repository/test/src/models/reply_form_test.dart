import 'package:flutter_test/flutter_test.dart';
import 'package:reply_api/reply_api.dart' as api;
import 'package:reply_repository/reply_repository.dart';

void main() {
  group(ReplyForm, () {
    group('from', () {
      test('returns $ReplyForm', () {
        const data = ReplyFormDataPlaceholder();

        expect(
          ReplyForm.from(data),
          ReplyForm(
            parentId: data.parent,
            goto: data.goto,
            hmac: data.hmac,
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
            parent: form.parentId,
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
