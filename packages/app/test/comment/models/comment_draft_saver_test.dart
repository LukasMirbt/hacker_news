// ignore_for_file: cascade_invocations
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/comment/comment.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockPostRepository extends Mock implements PostRepository {}

void main() {
  final header = PostHeaderPlaceholder();
  const text = 'text';

  group(CommentDraftSaver, () {
    late PostRepository repository;

    setUp(() {
      repository = _MockPostRepository();
    });

    CommentDraftSaver createSubject() {
      return CommentDraftSaver(
        postRepository: repository,
      );
    }

    final updateComment = () =>
        repository.updateComment(header: header, text: text);

    group('update', () {
      test('throws $DisposedError when isDisposed', () {
        final saver = createSubject();
        saver.dispose();
        expect(
          () => saver.update(header: header, text: text),
          throwsA(
            DisposedError(),
          ),
        );
      });

      test('calls pendingAction after debounce duration', () {
        fakeAsync((async) {
          when(updateComment).thenAnswer((_) async {
            return;
          });
          final saver = createSubject();

          saver.update(header: header, text: text);
          verifyNever(updateComment);

          async.flushTimers();
          verify(updateComment).called(1);
        });
      });

      test('cancels previous timer', () {
        fakeAsync((async) {
          when(updateComment).thenAnswer((_) async {
            return;
          });
          final saver = createSubject();

          saver.update(header: header, text: text);
          expect(async.pendingTimers.length, 1);

          saver.update(header: header, text: text);
          expect(async.pendingTimers.length, 1);
        });
      });

      test('clears pendingAction after debounce duration', () {
        fakeAsync((async) {
          when(updateComment).thenAnswer((_) async {
            return;
          });
          final saver = createSubject();
          saver.update(header: header, text: text);
          async.flushTimers();
          saver.flush();
          verify(updateComment).called(1);
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
          when(updateComment).thenAnswer((_) async {
            return;
          });
          final saver = createSubject();
          saver.update(header: header, text: text);
          saver.flush();
          verify(updateComment).called(1);
        });
      });

      test('cancels timer', () {
        fakeAsync((async) {
          when(updateComment).thenAnswer((_) async {
            return;
          });
          final saver = createSubject();

          saver.update(header: header, text: text);
          expect(async.pendingTimers.length, 1);

          saver.flush();
          expect(async.pendingTimers, isEmpty);
        });
      });

      test('clears pendingAction', () {
        fakeAsync((async) {
          when(updateComment).thenAnswer((_) async {
            return;
          });
          final saver = createSubject();

          saver.update(header: header, text: text);

          saver.flush();
          verify(updateComment).called(1);

          saver.flush();
          verifyNever(updateComment);
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
          when(updateComment).thenAnswer((_) async {
            return;
          });
          final saver = createSubject();

          saver.update(header: header, text: text);
          expect(async.pendingTimers.length, 1);
          verifyNever(updateComment);

          saver.dispose();
          expect(async.pendingTimers, isEmpty);
          verifyNever(updateComment);
        });
      });
    });
  });
}
