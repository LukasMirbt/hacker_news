import 'package:flutter_test/flutter_test.dart';
import 'package:thread_repository/thread_repository.dart';

void main() {
  group(ThreadComment, () {
    group('from', () {
      test('returns $CurrentUserThreadComment when data '
          'is $CurrentUserThreadCommentData', () {
        final data = CurrentUserThreadCommentDataPlaceholder();
        expect(
          ThreadComment.from(data),
          CurrentUserThreadComment.from(data),
        );
      });

      test('returns $OtherUserThreadComment when data '
          'is $OtherUserThreadCommentData', () {
        final data = OtherUserThreadCommentDataPlaceholder();
        expect(
          ThreadComment.from(data),
          OtherUserThreadComment.from(data),
        );
      });
    });

    group('postId', () {
      final comment = OtherUserThreadCommentPlaceholder();

      test('returns null when onUrl is null', () {
        final c = comment.copyWith(onUrl: null);
        expect(c.postId, null);
      });

      test('returns null when onUrl is invalid', () {
        final c = comment.copyWith(onUrl: ':url');
        expect(c.postId, null);
      });

      test('returns correct value parsed url is non-null', () {
        const id = 'id';
        const onUrl = 'https://www.example.com?id=$id';
        final c = comment.copyWith(onUrl: onUrl);
        expect(c.postId, id);
      });
    });
  });
}
