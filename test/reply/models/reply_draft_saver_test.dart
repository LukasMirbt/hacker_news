// ignore_for_file: cascade_invocations
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';

class _MockReplyRepository extends Mock implements ReplyRepository {}

void main() {
  const url = 'url';
  final form = ReplyFormPlaceholder();
  final parent = OtherUserReplyParentPlaceholder();

  group(ReplyDraftSaver, () {
    late ReplyRepository repository;

    setUp(() {
      repository = _MockReplyRepository();
    });

    ReplyDraftSaver createSubject() {
      return ReplyDraftSaver(
        replyRepository: repository,
      );
    }

    final updateReply = () => repository.updateReply(
      url: url,
      form: form,
      parent: parent,
    );

    group('update', () {
      test('throws $DisposedError when isDisposed', () {
        final saver = createSubject();
        saver.dispose();
        expect(
          () => saver.update(
            url: url,
            form: form,
            parent: parent,
          ),
          throwsA(
            DisposedError(),
          ),
        );
      });

      test('calls pendingAction after debounce duration', () {
        fakeAsync((async) {
          when(updateReply).thenAnswer((_) async {});
          final saver = createSubject();

          saver.update(
            url: url,
            form: form,
            parent: parent,
          );
          verifyNever(updateReply);

          async.flushTimers();
          verify(updateReply).called(1);
        });
      });

      test('cancels previous timer', () {
        fakeAsync((async) {
          when(updateReply).thenAnswer((_) async {});
          final saver = createSubject();

          saver.update(
            url: url,
            form: form,
            parent: parent,
          );
          expect(async.pendingTimers.length, 1);

          saver.update(
            url: url,
            form: form,
            parent: parent,
          );
          expect(async.pendingTimers.length, 1);
        });
      });

      test('clears pendingAction after debounce duration', () {
        fakeAsync((async) {
          when(updateReply).thenAnswer((_) async {});
          final saver = createSubject();
          saver.update(
            url: url,
            form: form,
            parent: parent,
          );
          async.flushTimers();
          saver.flush();
          verify(updateReply).called(1);
        });
      });
    });

    group('flush', () {
      test('throws $DisposedError when isDisposed', () {
        final saver = createSubject();
        saver.dispose();
        expect(
          saver.flush,
          throwsA(
            DisposedError(),
          ),
        );
      });

      test('calls pendingAction immediately', () {
        fakeAsync((async) {
          when(updateReply).thenAnswer((_) async {});
          final saver = createSubject();
          saver.update(
            url: url,
            form: form,
            parent: parent,
          );
          saver.flush();
          verify(updateReply).called(1);
        });
      });

      test('cancels timer', () {
        fakeAsync((async) {
          when(updateReply).thenAnswer((_) async {});
          final saver = createSubject();

          saver.update(
            url: url,
            form: form,
            parent: parent,
          );
          expect(async.pendingTimers.length, 1);

          saver.flush();
          expect(async.pendingTimers, isEmpty);
        });
      });

      test('clears pendingAction', () {
        fakeAsync((async) {
          when(updateReply).thenAnswer((_) async {});
          final saver = createSubject();

          saver.update(
            url: url,
            form: form,
            parent: parent,
          );

          saver.flush();
          verify(updateReply).called(1);

          saver.flush();
          verifyNever(updateReply);
        });
      });
    });

    group('dispose', () {
      test('throws $DisposedError when isDisposed', () {
        final saver = createSubject();
        saver.dispose();
        expect(
          saver.dispose,
          throwsA(
            DisposedError(),
          ),
        );
      });

      test('cancels timer without calling pendingAction', () {
        fakeAsync((async) {
          when(updateReply).thenAnswer((_) async {});
          final saver = createSubject();

          saver.update(
            url: url,
            form: form,
            parent: parent,
          );
          expect(async.pendingTimers.length, 1);
          verifyNever(updateReply);

          saver.dispose();
          expect(async.pendingTimers, isEmpty);
          verifyNever(updateReply);
        });
      });
    });
  });
}
