import 'package:draft_repository/draft_repository.dart';
import 'package:draft_storage/draft_storage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(ReplyDraft, () {
    group('from', () {
      test('returns $ReplyDraft', () {
        final updatedAt = DateTime.utc(2025, 8, 11, 19, 30);

        final data = ReplyDraftDataPlaceholder(
          updatedAt: updatedAt,
        );

        expect(
          ReplyDraft.from(data),
          ReplyDraft(
            id: data.id,
            updatedAt: updatedAt.toLocal(),
            content: data.content,
            parentId: data.parentId,
            url: data.url,
            parentHtmlText: data.parentHtmlText,
          ),
        );
      });
    });
  });
}
