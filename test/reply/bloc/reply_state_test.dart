import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply.dart';

void main() {
  const url = 'url';

  group(ReplyState, () {
    ReplyState createSubject(SubmissionStatus submissionStatus) {
      return ReplyState(
        url: url,
        form: ReplyFormModel.empty,
        submissionStatus: submissionStatus,
      );
    }

    group('initial', () {
      test('returns $ReplyState', () {
        expect(
          ReplyState.initial(url: url),
          ReplyState(
            url: url,
            form: ReplyFormModel.empty,
          ),
        );
      });
    });

    group('isSubmissionLoading', () {
      test('returns false when submissionStatus '
          'is ${SubmissionStatus.initial}', () {
        final state = createSubject(SubmissionStatus.initial);
        expect(state.isSubmissionLoading, false);
      });

      test('returns true when submissionStatus '
          'is ${SubmissionStatus.loading}', () {
        final state = createSubject(SubmissionStatus.loading);
        expect(state.isSubmissionLoading, true);
      });

      test('returns true when submissionStatus '
          'is ${SubmissionStatus.success}', () {
        final state = createSubject(SubmissionStatus.success);
        expect(state.isSubmissionLoading, true);
      });

      test('returns false when submissionStatus '
          'is ${SubmissionStatus.failure}', () {
        final state = createSubject(SubmissionStatus.failure);
        expect(state.isSubmissionLoading, false);
      });
    });
  });
}
