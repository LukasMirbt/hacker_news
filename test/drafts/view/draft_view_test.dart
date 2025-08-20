// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/drafts/drafts.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockDraftBloc extends MockBloc<DraftEvent, DraftState>
    implements DraftBloc {}

void main() {
  final initialState = DraftState();

  group(DraftView, () {
    late DraftBloc bloc;

    setUp(() {
      bloc = _MockDraftBloc();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: DraftView(),
      );
    }

    testWidgets('renders $AppLoadingBody when status '
        'is ${DraftStatus.loading}', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppLoadingBody), findsOneWidget);
    });

    testWidgets('renders $DraftEmptyBody when status '
        'is ${DraftStatus.success} and drafts.isEmpty', (tester) async {
      when(() => bloc.state).thenReturn(
        initialState.copyWith(
          status: DraftStatus.success,
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(DraftEmptyBody), findsOneWidget);
    });

    testWidgets('renders $DraftBody when status '
        'is ${DraftStatus.success} and !drafts.isEmpty', (tester) async {
      when(() => bloc.state).thenReturn(
        initialState.copyWith(
          status: DraftStatus.success,
          drafts: [
            ReplyDraftModel(
              draft: ReplyDraftPlaceholder(),
            ),
          ],
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(DraftBody), findsOneWidget);
    });

    testWidgets('renders $AppErrorBody when status '
        'is ${DraftStatus.failure}', (tester) async {
      when(() => bloc.state).thenReturn(
        initialState.copyWith(
          status: DraftStatus.failure,
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppErrorBody), findsOneWidget);
    });
  });
}
