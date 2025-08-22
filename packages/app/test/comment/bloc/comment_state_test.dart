// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/comment/comment.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockPostRepository extends Mock implements PostRepository {}

class _MockPostRepositoryState extends Mock implements PostRepositoryState {}

class _MockCommentFormModel extends Mock implements CommentFormModel {}

void main() {
  group(CommentState, () {
    late CommentFormModel form;

    setUp(() {
      form = _MockCommentFormModel();
      when(() => form.isCommentingEnabled).thenReturn(false);
    });

    CommentState createSubject({
      required FetchStatus fetchStatus,
    }) {
      return CommentState(
        fetchStatus: fetchStatus,
        form: form,
        header: CommentPostHeaderModel(
          PostHeaderPlaceholder(),
        ),
      );
    }

    group('from', () {
      late PostRepository postRepository;
      late PostRepositoryState state;

      setUp(() {
        postRepository = _MockPostRepository();
        state = _MockPostRepositoryState();
        when(() => postRepository.state).thenReturn(state);
      });

      const fetchStatus = FetchStatus.loading;
      final post = PostPlaceholder();
      final header = post.header;
      final form = header.commentForm;

      test('returns $CommentState', () {
        when(() => state.post).thenReturn(post);
        when(() => state.fetchStatus).thenReturn(fetchStatus);
        expect(
          CommentState.from(postRepository),
          CommentState(
            fetchStatus: state.fetchStatus,
            header: CommentPostHeaderModel(header),
            form: CommentFormModel(form: form),
          ),
        );
      });
    });

    group('isSubmittingEnabled', () {
      test('returns false when !fetchStatus.isSuccess', () {
        final state = createSubject(
          fetchStatus: FetchStatus.loading,
        );
        expect(state.isSubmittingEnabled, false);
      });

      test('returns false when fetchStatus.isSuccess '
          'and !form.isCommentingEnabled', () {
        final state = createSubject(
          fetchStatus: FetchStatus.success,
        );
        expect(state.isSubmittingEnabled, false);
      });

      test('returns true when fetchStatus.isSuccess '
          'and form.isCommentingEnabled', () {
        when(() => form.isCommentingEnabled).thenReturn(true);
        final state = createSubject(
          fetchStatus: FetchStatus.success,
        );
        expect(state.isSubmittingEnabled, true);
      });
    });
  });
}
