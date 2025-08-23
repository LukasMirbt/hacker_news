import 'package:app/drafts/drafts.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockCommentDraft extends Mock implements CommentDraft {}

void main() {
  group(CommentDraftModel, () {
    late CommentDraft draft;

    setUp(() {
      draft = _MockCommentDraft();
    });

    CommentDraftModel createSubject() {
      return CommentDraftModel(draft: draft);
    }

    group('postId', () {
      test('returns draft.parentId', () {
        const parentId = 'parentId';
        when(() => draft.parentId).thenReturn(parentId);
        final model = createSubject();
        expect(model.postId, parentId);
      });
    });

    group('title', () {
      test('returns draft.content', () {
        const content = 'content';
        when(() => draft.content).thenReturn(content);
        final model = createSubject();
        expect(model.title, content);
      });
    });

    group('subtitle', () {
      test('returns draft.postTitle', () {
        const postTitle = 'postTitle';
        when(() => draft.postTitle).thenReturn(postTitle);
        final model = createSubject();
        expect(model.subtitle, postTitle);
      });
    });

    group('toRepository', () {
      test('returns draft', () {
        final model = createSubject();
        expect(model.toRepository(), draft);
      });
    });

    group('props', () {
      test('are correct', () {
        final model = createSubject();
        expect(model.props, [draft]);
      });
    });
  });
}
