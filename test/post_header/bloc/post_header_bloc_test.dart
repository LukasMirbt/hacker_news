// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/post_header/post_header.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';
import 'package:share_launcher/share_launcher.dart';
import 'package:vote_repository/vote_repository.dart';

class _MockPostRepository extends Mock implements PostRepository {}

class _MockVoteRepository extends Mock implements VoteRepository {}

class _MockPostHeaderVoteModel extends Mock implements PostHeaderVoteModel {}

class _MockLinkLauncher extends Mock implements LinkLauncher {}

class _MockShareLauncher extends Mock implements ShareLauncher {}

class _MockPostHeaderModel extends Mock implements PostHeaderModel {}

void main() {
  const id = 'id';
  final initialState = PostHeaderState.initial(id: id);

  group(PostHeaderBloc, () {
    late PostRepository postRepository;
    late VoteRepository voteRepository;
    late PostHeaderVoteModel voteModel;
    late LinkLauncher linkLauncher;
    late ShareLauncher shareLauncher;

    setUp(() {
      postRepository = _MockPostRepository();
      voteRepository = _MockVoteRepository();
      voteModel = _MockPostHeaderVoteModel();
      linkLauncher = _MockLinkLauncher();
      shareLauncher = _MockShareLauncher();
    });

    PostHeaderBloc buildBloc() {
      return PostHeaderBloc(
        id: id,
        postRepository: postRepository,
        voteRepository: voteRepository,
        voteModel: voteModel,
        linkLauncher: linkLauncher,
        shareLauncher: shareLauncher,
      );
    }

    test('initial state is $PostHeaderState', () {
      expect(buildBloc().state, initialState);
    });

    group(PostHeaderSubscriptionRequested, () {
      final updatedPost = PostPlaceholder(
        header: PostHeaderPlaceholder(),
      );

      blocTest<PostHeaderBloc, PostHeaderState>(
        'emits $PostHeaderModel when stream emits new value',
        setUp: () {
          when(() => postRepository.stream).thenAnswer(
            (_) => Stream.value(updatedPost),
          );
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            PostHeaderSubscriptionRequested(),
          );
        },
        expect: () => [
          initialState.copyWith(
            header: PostHeaderModel(updatedPost.header),
          ),
        ],
      );
    });

    group(PostHeaderVoteSubscriptionRequested, () {
      final repositoryState = VoteSuccess(
        vote: VotePlaceholder(),
      );

      final state = initialState.copyWith(
        header: _MockPostHeaderModel(),
      );

      final updatedPostHeader = _MockPostHeaderModel();

      final updatePostHeader = () => voteModel.updateHeader(
        vote: repositoryState.vote,
        header: state.header,
      );

      blocTest<PostHeaderBloc, PostHeaderState>(
        'emits updated header when repository emits $VoteSuccess',
        setUp: () {
          when(() => voteRepository.stream).thenAnswer(
            (_) => Stream.value(repositoryState),
          );
          when(updatePostHeader).thenReturn(updatedPostHeader);
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            PostHeaderVoteSubscriptionRequested(),
          );
        },
        expect: () => [
          state.copyWith(
            header: updatedPostHeader,
          ),
        ],
        verify: (_) {
          verify(updatePostHeader).called(1);
        },
      );
    });

    group(PostHeaderTitlePressed, () {
      final url = initialState.header.url;
      final launch = () => linkLauncher.launch(url);

      blocTest<PostHeaderBloc, PostHeaderState>(
        'calls launch',
        setUp: () {
          when(launch).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            PostHeaderTitlePressed(),
          );
        },
        verify: (_) {
          verify(launch).called(1);
        },
      );
    });

    group(PostHeaderVotePressed, () {
      final header = initialState.header;

      final vote = () => voteRepository.vote(
        upvoteUrl: header.upvoteUrl,
        hasBeenUpvoted: header.hasBeenUpvoted,
      );

      blocTest<PostHeaderBloc, PostHeaderState>(
        'calls vote',
        setUp: () {
          when(vote).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            PostHeaderVotePressed(),
          );
        },
        verify: (_) {
          verify(vote).called(1);
        },
      );
    });

    group(PostHeaderSharePressed, () {
      const text = 'text';
      final share = () => shareLauncher.share(text: text);

      blocTest<PostHeaderBloc, PostHeaderState>(
        'calls share',
        setUp: () {
          when(share).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            PostHeaderSharePressed(text: text),
          );
        },
        verify: (_) {
          verify(share).called(1);
        },
      );
    });

    group(PostHeaderTextLinkPressed, () {
      const url = 'url';
      final launch = () => linkLauncher.launch(url);

      blocTest<PostHeaderBloc, PostHeaderState>(
        'calls launch',
        setUp: () {
          when(launch).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            PostHeaderTextLinkPressed(url),
          );
        },
        verify: (_) {
          verify(launch).called(1);
        },
      );
    });
  });
}
