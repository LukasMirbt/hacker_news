// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';

class _MockReplyRepository extends Mock implements ReplyRepository {}

void main() {
  final form = ReplyFormPlaceholder();

  group(SavedReplyModel, () {
    late ReplyRepository repository;

    setUp(() {
      repository = _MockReplyRepository();
    });

    SavedReplyModel createSubject() {
      return SavedReplyModel(
        replyRepository: repository,
      );
    }

    group('load', () {
      const savedReply = 'savedReply';

      final readReply = () => repository.readReply(
        parentId: form.parentId,
      );

      test('returns null when form is null', () {
        final model = createSubject();
        expect(model.load(null), null);
      });

      test('calls readReply and returns result '
          'when form is non-null', () {
        when(readReply).thenReturn(savedReply);
        final model = createSubject();
        expect(model.load(form), savedReply);
        verify(readReply).called(1);
      });
    });

    group('save', () {
      final saveReply = () => repository.saveReply(
        parentId: form.parentId,
        text: form.text,
      );

      test('calls saveReply', () async {
        when(saveReply).thenAnswer((_) async {});
        final model = createSubject();
        model.save(form);
        verify(saveReply).called(1);
      });
    });
  });
}
