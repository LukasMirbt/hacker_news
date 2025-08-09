import 'package:draft_repository/draft_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_draft_options/comment_draft_options.dart';
import 'package:mocktail/mocktail.dart';

class _MockCommentDraft extends Mock implements CommentDraft {}

void main() {
  group(CommentDraftModel, () {
    late CommentDraft draft;

    setUp(() {
      draft = _MockCommentDraft();
    });

    CommentDraftModel buildSubject() {
      return CommentDraftModel(draft: draft);
    }

    group('postId', () {
      test('returns draft.postId', () {
        const postId = 'postId';
        when(() => draft.postId).thenReturn(postId);
        final model = buildSubject();
        expect(model.postId, postId);
      });
    });

    group('postTitle', () {
      test('returns draft.postTitle', () {
        const postTitle = 'postTitle';
        when(() => draft.postTitle).thenReturn(postTitle);
        final model = buildSubject();
        expect(model.postTitle, postTitle);
      });
    });

    group('toRepository', () {
      test('returns draft', () {
        final model = buildSubject();
        expect(model.toRepository(), draft);
      });
    });
  });
}
