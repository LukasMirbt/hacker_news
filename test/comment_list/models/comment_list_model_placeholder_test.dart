import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_list/comment_list.dart';

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
