// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:async';

import 'package:authentication_api/authentication_api.dart';
import 'package:draft_storage/draft_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';

class _MockReplyApi extends Mock implements ReplyApi {}

class _MockAuthenticationApi extends Mock implements AuthenticationApi {}

class _MockAuthenticationState extends Mock implements AuthenticationState {}

class _MockDraftStorage extends Mock implements DraftStorage {}

class _MockUserReplyService extends Mock implements UserReplyService {}

void main() {
  const parentId = 'parentId';
  const userId = 'userId';
  const text = 'text';
  const user = UserPlaceholder(id: userId);

  const draftStorageKey = ReplyDraftByUniqueKeys(
    parentId: parentId,
    userId: userId,
  );

  group(ReplyRepository, () {
    late ReplyApi replyApi;
    late AuthenticationApi authenticationApi;
    late AuthenticationState authenticationState;
    late DraftStorage draftStorage;
    late UserReplyService userReplyService;

    setUp(() {
      replyApi = _MockReplyApi();
      authenticationApi = _MockAuthenticationApi();
      authenticationState = _MockAuthenticationState();
      draftStorage = _MockDraftStorage();
      userReplyService = _MockUserReplyService();
      when(() => authenticationApi.state).thenReturn(authenticationState);
      when(() => authenticationState.user).thenReturn(user);
    });

    ReplyRepository createSubject() {
      return ReplyRepository(
        replyApi: replyApi,
        authenticationApi: authenticationApi,
        draftStorage: draftStorage,
        userReplyService: userReplyService,
      );
    }

    group('fetchReplyPage', () {
      const url = 'url';
      final data = ReplyPageDataPlaceholder();
      final page = ReplyPage.from(data);
      const savedReply = 'savedReply';

      final draft = ReplyDraftDataPlaceholder(
        content: savedReply,
      );

      final storageKey = ReplyDraftByUniqueKeys(
        parentId: page.parent.id,
        userId: user.id,
      );

      final request = () => replyApi.fetchReplyPage(url: url);
      final readReplyDraft = () => draftStorage.readReplyDraft(storageKey);

      test('returns $ReplyPage without saved reply '
          'when null', () async {
        when(request).thenAnswer((_) async => data);
        when(readReplyDraft).thenAnswer((_) async => null);
        final repository = createSubject();
        await expectLater(
          repository.fetchReplyPage(url: url),
          completion(page),
        );
        verify(request).called(1);
        verify(readReplyDraft).called(1);
      });

      test('returns $ReplyPage with saved reply '
          'when non-null', () async {
        when(request).thenAnswer((_) async => data);
        when(readReplyDraft).thenAnswer((_) async => draft);
        final repository = createSubject();
        await expectLater(
          repository.fetchReplyPage(url: url),
          completion(
            page.copyWith(
              form: page.form?.copyWith(
                text: savedReply,
              ),
            ),
          ),
        );
        verify(request).called(1);
        verify(readReplyDraft).called(1);
      });
    });

    group('updateReply', () {
      const url = 'url';

      final form = ReplyFormPlaceholder(
        parentId: parentId,
        text: text,
      );

      final parent = OtherUserReplyParentPlaceholder();

      final deleteReplyDraft = () =>
          draftStorage.deleteReplyDraft(draftStorageKey);

      final saveReplyDraft = () => draftStorage.saveReplyDraft(
        ReplyDraftsCompanion.insert(
          parentId: parentId,
          userId: userId,
          url: url,
          parentHtmlText: parent.htmlText,
          content: text,
        ),
      );

      test('calls deleteReplyDraft when trimmed text '
          'is empty', () async {
        when(deleteReplyDraft).thenAnswer((_) async {});
        final repository = createSubject();
        await repository.updateReply(
          url: url,
          form: form.copyWith(text: ' '),
          parent: parent,
        );
        verify(deleteReplyDraft).called(1);
      });

      test('calls saveReplyDraft when trimmed text '
          'is not empty', () async {
        when(saveReplyDraft).thenAnswer((_) async {});
        final repository = createSubject();
        await repository.updateReply(
          url: url,
          form: form,
          parent: parent,
        );
        verify(saveReplyDraft).called(1);
      });
    });

    group('reply', () {
      final form = ReplyFormPlaceholder();
      final comment = CurrentUserCommentDataPlaceholder();
      final commentThread = [comment];

      final reply = () => replyApi.reply(form.toApi());

      final fetchCommentThread = () =>
          replyApi.fetchCommentThread(id: form.parentId);

      final deleteReplyDraft = () =>
          draftStorage.deleteReplyDraft(draftStorageKey);

      final newestComment = () => userReplyService.newestComment(commentThread);

      test('calls reply, deleteReplyDraft, fetchCommentThread, newestComment '
          'and emits $Reply when fetchCommentThread succeeds', () async {
        when(reply).thenAnswer((_) async {});
        when(deleteReplyDraft).thenAnswer((_) async {});
        when(fetchCommentThread).thenAnswer((_) async => commentThread);
        when(newestComment).thenReturn(comment);
        final repository = createSubject();
        unawaited(
          expectLater(
            repository.stream,
            emits(
              Reply.from(
                parentId: parentId,
                comment: comment,
              ),
            ),
          ),
        );
        await repository.reply(form);
        verify(reply).called(1);
        verify(deleteReplyDraft).called(1);
        verify(fetchCommentThread).called(1);
        verify(newestComment).called(1);
      });

      test('calls reply and returns when deleteReplyDraft throws', () async {
        when(reply).thenAnswer((_) async {});
        when(deleteReplyDraft).thenThrow(Exception('oops'));
        final repository = createSubject();
        await repository.reply(form);
        verify(reply).called(1);
        verify(deleteReplyDraft).called(1);
      });

      test('calls reply, deleteReplyDraft and returns '
          'when fetchCommentThread throws', () async {
        when(reply).thenAnswer((_) async {});
        when(deleteReplyDraft).thenAnswer((_) async {});
        when(fetchCommentThread).thenThrow(Exception('oops'));
        final repository = createSubject();
        await repository.reply(form);
        verify(reply).called(1);
        verify(deleteReplyDraft).called(1);
        verify(fetchCommentThread).called(1);
      });

      test('calls reply, clear, fetchCommentThread and returns '
          'when newestComment throws', () async {
        when(reply).thenAnswer((_) async {});
        when(deleteReplyDraft).thenAnswer((_) async {});
        when(fetchCommentThread).thenAnswer((_) async => commentThread);
        when(newestComment).thenThrow(Exception('oops'));
        final repository = createSubject();
        await repository.reply(form);
        verify(reply).called(1);
        verify(deleteReplyDraft).called(1);
        verify(fetchCommentThread).called(1);
        verify(newestComment).called(1);
      });
    });
  });
}
