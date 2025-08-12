import 'package:draft_repository/draft_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply_draft_options/reply_draft_options.dart';
import 'package:mocktail/mocktail.dart';

class _MockReplyDraft extends Mock implements ReplyDraft {}

void main() {
  group(ReplyDraftModel, () {
    late ReplyDraft draft;

    setUp(() {
      draft = _MockReplyDraft();
    });

    ReplyDraftModel buildSubject() {
      return ReplyDraftModel(draft: draft);
    }

    group('toRepository', () {
      test('returns draft', () {
        final model = buildSubject();
        expect(model.toRepository(), draft);
      });
    });
  });
}
