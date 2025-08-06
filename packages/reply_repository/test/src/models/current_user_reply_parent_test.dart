import 'package:flutter_test/flutter_test.dart';
import 'package:reply_repository/reply_repository.dart';

void main() {
  group(CurrentUserReplyParent, () {
    group('from', () {
      test('returns $CurrentUserReplyParent', () {
        final data = CurrentUserReplyParentDataPlaceholder();
        final base = data.base;
        expect(
          CurrentUserReplyParent.from(data),
          CurrentUserReplyParent(
            id: base.id,
            hnuser: base.hnuser,
            age: base.age,
            htmlText: base.htmlText,
            score: data.score,
          ),
        );
      });
    });
  });
}
