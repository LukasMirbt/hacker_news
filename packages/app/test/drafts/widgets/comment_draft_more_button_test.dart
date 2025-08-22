import 'package:app/comment_draft_options/comment_draft_options.dart'
    hide CommentDraftModel;
import 'package:app/drafts/drafts.dart';
import 'package:app_ui/app_ui.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockDraftRepository extends Mock implements DraftRepository {}

class _MockCommentDraftModel extends Mock implements CommentDraftModel {}

void main() {
  group(CommentDraftMoreButton, () {
    late DraftRepository repository;
    late CommentDraftModel draft;

    setUp(() {
      repository = _MockDraftRepository();
      draft = _MockCommentDraftModel();
    });

    Widget createSubject() {
      return RepositoryProvider.value(
        value: repository,
        child: CommentDraftMoreButton(draft),
      );
    }

    testWidgets('renders $IconButton', (tester) async {
      await tester.pumpApp(createSubject());
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('renders correct icon', (tester) async {
      await tester.pumpApp(createSubject());
      expect(
        find.byIcon(Symbols.more_vert_rounded),
        findsOneWidget,
      );
    });

    testWidgets('shows $CommentDraftOptionsSheet '
        'when $IconButton is pressed', (tester) async {
      final repositoryDraft = CommentDraftPlaceholder();
      when(draft.toRepository).thenReturn(repositoryDraft);
      await tester.pumpApp(createSubject());
      await tester.tap(find.byType(IconButton));
      await tester.pump();
      expect(find.byType(CommentDraftOptionsSheet), findsOneWidget);
    });
  });
}
