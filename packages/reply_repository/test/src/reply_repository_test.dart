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
      final page = ReplyPage.from(data);

      final storageKey = ReplyStorageKey(
        parentId: page.parent.id,
        userId: user.id,
      );

      final request = () => replyApi.fetchReplyPage(url: url);
      final read = () => replyStorage.read(storageKey);

      test('returns $ReplyPage without savedReply when null', () async {
        when(request).thenAnswer((_) async => data);
        final repository = createSubject();
        await expectLater(
          repository.fetchReplyPage(url: url),
          completion(page),
        );
        verify(request).called(1);
        verify(read).called(1);
      });

      test('returns $ReplyPage with savedReply when non-null', () async {
        when(request).thenAnswer((_) async => data);
        when(read).thenReturn(text);
        final repository = createSubject();
        await expectLater(
          repository.fetchReplyPage(url: url),
          completion(
            page.copyWith(
              form: page.form?.copyWith(
                text: text,
              ),
            ),
          ),
        );
        verify(request).called(1);
        verify(read).called(1);
      });
    });

    group('updateReply', () {
      final form = ReplyFormPlaceholder(
        parentId: parentId,
        text: text,
      );

      final save = () => replyStorage.save(
        storageKey: storageKey,
        text: text,
      );

      test('calls save', () async {
        when(save).thenAnswer((_) async {});
        final repository = createSubject();
        await repository.updateReply(form);
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

      final clear = () => replyStorage.clear(storageKey);

      final newestComment = () => userReplyService.newestComment(commentThread);

      test('calls reply, clear, fetchCommentThread, newestComment '
          'and emits $Reply when fetchCommentThread succeeds', () async {
        when(reply).thenAnswer((_) async {});
        when(clear).thenAnswer((_) async {});
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
        verify(clear).called(1);
        verify(fetchCommentThread).called(1);
        verify(newestComment).called(1);
      });

      test('calls reply and returns when clear throws', () async {
        when(reply).thenAnswer((_) async {});
        when(clear).thenThrow(Exception('oops'));
        final repository = createSubject();
        await repository.reply(form);
        verify(reply).called(1);
        verify(clear).called(1);
      });

      test('calls reply, clear and returns '
          'when fetchCommentThread throws', () async {
        when(reply).thenAnswer((_) async {});
        when(clear).thenAnswer((_) async {});
        when(fetchCommentThread).thenThrow(Exception('oops'));
        final repository = createSubject();
        await repository.reply(form);
        verify(reply).called(1);
        verify(clear).called(1);
        verify(fetchCommentThread).called(1);
      });

      test('calls reply, clear, fetchCommentThread and returns '
          'when newestComment throws', () async {
        when(reply).thenAnswer((_) async {});
        when(clear).thenAnswer((_) async {});
        when(fetchCommentThread).thenAnswer((_) async => commentThread);
        when(newestComment).thenThrow(Exception('oops'));
        final repository = createSubject();
        await repository.reply(form);
        verify(reply).called(1);
        verify(clear).called(1);
        verify(fetchCommentThread).called(1);
        verify(newestComment).called(1);
      });
    });
  });
}
