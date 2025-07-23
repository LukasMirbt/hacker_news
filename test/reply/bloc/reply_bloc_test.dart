// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';

class _MockReplyRepository extends Mock implements ReplyRepository {}

class _MockLinkLauncher extends Mock implements LinkLauncher {}

void main() {
  const url = 'url';
  final initialState = ReplyState.initial(url: url);

  group(ReplyBloc, () {
    late ReplyRepository repository;
    late LinkLauncher linkLauncher;

    setUp(() {
      repository = _MockReplyRepository();
      linkLauncher = _MockLinkLauncher();
    });

    ReplyBloc buildBloc() {
      return ReplyBloc(
        url: url,
        replyRepository: repository,
        linkLauncher: linkLauncher,
      );
    }

    test('initial state is $ReplyState', () {
      expect(buildBloc().state, initialState);
    });

    group(ReplyStarted, () {
      final request = () => repository.fetchReplyForm(url: url);
      final form = ReplyFormPlaceholder();

      blocTest<ReplyBloc, ReplyState>(
        'emits [success] and $ReplyForm when request succeeds',
        setUp: () {
          when(request).thenAnswer((_) async => form);
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ReplyStarted(),
          );
        },
        expect: () => [
          initialState.copyWith(
            form: form,
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

      blocTest<ReplyBloc, ReplyState>(
        'emits text',
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ReplyTextChanged(text),
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
  });
}
