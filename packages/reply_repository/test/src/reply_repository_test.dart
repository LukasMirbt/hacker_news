// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:async';

import 'package:authentication_api/authentication_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';

class _MockReplyApi extends Mock implements ReplyApi {}

class _MockAuthenticationApi extends Mock implements AuthenticationApi {}

class _MockAuthenticationState extends Mock implements AuthenticationState {}

class _MockReplyStorage extends Mock implements ReplyStorage {}

class _MockUserReplyService extends Mock implements UserReplyService {}

void main() {
  const parentId = 'parentId';
  const userId = 'userId';
  const text = 'text';
  const user = UserPlaceholder(id: userId);

  const storageKey = ReplyStorageKey(
    parentId: parentId,
    userId: userId,
  );

  group(ReplyRepository, () {
    late ReplyApi replyApi;
    late AuthenticationApi authenticationApi;
    late AuthenticationState authenticationState;
    late ReplyStorage replyStorage;
    late UserReplyService userReplyService;

    setUp(() {
      replyApi = _MockReplyApi();
      authenticationApi = _MockAuthenticationApi();
      authenticationState = _MockAuthenticationState();
      replyStorage = _MockReplyStorage();
      userReplyService = _MockUserReplyService();
      when(() => authenticationApi.state).thenReturn(authenticationState);
      when(() => authenticationState.user).thenReturn(user);
    });

    ReplyRepository createSubject() {
      return ReplyRepository(
        replyApi: replyApi,
        authenticationApi: authenticationApi,
        replyStorage: replyStorage,
        userReplyService: userReplyService,
      );
    }

    group('fetchReplyPage', () {
      const url = 'url';
      final data = ReplyPageDataPlaceholder();
      final request = () => replyApi.fetchReplyPage(url: url);

      test('returns $ReplyPage', () {
        when(request).thenAnswer((_) async => data);
        final repository = createSubject();
        expect(
          repository.fetchReplyPage(url: url),
          completion(
            ReplyPage.from(data),
          ),
        );
        verify(request).called(1);
      });
    });

    group('readReply', () {
      final read = () => replyStorage.read(storageKey);

      test('calls read and returns text', () {
        when(read).thenReturn(text);
        final repository = createSubject();
        expect(
          repository.readReply(parentId: parentId),
          text,
        );
        verify(read).called(1);
      });
    });

    group('saveReply', () {
      final save = () => replyStorage.save(
        storageKey: storageKey,
        text: text,
      );

      test('calls save', () async {
        when(save).thenAnswer((_) async {});
        final repository = createSubject();
        await repository.saveReply(
          parentId: parentId,
          text: text,
        );
        verify(save).called(1);
      });
    });

    group('reply', () {
      final form = ReplyFormPlaceholder();
      final comment = CurrentUserCommentDataPlaceholder();
      final commentThread = [comment];

      final reply = () => replyApi.reply(form.toApi());

      final fetchCommentThread = () =>
          replyApi.fetchCommentThread(id: form.parentId);

      final newestComment = () => userReplyService.newestComment(commentThread);

      test('calls reply, fetchCommentThread, newestComment '
          'and emits $ReplyUpdate when fetchCommentThread succeeds', () async {
        when(reply).thenAnswer((_) async {});
        when(fetchCommentThread).thenAnswer((_) async => commentThread);
        when(newestComment).thenReturn(comment);
        final repository = createSubject();
        unawaited(
          expectLater(
            repository.stream,
            emits(
              isA<ReplyUpdate>()
                  .having(
                    (update) => update.form,
                    'form',
                    form,
                  )
                  .having(
                    (update) => update.comment,
                    'comment',
                    comment,
                  ),
            ),
          ),
        );
        await repository.reply(form);
        verify(reply).called(1);
        verify(fetchCommentThread).called(1);
        verify(newestComment).called(1);
      });

      test('calls reply and returns when fetchCommentThread throws', () async {
        when(reply).thenAnswer((_) async {});
        when(fetchCommentThread).thenThrow(Exception('oops'));
        final repository = createSubject();
        await repository.reply(form);
        verify(reply).called(1);
        verify(fetchCommentThread).called(1);
      });

      test('calls reply, fetchCommentThread and returns '
          'when newestComment throws', () async {
        when(reply).thenAnswer((_) async {});
        when(fetchCommentThread).thenAnswer((_) async => commentThread);
        when(newestComment).thenThrow(Exception('oops'));
        final repository = createSubject();
        await repository.reply(form);
        verify(reply).called(1);
        verify(fetchCommentThread).called(1);
        verify(newestComment).called(1);
      });
    });
  });
}
