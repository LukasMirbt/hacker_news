import 'package:draft_repository/draft_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/drafts/drafts.dart';

void main() {
  group(DraftModel, () {
    group('from', () {
      test('returns $CommentDraftModel when draft '
          'is $CommentDraft', () {
        final draft = CommentDraftPlaceholder();
        expect(
          DraftModel.from(draft),
          CommentDraftModel(draft: draft),
        );
      });

      test('returns $ReplyDraftModel when draft '
          'is $ReplyDraft', () {
        final draft = ReplyDraftPlaceholder();
        expect(
          DraftModel.from(draft),
          ReplyDraftModel(draft: draft),
        );
      });
    });
  });
}
