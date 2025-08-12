import 'package:draft_storage/draft_storage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(ReplyDraftDataPlaceholder, () {
    test('returns $ReplyDraftData', () {
      expect(
        ReplyDraftDataPlaceholder(),
        isA<ReplyDraftData>(),
      );
    });
  });
}
