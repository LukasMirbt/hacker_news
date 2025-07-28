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

class _MockSavedReplyModel extends Mock implements SavedReplyModel {}

class _MockReplyParentVoteModel extends Mock implements ReplyParentVoteModel {}

class _MockLinkLauncher extends Mock implements LinkLauncher {}

class _MockReplyParentModel extends Mock implements ReplyParentModel {}

void main() {
  const url = 'url';
  final initialState = ReplyState.initial(url: url);

  group(ReplyBloc, () {
    late ReplyRepository replyRepository;
    late VoteRepository voteRepository;
    late SavedReplyModel savedReplyModel;
    late ReplyParentVoteModel voteModel;
    late LinkLauncher linkLauncher;

    setUp(() {
      replyRepository = _MockReplyRepository();
      voteRepository = _MockVoteRepository();
      savedReplyModel = _MockSavedReplyModel();
      voteModel = _MockReplyParentVoteModel();
      linkLauncher = _MockLinkLauncher();
    });

    ReplyBloc buildBloc() {
      return ReplyBloc(
        url: url,
        replyRepository: replyRepository,
        voteRepository: voteRepository,
        savedReplyModel: savedReplyModel,
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
        parent: _MockReplyParentModel(),
      );

      final updatedParent = _MockReplyParentModel();

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
      final parent = page.parent;
      final form = page.form;
      const savedReply = 'savedReply';

      final request = () => replyRepository.fetchReplyPage(url: url);
      final load = () => savedReplyModel.load(form);

      blocTest<ReplyBloc, ReplyState>(
        'loads saved reply and emits [success], $ReplyParentModel '
        'and $ReplyFormModel when request succeeds',
        setUp: () {
          when(request).thenAnswer((_) async => page);
          when(load).thenReturn(savedReply);
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ReplyStarted(),
          );
        },
        expect: () => [
          initialState.copyWith(
            parent: ReplyParentModel(
              parent: parent,
            ),
            form: ReplyFormModel(
              form: form,
              text: savedReply,
            ),
            fetchStatus: FetchStatus.success,
          ),
        ],
        verify: (_) {
          verify(request).called(1);
          verify(load).called(1);
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

      final save = () => savedReplyModel.save(
        updatedForm.toRepository(),
      );

      final state = initialState.copyWith(form: form);

      blocTest<ReplyBloc, ReplyState>(
        'emits updated form and saves reply',
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
          verify(save).called(1);
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
      final parent = initialState.parent;

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
            ReplyParentVotePressed(),
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
        'emits [loading, success] when request succeds',
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
