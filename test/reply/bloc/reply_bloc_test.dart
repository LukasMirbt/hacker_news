// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';

class _MockReplyRepository extends Mock implements ReplyRepository {}

class _MockSavedReplyModel extends Mock implements SavedReplyModel {}

class _MockLinkLauncher extends Mock implements LinkLauncher {}

void main() {
  const url = 'url';
  final initialState = ReplyState.initial(url: url);

  group(ReplyBloc, () {
    late ReplyRepository repository;
    late SavedReplyModel savedReplyModel;
    late LinkLauncher linkLauncher;

    setUp(() {
      repository = _MockReplyRepository();
      savedReplyModel = _MockSavedReplyModel();
      linkLauncher = _MockLinkLauncher();
    });

    ReplyBloc buildBloc() {
      return ReplyBloc(
        url: url,
        savedReplyModel: savedReplyModel,
        replyRepository: repository,
        linkLauncher: linkLauncher,
      );
    }

    test('initial state is $ReplyState', () {
      expect(buildBloc().state, initialState);
    });

    group(ReplyStarted, () {
      final page = ReplyPagePlaceholder();
      final parent = page.parent;
      final form = page.form;
      const savedReply = 'savedReply';

      final request = () => repository.fetchReplyPage(url: url);
      final load = () => savedReplyModel.load(form);

      blocTest<ReplyBloc, ReplyState>(
        'loads saved reply and emits [success], $ReplyParentModel '
        'and $ReplyFormModel when request succeeds',
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

    /*   group(ReplyLinkPressed, () {
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
      final request = () => repository.reply(initialState.form);

      blocTest<ReplyBloc, ReplyState>(
        'emits [loading, success] when request succeds',
        setUp: () {
          when(request).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ReplySubmitted(),
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

      blocTest<ReplyBloc, ReplyState>(
        'emits [loading, failure] when request throws',
        setUp: () {
          when(request).thenThrow(Exception('oops'));
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ReplySubmitted(),
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
    */
  });
}
