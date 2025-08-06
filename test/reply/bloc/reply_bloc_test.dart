// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class _MockReplyRepository extends Mock implements ReplyRepository {}

class _MockVoteRepository extends Mock implements VoteRepository {}

class _MockReplyParentVoteModel extends Mock implements ReplyParentVoteModel {}

class _MockLinkLauncher extends Mock implements LinkLauncher {}

class _MockOtherUserReplyParentModel extends Mock
    implements OtherUserReplyParentModel {}

void main() {
  const url = 'url';
  final initialState = ReplyState.initial(url: url);

  group(ReplyBloc, () {
    late ReplyRepository replyRepository;
    late VoteRepository voteRepository;
    late ReplyParentVoteModel voteModel;
    late LinkLauncher linkLauncher;

    setUp(() {
      replyRepository = _MockReplyRepository();
      voteRepository = _MockVoteRepository();
      voteModel = _MockReplyParentVoteModel();
      linkLauncher = _MockLinkLauncher();
    });

    ReplyBloc buildBloc() {
      return ReplyBloc(
        url: url,
        replyRepository: replyRepository,
        voteRepository: voteRepository,
        voteModel: voteModel,
        linkLauncher: linkLauncher,
      );
    }

    test('initial state is $ReplyState', () {
      expect(buildBloc().state, initialState);
    });

    group(ReplyVoteSubscriptionRequested, () {
      final repositoryState = VoteSuccess(
        vote: VotePlaceholder(),
      );

      final state = initialState.copyWith(
        parent: _MockOtherUserReplyParentModel(),
      );

      final updatedParent = _MockOtherUserReplyParentModel();

      final updateParent = () => voteModel.updateParent(
        vote: repositoryState.vote,
        parent: state.parent,
      );

      blocTest<ReplyBloc, ReplyState>(
        'emits updated parent when repository emits $VoteSuccess',
        setUp: () {
          when(() => voteRepository.stream).thenAnswer(
            (_) => Stream.value(repositoryState),
          );
          when(updateParent).thenReturn(updatedParent);
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ReplyVoteSubscriptionRequested(),
          );
        },
        expect: () => [
          state.copyWith(
            parent: updatedParent,
          ),
        ],
        verify: (_) {
          verify(updateParent).called(1);
        },
      );
    });

    group(ReplyStarted, () {
      final page = ReplyPagePlaceholder();
      final request = () => replyRepository.fetchReplyPage(url: url);

      blocTest<ReplyBloc, ReplyState>(
        'emits [success], $ReplyParentModel and $ReplyFormModel '
        'when request succeeds',
        setUp: () {
          when(request).thenAnswer((_) async => page);
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ReplyStarted(),
          );
        },
        expect: () => [
          initialState.copyWith(
            parent: ReplyParentModel.from(page.parent),
            form: ReplyFormModel.from(page.form),
            fetchStatus: FetchStatus.success,
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );

      blocTest<ReplyBloc, ReplyState>(
        'emits [failure] when request throws',
        setUp: () {
          when(request).thenThrow(Exception('oops'));
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ReplyStarted(),
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

    group(ReplyTextChanged, () {
      const text = 'text';

      final form = initialState.form.copyWith(
        form: ReplyFormPlaceholder(),
      );

      final updatedForm = form.copyWith(text: text);

      final updateReply = () => replyRepository.updateReply(
        updatedForm.toRepository(),
      );

      final state = initialState.copyWith(form: form);

      blocTest<ReplyBloc, ReplyState>(
        'emits updated form and calls updateReply',
        setUp: () {
          when(updateReply).thenAnswer((_) async {});
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ReplyTextChanged(text),
          );
        },
        expect: () => [
          state.copyWith(
            form: updatedForm,
          ),
        ],
        verify: (_) {
          verify(updateReply).called(1);
        },
      );
    });

    group(ReplyParentExpansionToggled, () {
      blocTest<ReplyBloc, ReplyState>(
        'emits toggled isExpanded',
        build: buildBloc,
        act: (bloc) {
          bloc
            ..add(
              ReplyParentExpansionToggled(),
            )
            ..add(
              ReplyParentExpansionToggled(),
            );
        },
        expect: () => [
          initialState.copyWith(
            parent: initialState.parent.copyWith(
              isExpanded: !initialState.parent.isExpanded,
            ),
          ),
          initialState.copyWith(
            parent: initialState.parent.copyWith(
              isExpanded: initialState.parent.isExpanded,
            ),
          ),
        ],
      );
    });

    group(ReplyParentVotePressed, () {
      final parent = OtherUserReplyParentModel(
        parent: OtherUserReplyParentPlaceholder(),
      );

      final vote = () => voteRepository.vote(
        upvoteUrl: parent.upvoteUrl,
        hasBeenUpvoted: parent.hasBeenUpvoted,
      );

      blocTest<ReplyBloc, ReplyState>(
        'calls vote',
        setUp: () {
          when(vote).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ReplyParentVotePressed(parent),
          );
        },
        verify: (_) {
          verify(vote).called(1);
        },
      );
    });

    group(ReplyLinkPressed, () {
      const url = 'url';
      final launch = () => linkLauncher.launch(url);

      blocTest<ReplyBloc, ReplyState>(
        'calls launch',
        setUp: () {
          when(launch).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ReplyLinkPressed(url),
          );
        },
        verify: (_) {
          verify(launch).called(1);
        },
      );
    });

    group(ReplySubmitted, () {
      final form = ReplyFormModel(
        form: ReplyFormPlaceholder(),
        text: 'text',
      );

      final state = initialState.copyWith(form: form);

      final request = () => replyRepository.reply(
        form.toRepository(),
      );

      blocTest<ReplyBloc, ReplyState>(
        'emits [loading, success] when request succeeds',
        setUp: () {
          when(request).thenAnswer((_) async {});
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ReplySubmitted(),
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

      blocTest<ReplyBloc, ReplyState>(
        'emits [loading, failure] when request throws',
        setUp: () {
          when(request).thenThrow(Exception('oops'));
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ReplySubmitted(),
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
