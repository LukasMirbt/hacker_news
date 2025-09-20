import 'package:app/feed/feed.dart';
import 'package:app/thread_feed/thread_feed.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(OtherUserThreadCommentModelPlaceholder, () {
    group('constructor', () {
      test('returns $PostFeedItemModel with correct indent '
          'when index % 3 == 0', () {
        expect(
          OtherUserThreadCommentModelPlaceholder(0),
          isA<OtherUserThreadCommentModel>().having(
            (item) => item.indent,
            'indent',
            0,
          ),
        );
      });

      test('returns $PostFeedItemModel with correct indent '
          'when index % 3 == 1', () {
        expect(
          OtherUserThreadCommentModelPlaceholder(1),
          isA<OtherUserThreadCommentModel>().having(
            (item) => item.indent,
            'indent',
            1,
          ),
        );
      });

      test('returns $PostFeedItemModel with correct indent '
          'when index % 3 == 2', () {
        expect(
          OtherUserThreadCommentModelPlaceholder(2),
          isA<OtherUserThreadCommentModel>().having(
            (item) => item.indent,
            'indent',
            2,
          ),
        );
      });
    });
  });
}
