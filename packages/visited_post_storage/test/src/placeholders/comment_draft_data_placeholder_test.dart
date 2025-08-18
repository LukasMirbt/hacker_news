import 'package:flutter_test/flutter_test.dart';
import 'package:visited_post_storage/visited_post_storage.dart';

void main() {
  group(CommentDraftDataPlaceholder, () {
    test('returns $CommentDraftData', () {
      expect(
        CommentDraftDataPlaceholder(),
        isA<CommentDraftData>(),
      );
    });
  });
}
