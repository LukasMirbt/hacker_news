import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply_form.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  const commentId = 'commentId';
  final post = PostPlaceholder();

  group(ReplyFormState, () {
    ReplyFormState createSubject(SubmissionStatus submissionStatus) {
      return ReplyFormState(
        commentId: commentId,
        post: post,
        replyForm: ReplyFormModel.empty,
        submissionStatus: submissionStatus,
      );
    }

    group('initial', () {
      test('returns $ReplyFormState', () {
        expect(
          ReplyFormState.initial(
            commentId: commentId,
            post: post,
          ),
          ReplyFormState(
            commentId: commentId,
            post: post,
            replyForm: ReplyFormModel.empty,
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
