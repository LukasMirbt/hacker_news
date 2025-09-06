// ignore_for_file: prefer_const_constructors

import 'package:app/delete_draft/delete_draft.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockDraftRepository extends Mock implements DraftRepository {}

class _MockDeleteDraftBloc extends MockBloc<DeleteDraftEvent, DeleteDraftState>
    implements DeleteDraftBloc {}

void main() {
  final draft = ReplyDraftPlaceholder();

  group(DeleteDraftDialog, () {
    late DraftRepository repository;
    late DeleteDraftBloc bloc;

    setUp(() {
      repository = _MockDraftRepository();
      bloc = _MockDeleteDraftBloc();
      when(() => bloc.state).thenReturn(
        DeleteDraftState(draft: draft),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: DeleteDraftDialog(),
      );
    }

    group('show', () {
      testWidgets('renders $DeleteDraftDialog', (tester) async {
        await tester.pumpAppWithContext(
          (context) => DeleteDraftDialog.show(
            context: context,
            draft: draft,
            draftRepository: repository,
          ),
        );
        expect(
          find.byType(DeleteDraftDialog),
          findsOneWidget,
        );
      });
    });

    testWidgets('renders $AlertDialog', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AlertDialog), findsOneWidget);
    });

    testWidgets('renders $CancelButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CancelButton), findsOneWidget);
    });

    testWidgets('renders $ConfirmButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ConfirmButton), findsOneWidget);
    });
  });
}
