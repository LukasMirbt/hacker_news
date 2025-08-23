import 'package:app/comment_list/comment_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(CommentListState, () {
    group('initial', () {
      test('returns $CommentListState', () {
        const id = 'id';
        expect(
          CommentListState.initial(id: id),
          CommentListState(
            id: id,
            commentList: CommentListModelPlaceholder(),
          ),
        );
      });
    });
  });
}
