import 'package:app/thread_feed/thread_feed.dart' hide CurrentUserThreadComment;
import 'package:flutter_test/flutter_test.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:thread_repository/thread_repository.dart';

void main() {
  group('ReplyExtension', () {
    group('toThread', () {
      test('returns $CurrentUserThreadComment', () {
        final reply = ReplyPlaceholder();
        expect(
          reply.toThread(),
          CurrentUserThreadComment(
            id: reply.id,
            indent: reply.indent,
            hnuser: reply.hnuser,
            age: reply.age,
            htmlText: reply.htmlText,
            replyUrl: reply.replyUrl,
            score: reply.score,
            parentUrl: null,
            contextUrl: null,
            onUrl: null,
            onTitle: null,
          ),
        );
      });
    });
  });
}
