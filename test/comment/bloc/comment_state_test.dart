// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockPostRepository extends Mock implements PostRepository {}

class _MockPostRepositoryState extends Mock implements PostRepositoryState {}

class _MockSavedCommentModel extends Mock implements SavedCommentModel {}

class _MockCommentFormModel extends Mock implements CommentFormModel {}

void main() {
  final post = PostPlaceholder();

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
        post: CommentPostModel(post),
        form: form,
        fetchStatus: fetchStatus,
      );
    }

    group('from', () {
      late PostRepository postRepository;
      late PostRepositoryState state;
      late SavedCommentModel savedCommentModel;

      setUp(() {
        postRepository = _MockPostRepository();
        state = _MockPostRepositoryState();
        savedCommentModel = _MockSavedCommentModel();
        when(() => postRepository.state).thenReturn(state);
      });

      const savedComment = 'savedComment';
      const fetchStatus = FetchStatus.loading;
      final post = PostPlaceholder();

      final load = () => savedCommentModel.load();

      test('returns $CommentState', () {
        when(() => state.post).thenReturn(post);
        when(() => state.fetchStatus).thenReturn(fetchStatus);
        when(load).thenReturn(savedComment);
        expect(
          CommentState.from(
            postRepository: postRepository,
            savedCommentModel: savedCommentModel,
          ),
          CommentState(
            fetchStatus: state.fetchStatus,
            post: CommentPostModel(post),
            form: CommentFormModel(
              text: savedComment,
              form: post.header.commentForm,
            ),
          ),
        );
        verify(load).called(1);
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
