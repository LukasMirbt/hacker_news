import 'package:draft_repository/draft_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/drafts/drafts.dart';
import 'package:mocktail/mocktail.dart';

class _MockReplyDraft extends Mock implements ReplyDraft {}

void main() {
  group(ReplyDraftModel, () {
    late ReplyDraft draft;

    setUp(() {
      draft = _MockReplyDraft();
    });

    ReplyDraftModel createSubject() {
      return ReplyDraftModel(draft: draft);
    }

    group('url', () {
      test('returns draft.url', () {
        const url = 'url';
        when(() => draft.url).thenReturn(url);
        final model = createSubject();
        expect(model.url, url);
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
      test('returns correct value when parentHtmlText '
          'contains html elements', () {
        const parentHtmlText = 'Lorem ipsum.<p>Dolor sit amet.</p>';
        when(() => draft.parentHtmlText).thenReturn(parentHtmlText);
        final model = createSubject();
        expect(model.subtitle, 'Lorem ipsum. Dolor sit amet.');
      });

      test('returns empty string when parentHtmlText '
          'does not contain html elements', () {
        const parentHtmlText = 'Lorem ipsum. Dolor sit amet.';
        when(() => draft.parentHtmlText).thenReturn(parentHtmlText);
        final model = createSubject();
        expect(model.subtitle, parentHtmlText);
      });
    });

    group('toRepository', () {
      test('returns draft', () {
        final model = createSubject();
        expect(model.toRepository(), draft);
      });
    });
  });
}
