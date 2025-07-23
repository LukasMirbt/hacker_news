// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockLinkLauncher extends Mock implements LinkLauncher {}

class _MockPostRepository extends Mock implements PostRepository {}

void main() {
  final post = PostPlaceholder();
  final initialState = CommentState.initial(post: post);

  group(CommentBloc, () {
    late LinkLauncher linkLauncher;
    late PostRepository repository;

    setUp(() {
      linkLauncher = _MockLinkLauncher();
      repository = _MockPostRepository();
      when(() => repository.state).thenReturn(post);
    });

    CommentBloc buildBloc() {
      return CommentBloc(
        linkLauncher: linkLauncher,
        postRepository: repository,
      );
    }

    test('initial state is $CommentState', () {
      expect(buildBloc().state, initialState);
    });

    group(CommentPostSubscriptionRequested, () {
      final updatedPost = PostPlaceholder(
        header: PostHeaderPlaceholder(
          title: 'updatedTitle',
        ),
      );

      blocTest<CommentBloc, CommentState>(
        'emits post when stream emits new value',
        setUp: () {
          when(() => repository.stream).thenAnswer(
            (_) => Stream.value(updatedPost),
          );
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentPostSubscriptionRequested(),
          );
        },
        expect: () => [
          initialState.copyWith(
            post: updatedPost,
          ),
        ],
      );
    });

    group(CommentTextChanged, () {
      const text = 'text';

      blocTest<CommentBloc, CommentState>(
        'emits text',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentTextChanged(text),
          );
        },
        expect: () => [
          initialState.copyWith(
            form: initialState.form.copyWith(
              text: text,
            ),
          ),
        ],
      );
    });

    group(CommentSubmitted, () {
      final request = () => repository.comment(initialState.form);

      blocTest<CommentBloc, CommentState>(
        'emits [loading, success] when request succeeds',
        setUp: () {
          when(request).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentSubmitted(),
          );
        },
        expect: () => [
          initialState.copyWith(
            status: CommentStatus.loading,
          ),
          initialState.copyWith(
            status: CommentStatus.success,
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
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentSubmitted(),
          );
        },
        expect: () => [
          initialState.copyWith(
            status: CommentStatus.loading,
          ),
          initialState.copyWith(
            status: CommentStatus.failure,
          ),
        ],
        verify: (_) {
          verify(request).called(1);
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
  });
}
