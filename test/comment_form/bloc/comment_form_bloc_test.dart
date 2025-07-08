// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_form/comment_form.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockLinkLauncher extends Mock implements LinkLauncher {}

class _MockPostRepository extends Mock implements PostRepository {}

void main() {
  final post = PostPlaceholder();
  final initialState = CommentFormState(post: post);

  group(CommentFormBloc, () {
    late LinkLauncher linkLauncher;
    late PostRepository repository;

    setUp(() {
      linkLauncher = _MockLinkLauncher();
      repository = _MockPostRepository();
      when(() => repository.state).thenReturn(post);
    });

    CommentFormBloc buildBloc() {
      return CommentFormBloc(
        linkLauncher: linkLauncher,
        postRepository: repository,
      );
    }

    test('initial state is $CommentFormState', () {
      expect(buildBloc().state, initialState);
    });

    group(CommentFormPostSubscriptionRequested, () {
      final updatedPost = PostPlaceholder(
        header: PostHeaderPlaceholder(
          title: 'updatedTitle',
        ),
      );

      blocTest<CommentFormBloc, CommentFormState>(
        'emits post when stream emits new value',
        setUp: () {
          when(() => repository.stream).thenAnswer(
            (_) => Stream.value(updatedPost),
          );
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentFormPostSubscriptionRequested(),
          );
        },
        expect: () => [
          initialState.copyWith(
            post: updatedPost,
          ),
        ],
      );
    });

    group(CommentFormTextChanged, () {
      const text = 'text';

      blocTest<CommentFormBloc, CommentFormState>(
        'emits text',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentFormTextChanged(text),
          );
        },
        expect: () => [
          initialState.copyWith(
            text: text,
          ),
        ],
      );
    });

    group(CommentFormSubmitted, () {
      const text = 'text';
      final state = initialState.copyWith(text: text);

      final request = () => repository.comment(
        post: initialState.post,
        text: text,
      );

      blocTest<CommentFormBloc, CommentFormState>(
        'emits [loading, success] when request succeeds',
        setUp: () {
          when(request).thenAnswer((_) async {});
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentFormSubmitted(),
          );
        },
        expect: () => [
          state.copyWith(
            status: CommentFormStatus.loading,
          ),
          state.copyWith(
            status: CommentFormStatus.success,
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );

      blocTest<CommentFormBloc, CommentFormState>(
        'emits [loading, failure] when request throws',
        setUp: () {
          when(request).thenThrow(Exception('oops'));
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentFormSubmitted(),
          );
        },
        expect: () => [
          state.copyWith(
            status: CommentFormStatus.loading,
          ),
          state.copyWith(
            status: CommentFormStatus.failure,
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );
    });

    group(CommentFormLinkPressed, () {
      const url = 'url';
      final launch = () => linkLauncher.launch(url);

      blocTest<CommentFormBloc, CommentFormState>(
        'calls launch',
        setUp: () {
          when(launch).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentFormLinkPressed(url),
          );
        },
        verify: (_) {
          verify(launch).called(1);
        },
      );
    });
  });
}
