import 'package:flutter_test/flutter_test.dart';
import 'package:reply_repository/reply_repository.dart';

void main() {
  group(ReplyParent, () {
    group('from', () {
      test('returns $CurrentUserReplyParent when data '
          'is $CurrentUserReplyParentData', () {
        final data = CurrentUserReplyParentDataPlaceholder();
        expect(
          ReplyParent.from(data),
          CurrentUserReplyParent.from(data),
        );
      });

      test('returns $OtherUserReplyParent when data '
          'is $OtherUserReplyParentData', () {
        final data = OtherUserReplyParentDataPlaceholder();
        expect(
          ReplyParent.from(data),
          OtherUserReplyParent.from(data),
        );
      });
    });
  });
}
