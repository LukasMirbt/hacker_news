import 'package:app/comment_list/comment_list.dart' hide CurrentUserComment;
import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart';
import 'package:reply_repository/reply_repository.dart';

void main() {
  group('ReplyExtension', () {
    group('toThread', () {
      test('returns $CurrentUserComment', () {
        final reply = ReplyPlaceholder();
        expect(
          reply.toComment(),
          CurrentUserComment(
            id: reply.id,
            indent: reply.indent,
            hnuser: reply.hnuser,
            age: reply.age,
            htmlText: reply.htmlText,
            replyUrl: reply.replyUrl,
            score: reply.score,
            editUrl: reply.editUrl,
            deleteUrl: reply.deleteUrl,
          ),
        );
      });
    });
  });
}
