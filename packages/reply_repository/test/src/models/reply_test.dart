import 'package:flutter_test/flutter_test.dart';
import 'package:reply_repository/reply_repository.dart';

void main() {
  group(Reply, () {
    group('from', () {
      test('returns $Reply', () {
        const parentId = 'parentId';
        final comment = CurrentUserCommentDataPlaceholder();
        final base = comment.base;
        expect(
          Reply.from(parentId: parentId, comment: comment),
          Reply(
            id: base.id,
            parentId: parentId,
            indent: base.indent + 1,
            hnuser: base.hnuser,
            age: base.age,
            htmlText: base.htmlText,
            replyUrl: base.replyUrl,
            score: comment.score,
            editUrl: comment.editUrl,
            deleteUrl: comment.deleteUrl,
          ),
        );
      });
    });
  });
}
