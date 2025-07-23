// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';

class _MockReplyApi extends Mock implements ReplyApi {}

class _MockUserReplyService extends Mock implements UserReplyService {}

void main() {
  group(ReplyRepository, () {
    late ReplyApi replyApi;
    late UserReplyService userReplyService;

    setUp(() {
      replyApi = _MockReplyApi();
      userReplyService = _MockUserReplyService();
    });

    ReplyRepository createSubject() {
      return ReplyRepository(
        replyApi: replyApi,
        userReplyService: userReplyService,
      );
    }

    group('fetchReplyForm', () {
      const url = 'url';
      final data = ReplyDataPlaceholder();
      final request = () => replyApi.fetchReplyForm(url: url);

      test('returns $ReplyForm', () {
        when(request).thenAnswer((_) async => data);
        final repository = createSubject();
        expect(
          repository.fetchReplyForm(url: url),
          completion(
            ReplyForm.from(data),
          ),
        );
        verify(request).called(1);
      });
    });

    group('reply', () {
      final form = ReplyFormPlaceholder();
      final comment = CommentDataPlaceholder();
      final commentThread = [comment];

      final reply = () => replyApi.reply(form.toApi());

      final fetchCommentThread = () =>
          replyApi.fetchCommentThread(id: form.parent);

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
