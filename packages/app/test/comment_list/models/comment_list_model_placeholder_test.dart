import 'package:app/comment_list/comment_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(CommentListModelPlaceholder, () {
    group('constructor', () {
      test('returns $CommentListModel', () {
        expect(
          CommentListModelPlaceholder(),
          isA<CommentListModel>(),
        );
      });
    });
  });
}
