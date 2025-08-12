// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_draft_options/comment_draft_options.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';
import '../../post/pump_post.dart';

class _MockDraftRepository extends Mock implements DraftRepository {}

class _MockCommentDraftOptionsBloc
    extends MockBloc<void, CommentDraftOptionsState>
    implements CommentDraftOptionsBloc {}

void main() {
  final draft = CommentDraftPlaceholder();

  group(CommentDraftOptionsSheet, () {
    late DraftRepository repository;
    late CommentDraftOptionsBloc bloc;

    setUp(() {
      repository = _MockDraftRepository();
      bloc = _MockCommentDraftOptionsBloc();
      when(() => bloc.state).thenReturn(
        CommentDraftOptionsState.from(draft),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: CommentDraftOptionsSheet(),
      );
    }

    group('show', () {
      testWidgets('renders $CommentDraftOptionsSheet', (tester) async {
        await tester.pumpPostWithContext(
          (context) => CommentDraftOptionsSheet.show(
            context: context,
            draft: draft,
            draftRepository: repository,
          ),
        );
        expect(
          find.byType(CommentDraftOptionsSheet),
          findsOneWidget,
        );
      });

      testWidgets('provides $DraftRepository', (tester) async {
        await tester.pumpPostWithContext(
          (context) => CommentDraftOptionsSheet.show(
            context: context,
            draft: draft,
            draftRepository: repository,
          ),
        );
        final context = tester.element(
          find.byType(CommentDraftOptionsSheet),
        );
        expect(
          context.read<DraftRepository>(),
          repository,
        );
      });
    });

    testWidgets('renders $AppBottomSheet', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppBottomSheet), findsOneWidget);
    });

    testWidgets('renders $ViewPostOption', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ViewPostOption), findsOneWidget);
    });

    testWidgets('renders $DeleteOption', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(DeleteOption), findsOneWidget);
    });
  });
}
