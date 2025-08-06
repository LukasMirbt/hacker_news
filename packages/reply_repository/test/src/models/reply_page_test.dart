import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';

class _MockReplyPageData extends Mock implements ReplyPageData {}

void main() {
  group(ReplyPage, () {
    group('from', () {
      const formData = ReplyFormDataPlaceholder();
      final parentData = OtherUserReplyParentDataPlaceholder();

      late ReplyPageData data;

      setUp(() {
        data = _MockReplyPageData();
        when(() => data.parentData).thenReturn(parentData);
      });

      test('returns $ReplyPage with correct values '
          'when data is non-null', () {
        when(() => data.formData).thenReturn(formData);
        expect(
          ReplyPage.from(data),
          ReplyPage(
            parent: ReplyParent.from(parentData),
            form: ReplyForm.from(formData),
          ),
        );
      });

      test('returns $ReplyPage with correct values '
          'when data is null', () {
        expect(
          ReplyPage.from(data),
          ReplyPage(
            parent: ReplyParent.from(parentData),
            form: null,
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
