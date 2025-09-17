import 'package:app/comment_list/comment_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(CommentListModelPlaceholder, () {
    CommentListModelPlaceholder createSubject() {
      return CommentListModelPlaceholder();
    }

    group('constructor', () {
      group('items', () {
        test('returns ${OtherUserCommentModelPlaceholder}s', () {
          final model = createSubject();
          expect(
            model.items,
            List.generate(
              10,
              OtherUserCommentModelPlaceholder.from,
            ),
          );
        });
      });
    });

    group('isPlaceholder', () {
      test('returns correct value', () {
        final model = createSubject();
        expect(model.isPlaceholder, true);
      });
    });

    group('isEmpty', () {
      test('returns correct value', () {
        final model = createSubject();
        expect(model.isEmpty, false);
      });
    });
  });
}
