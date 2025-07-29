import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  group(CurrentUserComment, () {
    group('from', () {
      test('returns $CurrentUserComment', () {
        final data = CurrentUserCommentDataPlaceholder();
        final base = data.base;
        expect(
          CurrentUserComment.from(data),
          CurrentUserComment(
            id: base.id,
            indent: base.indent,
            hnuser: base.hnuser,
            age: base.age,
            htmlText: base.htmlText,
            replyUrl: base.replyUrl,
            score: data.score,
          ),
        );
      });
    });
  });
}
