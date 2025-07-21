// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply_form.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockPostRepository extends Mock implements PostRepository {}

class _MockLinkLauncher extends Mock implements LinkLauncher {}

void main() {
  const commentId = 'commentId';
  final post = PostPlaceholder();

  final initialState = ReplyFormState.initial(
    commentId: commentId,
    post: post,
  );

  group(ReplyFormBloc, () {
    late PostRepository repository;
    late LinkLauncher linkLauncher;

    setUp(() {
      repository = _MockPostRepository();
      linkLauncher = _MockLinkLauncher();
      when(() => repository.state).thenReturn(post);
    });

    ReplyFormBloc buildBloc() {
      return ReplyFormBloc(
        commentId: commentId,
        postRepository: repository,
        linkLauncher: linkLauncher,
      );
    }

    test('initial state is $ReplyFormState', () {
      expect(buildBloc().state, initialState);
    });

    group(ReplyFormStarted, () {
      final request = () => repository.fetchReplyForm(
        post: initialState.post,
        commentId: initialState.commentId,
      );

      final replyForm = ReplyFormPlaceholder();

      blocTest<ReplyFormBloc, ReplyFormState>(
        'emits [success] and $ReplyFormModel '
        'when request succeeds',
        setUp: () {
          when(request).thenAnswer((_) async => replyForm);
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ReplyFormStarted(),
          );
        },
        expect: () => [
          initialState.copyWith(
            replyForm: ReplyFormModel(replyForm),
            fetchStatus: FetchStatus.success,
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );

      blocTest<ReplyFormBloc, ReplyFormState>(
        'emits [failure] when request throws',
        setUp: () {
          when(request).thenThrow(Exception('oops'));
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ReplyFormStarted(),
          );
        },
        expect: () => [
          initialState.copyWith(
            fetchStatus: FetchStatus.failure,
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );
    });

    group(ReplyFormTextChanged, () {
      const text = 'text';

      blocTest<ReplyFormBloc, ReplyFormState>(
        'emits text',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ReplyFormTextChanged(text),
          );
        },
        expect: () => [
          initialState.copyWith(text: text),
        ],
      );
    });

    group(ReplyFormLinkPressed, () {
      const url = 'url';
      final launch = () => linkLauncher.launch(url);

      blocTest<ReplyFormBloc, ReplyFormState>(
        'calls launch',
        setUp: () {
          when(launch).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ReplyFormLinkPressed(url),
          );
        },
        verify: (_) {
          verify(launch).called(1);
        },
      );
    });

    group(ReplyFormSubmitted, () {
      final request = () => repository.reply(
        post: initialState.post,
        replyForm: initialState.replyForm.toRepository(),
        text: initialState.text,
      );

      blocTest<ReplyFormBloc, ReplyFormState>(
        'emits [loading, success] when request succeds',
        setUp: () {
          when(request).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ReplyFormSubmitted(),
          );
        },
        expect: () => [
          initialState.copyWith(
            submissionStatus: SubmissionStatus.loading,
          ),
          initialState.copyWith(
            submissionStatus: SubmissionStatus.success,
          ),
        ],
      );

      blocTest<ReplyFormBloc, ReplyFormState>(
        'emits [loading, failure] when request throws',
        setUp: () {
          when(request).thenThrow(Exception('oops'));
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ReplyFormSubmitted(),
          );
        },
        expect: () => [
          initialState.copyWith(
            submissionStatus: SubmissionStatus.loading,
          ),
          initialState.copyWith(
            submissionStatus: SubmissionStatus.failure,
          ),
        ],
      );
    });
  });
}
