import 'package:flutter_test/flutter_test.dart';
import 'package:reply_repository/reply_repository.dart';

void main() {
  group(ReplyPage, () {
    group('from', () {
      test('returns $ReplyPage', () {
        final data = ReplyPageDataPlaceholder();
        final parentData = data.parentData;
        final formData = data.formData;

        expect(
          ReplyPage.from(data),
          ReplyPage(
            parent: ReplyParent.from(parentData),
            form: ReplyForm.from(formData),
          ),
        );
      });
    });

    group('empty', () {
      test('returns $ReplyPage', () {
        expect(
          ReplyPage.empty,
          isA<ReplyPage>(),
        );
      });
    });
  });
}
