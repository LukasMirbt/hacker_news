import 'package:flutter_test/flutter_test.dart';
import 'package:thread_repository/thread_repository.dart';

void main() {
  group(CurrentUserThreadComment, () {
    group('from', () {
      test('returns $CurrentUserThreadComment', () {
        final data = CurrentUserThreadCommentDataPlaceholder();
        final base = data.base;
        expect(
          CurrentUserThreadComment.from(data),
          CurrentUserThreadComment(
            id: base.id,
            indent: base.indent,
            hnuser: base.hnuser,
            age: base.age,
            htmlText: base.htmlText,
            replyUrl: base.replyUrl,
            parentUrl: base.parentUrl,
            contextUrl: base.contextUrl,
            onUrl: base.onUrl,
            onTitle: base.onTitle,
            score: data.score,
          ),
        );
      });
    });
  });
}
