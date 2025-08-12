import 'package:draft_repository/draft_repository.dart';
import 'package:draft_storage/draft_storage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(CommentDraft, () {
    group('from', () {
      test('returns $CommentDraft', () {
        final updatedAt = DateTime.utc(2025, 8, 11, 19, 30);

        final data = CommentDraftDataPlaceholder(
          updatedAt: updatedAt,
        );

        expect(
          CommentDraft.from(data),
          CommentDraft(
            id: data.id,
            updatedAt: updatedAt.toLocal(),
            content: data.content,
            parentId: data.parentId,
            postTitle: data.postTitle,
          ),
        );
      });
    });
  });
}
