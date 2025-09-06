// ignore_for_file: prefer_const_constructors

import 'package:app/comment/comment.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockCommentForm extends Mock implements CommentForm {}

void main() {
  const text = 'text';

  group(CommentFormModel, () {
    late CommentForm form;

    setUp(() {
      form = _MockCommentForm();
    });

    CommentFormModel createSubject({
      required CommentForm? form,
      required String? text,
      SubmissionStatus submissionStatus = SubmissionStatus.initial,
    }) {
      return CommentFormModel(
        text: text,
        form: form,
        submissionStatus: submissionStatus,
      );
    }

    group('empty', () {
      test('returns $CommentFormModel', () {
        expect(
          CommentFormModel.empty,
          isA<CommentFormModel>(),
        );
      });
    });

    group('isCommentingEnabled', () {
      test('returns true when form is non-null', () {
        final model = createSubject(
          text: text,
          form: form,
        );
        expect(model.isCommentingEnabled, true);
      });

      test('returns false when form is null', () {
        final model = createSubject(
          text: text,
          form: null,
        );
        expect(model.isCommentingEnabled, false);
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

    group('updateWith', () {
      test('returns empty $CommentFormModel when form is null', () {
        final model = createSubject(
          text: text,
          form: form,
        );
        expect(
          model.updateWith(null),
          CommentFormModel.empty,
        );
      });

      test('returns correct $CommentFormModel when form '
          'is non-null and text is null', () {
        final updatedForm = _MockCommentForm();
        final model = createSubject(
          text: text,
          form: form,
        );
        expect(
          model.updateWith(updatedForm),
          model.copyWith(form: updatedForm),
        );
      });

      test('returns correct $CommentFormModel when form '
          'is non-null and text is non-null', () {
        const updatedText = 'updatedText';
        final updatedForm = _MockCommentForm();
        when(() => updatedForm.text).thenReturn(updatedText);
        final model = createSubject(
          text: text,
          form: form,
        );
        expect(
          model.updateWith(updatedForm),
          model.copyWith(
            form: updatedForm,
            text: updatedText,
          ),
        );
      });
    });

    group('toRepository', () {
      test('returns form with correct text '
          'when form is non-null', () {
        final form = CommentFormPlaceholder();
        final model = createSubject(
          text: text,
          form: form,
        );
        expect(
          model.toRepository(),
          form.copyWith(text: text),
        );
      });

      test('throws $NullCommentFormException '
          'when form is null', () {
        final model = createSubject(
          text: text,
          form: null,
        );
        expect(
          model.toRepository,
          throwsA(
            NullCommentFormException(),
          ),
        );
      });
    });

    group('copyWith', () {
      test('returns $CommentFormModel with updated fields '
          'when values are non-null', () {
        final updatedForm = CommentFormPlaceholder();
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
          CommentFormModel(
            form: updatedForm,
            text: updatedText,
            submissionStatus: updatedSubmissionStatus,
          ),
        );
      });

      test('returns $CommentFormModel with previous fields '
          'when values are null', () {
        final form = CommentFormPlaceholder();
        final model = createSubject(
          text: text,
          form: form,
        );
        expect(model.copyWith(), model);
      });
    });
  });
}
