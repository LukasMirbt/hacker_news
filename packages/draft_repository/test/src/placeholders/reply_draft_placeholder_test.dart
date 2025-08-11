import 'package:draft_repository/draft_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(ReplyDraftPlaceholder, () {
    test('returns $ReplyDraft', () {
      expect(
        ReplyDraftPlaceholder(),
        isA<ReplyDraft>(),
      );
    });
  });
}
