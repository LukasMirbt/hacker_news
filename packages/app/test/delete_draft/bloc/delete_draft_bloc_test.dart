// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/delete_draft/delete_draft.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDraftRepository extends Mock implements DraftRepository {}

void main() {
  final draft = ReplyDraftPlaceholder();
  final initialState = DeleteDraftState(draft: draft);

  group(DeleteDraftBloc, () {
    late DraftRepository repository;

    setUp(() {
      repository = _MockDraftRepository();
    });

    DeleteDraftBloc buildBloc() {
      return DeleteDraftBloc(
        draft: draft,
        draftRepository: repository,
      );
    }

    test('initial state is $DeleteDraftState', () {
      expect(buildBloc().state, initialState);
    });

    group(DeleteDraftConfirmed, () {
      final deleteDraft = () => repository.deleteDraft(draft);

      blocTest(
        'calls deleteDraft',
        setUp: () {
          when(deleteDraft).thenAnswer((_) async {
            return;
          });
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            DeleteDraftConfirmed(),
          );
        },
        verify: (_) {
          verify(deleteDraft).called(1);
        },
      );
    });
  });
}
