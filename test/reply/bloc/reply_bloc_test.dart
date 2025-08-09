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

class _MockDebouncedDraftSaver extends Mock implements ReplyDraftSaver {}

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
    late ReplyDraftSaver draftSaver;
    late ReplyParentVoteModel voteModel;
    late LinkLauncher linkLauncher;
    late Future<void> Function() flush;

    setUp(() {
      replyRepository = _MockReplyRepository();
      voteRepository = _MockVoteRepository();
      draftSaver = _MockDebouncedDraftSaver();
      voteModel = _MockReplyParentVoteModel();
      linkLauncher = _MockLinkLauncher();
      flush = () => draftSaver.flush();
      when(flush).thenAnswer((_) async {});
    });

    ReplyBloc buildBloc() {
      return ReplyBloc(
        url: url,
        replyRepository: replyRepository,
        voteRepository: voteRepository,
        replyDraftSaver: draftSaver,
        voteModel: voteModel,
        linkLauncher: linkLauncher,
      );
    }

    test('initial state is $ReplyState', () {
      expect(buildBloc().state, initialState);
    });

    group('close', () {
      final dispose = () => draftSaver.dispose();

      blocTest(
        'calls flush and dispose',
        setUp: () {
          when(flush).thenAnswer((_) async {});
        },
        build: buildBloc,
        verify: (_) {
          verify(flush).called(1);
          verify(dispose).called(1);
        },
      );
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

      blocTest(
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

      blocTest(
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

      blocTest(
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

      final update = () => draftSaver.update(
        url: initialState.url,
        form: updatedForm.toRepository(),
        parent: initialState.parent.toRepository(),
      );

      final state = initialState.copyWith(form: form);

      blocTest(
        'emits updated form and calls draftSaver.update',
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
          verify(update).called(1);
        },
      );
    });

    group(ReplyParentExpansionToggled, () {
      blocTest(
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

      blocTest(
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

      blocTest(
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

    group(ReplyAppInactivated, () {
      blocTest(
        'calls flush',
        setUp: () {
          when(flush).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ReplyAppInactivated(),
          );
        },
        verify: (_) {
          verify(flush).called(2);
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

      blocTest(
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
          verify(flush).called(2);
          verify(request).called(1);
        },
      );

      blocTest(
        'emits [loading, failure] when request throws',
        setUp: () {
          when(flush).thenAnswer((_) async {});
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
          verify(flush).called(2);
          verify(request).called(1);
        },
      );
    });
  });
}
