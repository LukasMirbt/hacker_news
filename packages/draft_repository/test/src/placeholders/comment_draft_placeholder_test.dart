import 'package:draft_repository/draft_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(CommentDraftPlaceholder, () {
    test('returns $CommentDraft', () {
      expect(
        CommentDraftPlaceholder(),
        isA<CommentDraft>(),
      );
    });
  });
}
