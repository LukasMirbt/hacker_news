import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart'
    hide CurrentUserThreadComment;
import 'package:reply_repository/reply_repository.dart';
import 'package:thread_repository/thread_repository.dart';

void main() {
  group('CurrentUserCommentDataExtension', () {
    group('toThread', () {
      test('returns $CurrentUserThreadComment', () {
        final data = CurrentUserCommentDataPlaceholder();
        final base = data.base;
        expect(
          data.toThread(),
          CurrentUserThreadComment(
            id: base.id,
            indent: base.indent,
            hnuser: base.hnuser,
            age: base.age,
            htmlText: base.htmlText,
            replyUrl: base.replyUrl,
            parentUrl: null,
            contextUrl: null,
            onUrl: null,
            onTitle: null,
            score: data.score,
          ),
        );
      });
    });
  });
}
