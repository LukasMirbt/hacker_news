import 'package:flutter_test/flutter_test.dart';
import 'package:reply_repository/reply_repository.dart';

void main() {
  group(ReplyForm, () {
    group('from', () {
      test('returns $ReplyForm', () {
        const htmlText = 'htmlText';
        const hmac = 'hmac';

        final data = ReplyFormDataPlaceholder(
          htmlText: htmlText,
          hmac: hmac,
        );

        final titleRowData = data.titleRowData;

        expect(
          ReplyForm.from(data),
          ReplyForm(
            id: titleRowData.id,
            hnuser: titleRowData.hnuser,
            age: titleRowData.age,
            htmlText: htmlText,
            hmac: hmac,
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
