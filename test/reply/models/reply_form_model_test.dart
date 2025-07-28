// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';

class _MockReplyForm extends Mock implements ReplyForm {}

void main() {
  const text = 'text';

  group(ReplyFormModel, () {
    late ReplyForm form;

    setUp(() {
      form = _MockReplyForm();
    });

    ReplyFormModel createSubject({
      required ReplyForm? form,
      required String? text,
      SubmissionStatus submissionStatus = SubmissionStatus.initial,
    }) {
      return ReplyFormModel(
        text: text,
        form: form,
        submissionStatus: submissionStatus,
      );
    }

    group('isReplyingEnabled', () {
      test('returns true when form is non-null', () {
        final model = createSubject(
          text: text,
          form: form,
        );
        expect(model.isReplyingEnabled, true);
      });

      test('returns false when form is null', () {
        final model = createSubject(
          text: text,
          form: null,
        );
        expect(model.isReplyingEnabled, false);
      });
    });

    group('isValid', () {
      test('returns false when form is null', () {
        final model = createSubject(
          text: text,
          form: null,
        );
        expect(model.isValid, false);
      });

      test('returns false when trimmed text is empty', () {
        final model = createSubject(
          text: '',
          form: form,
        );
        expect(model.isValid, false);
      });

      test(
        'returns true when form is non-null '
        'and trimmed text is not empty',
        () {
          final model = createSubject(
            text: text,
            form: form,
          );
          expect(model.isValid, true);
        },
      );
    });

    group('isSubmissionLoading', () {
      test('returns false when submissionStatus is '
          '${SubmissionStatus.initial}', () {
        final model = createSubject(
          text: text,
          form: form,
        );
        expect(model.isSubmissionLoading, false);
      });

      test('returns true when submissionStatus is '
          '${SubmissionStatus.loading}', () {
        final model = createSubject(
          text: text,
          form: form,
          submissionStatus: SubmissionStatus.loading,
        );
        expect(model.isSubmissionLoading, true);
      });

      test('returns true when submissionStatus is '
          '${SubmissionStatus.success}', () {
        final model = createSubject(
          text: text,
          form: form,
          submissionStatus: SubmissionStatus.success,
        );
        expect(model.isSubmissionLoading, true);
      });

      test('returns false when submissionStatus is '
          '${SubmissionStatus.failure}', () {
        final model = createSubject(
          text: text,
          form: form,
          submissionStatus: SubmissionStatus.failure,
        );
        expect(model.isSubmissionLoading, false);
      });
    });

    group('toRepository', () {
      test('returns form with correct text '
          'when form is non-null', () {
        final form = ReplyFormPlaceholder();
        final model = createSubject(
          text: text,
          form: form,
        );
        expect(
          model.toRepository(),
          form.copyWith(text: text),
        );
      });

      test('throws $NullReplyFormException '
          'when form is null', () {
        final model = createSubject(
          text: text,
          form: null,
        );
        expect(
          model.toRepository,
          throwsA(
            NullReplyFormException(),
          ),
        );
      });
    });

    group('copyWith', () {
      test('returns $ReplyFormModel with updated fields '
          'when values are non-null', () {
        final updatedForm = ReplyFormPlaceholder();
        const updatedText = 'updatedText';
        const updatedSubmissionStatus = SubmissionStatus.success;
        final model = createSubject(
          text: text,
          form: form,
        );
        expect(
          model.copyWith(
            form: updatedForm,
            text: updatedText,
            submissionStatus: updatedSubmissionStatus,
          ),
          ReplyFormModel(
            form: updatedForm,
            text: updatedText,
            submissionStatus: updatedSubmissionStatus,
          ),
        );
      });

      test('returns $ReplyFormModel with previous fields '
          'when values are null', () {
        final form = ReplyFormPlaceholder();
        final model = createSubject(
          text: text,
          form: form,
        );
        expect(model.copyWith(), model);
      });
    });
  });
}
