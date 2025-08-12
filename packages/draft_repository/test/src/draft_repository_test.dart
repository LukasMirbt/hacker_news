// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:draft_repository/draft_repository.dart';
import 'package:draft_storage/draft_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDraftStorage extends Mock implements DraftStorage {}

void main() {
  group(DraftRepository, () {
    late DraftStorage storage;

    setUp(() {
      storage = _MockDraftStorage();
    });

    DraftRepository createSubject() {
      return DraftRepository(draftStorage: storage);
    }

    group('drafts', () {
      test('emits ${Draft}s sorted by updatedAt', () {
        final commentDraft = CommentDraftDataPlaceholder(
          updatedAt: DateTime(2025, 8, 11, 19, 30),
        );

        final firstReplyDraft = ReplyDraftDataPlaceholder(
          updatedAt: DateTime(2025, 8, 9, 13, 45),
        );

        final secondReplyDraft = ReplyDraftDataPlaceholder(
          updatedAt: DateTime(2025, 8, 11, 19, 45),
        );

        final watchCommentDrafts = () => storage.watchCommentDrafts();
        final watchReplyDrafts = () => storage.watchReplyDrafts();

        final repository = createSubject();

        when(watchCommentDrafts).thenAnswer(
          (_) => Stream.value(
            [commentDraft],
          ),
        );
        when(watchReplyDrafts).thenAnswer(
          (_) => Stream.fromIterable([
            [firstReplyDraft],
            [firstReplyDraft, secondReplyDraft],
          ]),
        );

        expect(
          repository.drafts,
          emitsInOrder([
            [
              CommentDraft.from(commentDraft),
              ReplyDraft.from(firstReplyDraft),
            ],
            [
              ReplyDraft.from(secondReplyDraft),
              CommentDraft.from(commentDraft),
              ReplyDraft.from(firstReplyDraft),
            ],
          ]),
        );

        verify(watchCommentDrafts).called(1);
        verify(watchReplyDrafts).called(1);
      });
    });

    group('deleteDraft', () {
      test('calls deleteCommentDraft when $Draft '
          'is $CommentDraft', () async {
        final draft = CommentDraftPlaceholder();
        final key = CommentDraftById(draft.id);
        final deleteCommentDraft = () => storage.deleteCommentDraft(key);
        when(deleteCommentDraft).thenAnswer((_) async {});
        final repository = createSubject();
        await repository.deleteDraft(draft);
        verify(deleteCommentDraft).called(1);
      });

      test('calls deleteReplyDraft when $Draft '
          'is $ReplyDraft', () async {
        final draft = ReplyDraftPlaceholder();
        final key = ReplyDraftById(draft.id);
        final deleteReplyDraft = () => storage.deleteReplyDraft(key);
        when(deleteReplyDraft).thenAnswer((_) async {});
        final repository = createSubject();
        await repository.deleteDraft(draft);
        verify(deleteReplyDraft).called(1);
      });
    });
  });
}
