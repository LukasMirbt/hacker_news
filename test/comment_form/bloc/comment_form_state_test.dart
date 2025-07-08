import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_form/comment_form.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  group(CommentFormState, () {
    CommentFormState createSubject({
      CommentFormStatus? status,
    }) {
      return CommentFormState(
        post: PostPlaceholder(),
        status: status ?? CommentFormStatus.initial,
      );
    }

    group('isLoading', () {
      test('returns false when status is '
          '${CommentFormStatus.initial}', () {
        final state = createSubject(
          status: CommentFormStatus.initial,
        );
        expect(state.isLoading, false);
      });

      test('returns true when status is '
          '${CommentFormStatus.loading}', () {
        final state = createSubject(
          status: CommentFormStatus.loading,
        );
        expect(state.isLoading, true);
      });

      test('returns true when status is '
          '${CommentFormStatus.success}', () {
        final state = createSubject(
          status: CommentFormStatus.success,
        );
        expect(state.isLoading, true);
      });

      test('returns false when status is '
          '${CommentFormStatus.failure}', () {
        final state = createSubject(
          status: CommentFormStatus.failure,
        );
        expect(state.isLoading, false);
      });
    });
  });
}
