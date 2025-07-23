import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  final post = PostPlaceholder();

  group(CommentState, () {
    CommentState createSubject({
      CommentStatus? status,
    }) {
      return CommentState(
        post: post,
        form: CommentForm.empty,
        status: status ?? CommentStatus.initial,
      );
    }

    group('initial', () {
      test('returns $CommentState', () {
        expect(
          CommentState.initial(post: post),
          isA<CommentState>(),
        );
      });
    });

    group('isLoading', () {
      test('returns false when status is '
          '${CommentStatus.initial}', () {
        final state = createSubject(
          status: CommentStatus.initial,
        );
        expect(state.isLoading, false);
      });

      test('returns true when status is '
          '${CommentStatus.loading}', () {
        final state = createSubject(
          status: CommentStatus.loading,
        );
        expect(state.isLoading, true);
      });

      test('returns true when status is '
          '${CommentStatus.success}', () {
        final state = createSubject(
          status: CommentStatus.success,
        );
        expect(state.isLoading, true);
      });

      test('returns false when status is '
          '${CommentStatus.failure}', () {
        final state = createSubject(
          status: CommentStatus.failure,
        );
        expect(state.isLoading, false);
      });
    });
  });
}
