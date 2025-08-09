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

class _MockCommentDraftSaver extends Mock implements CommentDraftSaver {}

class _MockLinkLauncher extends Mock implements LinkLauncher {}

class _MockCommentFormModel extends Mock implements CommentFormModel {}

void main() {
  const fetchStatus = FetchStatus.loading;
  final post = PostPlaceholder();
  final header = post.header;
  final form = header.commentForm;

  final initialState = CommentState(
    fetchStatus: fetchStatus,
    header: CommentPostHeaderModel(header),
    form: CommentFormModel(form: form),
  );

  group(CommentBloc, () {
    late PostRepository repository;
    late PostRepositoryState repositoryState;
    late CommentDraftSaver draftSaver;
    late LinkLauncher linkLauncher;
    late Future<void> Function() flush;

    setUp(() {
      repository = _MockPostRepository();
      repositoryState = _MockPostRepositoryState();
      draftSaver = _MockCommentDraftSaver();
      linkLauncher = _MockLinkLauncher();
      flush = () => draftSaver.flush();
      when(() => repository.state).thenReturn(repositoryState);
      when(() => repositoryState.fetchStatus).thenReturn(fetchStatus);
      when(() => repositoryState.post).thenReturn(post);
      when(flush).thenAnswer((_) async {});
    });

    CommentBloc buildBloc() {
      return CommentBloc(
        postRepository: repository,
        commentDraftSaver: draftSaver,
        linkLauncher: linkLauncher,
      );
    }

    test('initial state is $CommentState', () {
      expect(buildBloc().state, initialState);
    });

    group(CommentPostSubscriptionRequested, () {
      final updatedRepositoryState = _MockPostRepositoryState();
      const updatedFetchStatus = FetchStatus.success;
      final updatedPost = PostPlaceholder();
      final updatedHeader = updatedPost.header;

      final form = _MockCommentFormModel();
      final updatedForm = _MockCommentFormModel();
      final state = initialState.copyWith(form: form);

      final updateWith = () => form.updateWith(updatedHeader.commentForm);

      blocTest(
        'emits correct state when stream emits new value '
        'and form.text is non-null',
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
          when(updateWith).thenReturn(updatedForm);
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentPostSubscriptionRequested(),
          );
        },
        expect: () => [
          state.copyWith(
            fetchStatus: updatedFetchStatus,
            header: CommentPostHeaderModel(updatedHeader),
            form: updatedForm,
          ),
        ],
        verify: (_) {
          verify(updateWith).called(1);
        },
      );
    });

    group(CommentStarted, () {
      const savedComment = 'savedComment';
      final form = _MockCommentFormModel();
      final updatedForm = _MockCommentFormModel();

      final state = initialState.copyWith(
        fetchStatus: FetchStatus.success,
        form: form,
      );

      final readComment = () => repository.readComment(
        postId: header.id,
      );

      final copyWith = () => form.copyWith(
        text: savedComment,
      );

      blocTest(
        'returns when fetchStatus.isLoading',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentStarted(),
          );
        },
        expect: () => <CommentState>[],
      );

      blocTest(
        'returns when !isCommentingEnabled',
        setUp: () {
          when(() => form.isCommentingEnabled).thenReturn(false);
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentStarted(),
          );
        },
        expect: () => <CommentState>[],
      );

      blocTest(
        'emits form with saved comment when !fetchStatus.isLoading '
        'and form is non-null',
        setUp: () {
          when(() => form.isCommentingEnabled).thenReturn(true);
          when(readComment).thenAnswer((_) async => savedComment);
          when(copyWith).thenReturn(updatedForm);
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentStarted(),
          );
        },
        expect: () => [
          state.copyWith(
            form: updatedForm,
          ),
        ],
        verify: (_) {
          verify(readComment).called(1);
          verify(copyWith).called(1);
        },
      );
    });

    group(CommentTextChanged, () {
      const text = 'updatedText';
      final updatedForm = initialState.form.copyWith(text: text);

      final update = () => draftSaver.update(
        header: initialState.header.toRepository(),
        text: text,
      );

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
          verify(update).called(1);
        },
      );
    });

    group(CommentLinkPressed, () {
      const url = 'url';
      final launch = () => linkLauncher.launch(url);

      blocTest(
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

      blocTest(
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
          verify(flush).called(2);
          verify(request).called(1);
        },
      );

      blocTest(
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
          verify(flush).called(2);
          verify(request).called(1);
        },
      );
    });
  });
}
