import 'package:flutter_test/flutter_test.dart';
import 'package:reply_repository/reply_repository.dart';

void main() {
  group(ReplyUpdate, () {
    ReplyUpdate createSubject() {
      return ReplyUpdate(
        form: ReplyFormPlaceholder(),
        comment: CurrentUserCommentDataPlaceholder(),
      );
    }

    test('is not equatable', () {
      final first = createSubject();
      final second = createSubject();
      expect(first == second, false);
    });
  });
}
