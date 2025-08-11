import 'package:draft_storage/draft_storage.dart';
import 'package:flutter_test/flutter_test.dart';

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
