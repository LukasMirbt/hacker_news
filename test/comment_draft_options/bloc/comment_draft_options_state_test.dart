import 'package:draft_repository/draft_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_draft_options/comment_draft_options.dart';

void main() {
  final draft = CommentDraftPlaceholder();

  group(CommentDraftOptionsState, () {
    group('from', () {
      test('returns $CommentDraftOptionsState', () {
        expect(
          CommentDraftOptionsState.from(draft),
          CommentDraftOptionsState(
            draft: CommentDraftModel(draft: draft),
          ),
        );
      });
    });
  });
}
