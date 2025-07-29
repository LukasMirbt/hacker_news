// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class _MockPostRepository extends Mock implements PostRepository {}

class _MockPostRepositoryState extends Mock implements PostRepositoryState {}

class _MockVoteRepository extends Mock implements VoteRepository {}

class _MockReplyRepository extends Mock implements ReplyRepository {}

class _MockCommentListVoteModel extends Mock implements CommentListVoteModel {}

class _MockCommentListReplyModel extends Mock
    implements CommentListReplyModel {}

class _MockLinkLauncher extends Mock implements LinkLauncher {}

class _MockCommentListModel extends Mock implements CommentListModel {}

void main() {
  const id = 'id';
  final initialState = CommentListState.initial(id: id);

  final comment = OtherUserCommentModel(
    comment: OtherUserCommentPlaceholder(),
  );

  group(CommentListBloc, () {
    late PostRepository postRepository;
    late VoteRepository voteRepository;
    late ReplyRepository replyRepository;
    late CommentListVoteModel voteModel;
    late CommentListReplyModel replyModel;
    late LinkLauncher linkLauncher;

    setUp(() {
      postRepository = _MockPostRepository();
      voteRepository = _MockVoteRepository();
      replyRepository = _MockReplyRepository();
      voteModel = _MockCommentListVoteModel();
      replyModel = _MockCommentListReplyModel();
      linkLauncher = _MockLinkLauncher();
    });

    CommentListBloc buildBloc() {
      return CommentListBloc(
        id: id,
        postRepository: postRepository,
        voteRepository: voteRepository,
        replyRepository: replyRepository,
        voteModel: voteModel,
        replyModel: replyModel,
        linkLauncher: linkLauncher,
      );
    }

    test('initial state is $CommentListState', () {
      expect(buildBloc().state, initialState);
    });

    group(CommentListSubscriptionRequested, () {
      final commentList = _MockCommentListModel();
      final state = initialState.copyWith(commentList: commentList);

      final updatedRepositoryState = _MockPostRepositoryState();

      final updatedPost = PostPlaceholder(
        comments: [
          OtherUserCommentPlaceholder(),
        ],
      );

      final updatedCommentList = _MockCommentListModel();

      final rebuildWith = () => commentList.rebuildWith(updatedPost.comments);

      blocTest<CommentListBloc, CommentListState>(
        'emits $CommentListModel when stream emits new value',
        setUp: () {
          when(() => postRepository.stream).thenAnswer(
            (_) => Stream.value(updatedRepositoryState),
          );
          when(rebuildWith).thenReturn(updatedCommentList);
          when(() => updatedRepositoryState.post).thenReturn(updatedPost);
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentListSubscriptionRequested(),
          );
        },
        expect: () => [
          state.copyWith(
            commentList: updatedCommentList,
          ),
        ],
        verify: (_) {
          verify(rebuildWith).called(1);
        },
      );
    });

    group(CommentListVoteSubscriptionRequested, () {
      final repositoryState = VoteSuccess(
        vote: VotePlaceholder(),
      );

      final state = initialState.copyWith(
        commentList: _MockCommentListModel(),
      );

      final updatedCommentList = _MockCommentListModel();

      final updateCommentList = () => voteModel.updateCommentList(
        vote: repositoryState.vote,
        commentList: state.commentList,
      );

      blocTest<CommentListBloc, CommentListState>(
        'emits updated commentList when repository emits $VoteSuccess',
        setUp: () {
          when(() => voteRepository.stream).thenAnswer(
            (_) => Stream.value(repositoryState),
          );
          when(updateCommentList).thenReturn(updatedCommentList);
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentListVoteSubscriptionRequested(),
          );
        },
        expect: () => [
          state.copyWith(
            commentList: updatedCommentList,
          ),
        ],
        verify: (_) {
          verify(updateCommentList).called(1);
        },
      );
    });

    group(CommentListReplySubscriptionRequested, () {
      final update = ReplyUpdate(
        form: ReplyFormPlaceholder(),
        comment: CurrentUserCommentDataPlaceholder(),
      );

      final state = initialState.copyWith(
        commentList: _MockCommentListModel(),
      );

      final updatedCommentList = _MockCommentListModel();

      final updateCommentList = () => replyModel.updateCommentList(
        update: update,
        commentList: state.commentList,
      );

      blocTest<CommentListBloc, CommentListState>(
        'emits updated commentList when repository emits $ReplyUpdate',
        setUp: () {
          when(() => replyRepository.stream).thenAnswer(
            (_) => Stream.value(update),
          );
          when(updateCommentList).thenReturn(updatedCommentList);
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentListReplySubscriptionRequested(),
          );
        },
        expect: () => [
          state.copyWith(
            commentList: updatedCommentList,
          ),
        ],
        verify: (_) {
          verify(updateCommentList).called(1);
        },
      );
    });

    group(CommentListExpansionToggled, () {
      final commentList = _MockCommentListModel();
      final updatedCommentList = _MockCommentListModel();

      final state = initialState.copyWith(commentList: commentList);

      final toggleExpansion = () =>
          commentList.toggleExpansion(comment: comment);

      blocTest<CommentListBloc, CommentListState>(
        'emits updated commentList',
        setUp: () {
          when(toggleExpansion).thenReturn(updatedCommentList);
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentListExpansionToggled(comment),
          );
        },
        expect: () => [
          state.copyWith(
            commentList: updatedCommentList,
          ),
        ],
        verify: (_) {
          verify(toggleExpansion).called(1);
        },
      );
    });

    group(CommentListLinkPressed, () {
      const url = 'url';
      final launch = () => linkLauncher.launch(url);

      blocTest<CommentListBloc, CommentListState>(
        'calls launch',
        setUp: () {
          when(launch).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentListLinkPressed(url),
          );
        },
        verify: (_) {
          verify(launch).called(1);
        },
      );
    });

    group(CommentListVotePressed, () {
      final vote = () => voteRepository.vote(
        upvoteUrl: comment.upvoteUrl,
        hasBeenUpvoted: comment.hasBeenUpvoted,
      );

      blocTest<CommentListBloc, CommentListState>(
        'calls vote',
        setUp: () {
          when(vote).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            CommentListVotePressed(comment),
          );
        },
        verify: (_) {
          verify(vote).called(1);
        },
      );
    });
  });
}
