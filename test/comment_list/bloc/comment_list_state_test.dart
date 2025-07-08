import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_list/comment_list.dart';

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
