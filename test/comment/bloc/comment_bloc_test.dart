// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockPostRepository extends Mock implements PostRepository {}

class _MockPostRepositoryState extends Mock implements PostRepositoryState {}

class _MockSavedCommentForm extends Mock implements SavedCommentModel {}

class _MockLinkLauncher extends Mock implements LinkLauncher {}

void main() {
  const fetchStatus = FetchStatus.loading;
  final post = PostPlaceholder();

  const text = 'text';

  final form = CommentFormModel(
    text: text,
    form: post.header.commentForm,
  );

  final initialState = CommentState(
    fetchStatus: fetchStatus,
    post: CommentPostModel(post),
    form: form,
  );

  group(CommentBloc, () {
    late PostRepository repository;
    late PostRepositoryState repositoryState;
    late SavedCommentModel savedCommentModel;
    late LinkLauncher linkLauncher;

    setUp(() {
      repository = _MockPostRepository();
      repositoryState = _MockPostRepositoryState();
      savedCommentModel = _MockSavedCommentForm();
      linkLauncher = _MockLinkLauncher();
      when(() => repository.state).thenReturn(repositoryState);
      when(() => repositoryState.fetchStatus).thenReturn(fetchStatus);
      when(() => repositoryState.post).thenReturn(post);
      when(savedCommentModel.load).thenReturn(text);
    });

    CommentBloc buildBloc() {
      return CommentBloc(
        postRepository: repository,
        savedCommentModel: savedCommentModel,
        linkLauncher: linkLauncher,
      );
    }

    test('initial state is $CommentState', () {
      expect(buildBloc().state, initialState);
    });

    group(CommentPostSubscriptionRequested, () {
      final updatedRepositoryState = _MockPostRepositoryState();
      const updatedFetchStatus = FetchStatus.success;

      final updatedRepositoryForm = CommentFormPlaceholder();

      final updatedPost = PostPlaceholder(
        header: PostHeaderPlaceholder(
          title: 'updatedTitle',
          commentForm: updatedRepositoryForm,
        ),
      );

      final updatedForm = initialState.form.copyWith(
        form: updatedRepositoryForm,
      );

      blocTest<CommentBloc, CommentState>(
        'emits updated state when stream emits new value',
        setUp: () {
          when(() => repository.stream).thenAnswer(
            (_) => Stream.value(updatedRepositoryState),
          );
          when(
            () => updatedRepositoryState.fetchStatus,
          ).thenReturn(updatedFetchStatus);
          when(
            () => updatedRepositoryState.post,
          ).thenReturn(updatedPost);
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentPostSubscriptionRequested(),
          );
        },
        expect: () => [
          initialState.copyWith(
            fetchStatus: updatedFetchStatus,
            post: CommentPostModel(updatedPost),
            form: updatedForm,
          ),
        ],
      );
    });

    group(CommentPostLoaded, () {
      const savedComment = 'savedComment';
      final load = () => savedCommentModel.load();

      blocTest<CommentBloc, CommentState>(
        'emits form with saved comment',
        setUp: () {
          when(load).thenReturn(savedComment);
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentPostLoaded(),
          );
        },
        expect: () => [
          initialState.copyWith(
            form: initialState.form.copyWith(
              text: savedComment,
            ),
          ),
        ],
        verify: (_) {
          verify(load).called(2);
        },
      );
    });

    group(CommentTextChanged, () {
      const text = 'updatedText';
      final updatedForm = form.copyWith(text: text);
      final save = () => savedCommentModel.save(text: text);

      blocTest<CommentBloc, CommentState>(
        'emits updated form and saves comment',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentTextChanged(text),
          );
        },
        expect: () => [
          initialState.copyWith(
            form: updatedForm,
          ),
        ],
        verify: (_) {
          verify(save).called(1);
        },
      );
    });

    group(CommentLinkPressed, () {
      const url = 'url';
      final launch = () => linkLauncher.launch(url);

      blocTest<CommentBloc, CommentState>(
        'calls launch',
        setUp: () {
          when(launch).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentLinkPressed(url),
          );
        },
        verify: (_) {
          verify(launch).called(1);
        },
      );
    });

    group(CommentSubmitted, () {
      final form = CommentFormModel(
        form: CommentFormPlaceholder(),
        text: 'text',
      );

      final state = initialState.copyWith(form: form);

      final request = () => repository.comment(
        form.toRepository(),
      );

      blocTest<CommentBloc, CommentState>(
        'emits [loading, success] when request succeeds',
        setUp: () {
          when(request).thenAnswer((_) async {});
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentSubmitted(),
          );
        },
        expect: () => [
          state.copyWith(
            form: state.form.copyWith(
              submissionStatus: SubmissionStatus.loading,
            ),
          ),
          state.copyWith(
            form: state.form.copyWith(
              submissionStatus: SubmissionStatus.success,
            ),
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );

      blocTest<CommentBloc, CommentState>(
        'emits [loading, failure] when request throws',
        setUp: () {
          when(request).thenThrow(Exception('oops'));
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentSubmitted(),
          );
        },
        expect: () => [
          state.copyWith(
            form: state.form.copyWith(
              submissionStatus: SubmissionStatus.loading,
            ),
          ),
          state.copyWith(
            form: state.form.copyWith(
              submissionStatus: SubmissionStatus.failure,
            ),
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );
    });
  });
}
