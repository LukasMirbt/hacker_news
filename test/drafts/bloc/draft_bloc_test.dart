// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/drafts/drafts.dart';
import 'package:mocktail/mocktail.dart';

class _MockDraftRepository extends Mock implements DraftRepository {}

void main() {
  group(DraftBloc, () {
    late DraftRepository repository;

    setUp(() {
      repository = _MockDraftRepository();
    });

    DraftBloc buildBloc() {
      return DraftBloc(draftRepository: repository);
    }

    test('initial state is $DraftState', () {
      expect(buildBloc().state, DraftState());
    });

    group(DraftSubscriptionRequested, () {
      final drafts = [
        ReplyDraftPlaceholder(),
        CommentDraftPlaceholder(),
      ];

      final exception = Exception('oops');

      blocTest(
        'emits success and drafts onData',
        build: buildBloc,
        setUp: () {
          when(() => repository.drafts).thenAnswer(
            (_) => Stream.value(drafts),
          );
        },
        act: (bloc) {
          bloc.add(
            DraftSubscriptionRequested(),
          );
        },
        expect: () => [
          DraftState(
            status: DraftStatus.success,
            drafts: [
              for (final draft in drafts) DraftModel.from(draft),
            ],
          ),
        ],
      );

      blocTest(
        'emits failure onError',
        build: buildBloc,
        setUp: () {
          when(() => repository.drafts).thenAnswer(
            (_) => Stream.error(exception),
          );
        },
        act: (bloc) {
          bloc.add(
            DraftSubscriptionRequested(),
          );
        },
        expect: () => [
          DraftState(status: DraftStatus.failure),
        ],
        errors: () => [exception],
      );
    });
  });
}
