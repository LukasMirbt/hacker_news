import 'package:app_ui/app_ui.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/drafts/drafts.dart';
import 'package:hacker_client/reply_draft_options/reply_draft_options.dart'
    hide ReplyDraftModel;
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockDraftRepository extends Mock implements DraftRepository {}

class _MockReplyDraftModel extends Mock implements ReplyDraftModel {}

void main() {
  group(ReplyDraftMoreButton, () {
    late DraftRepository repository;
    late ReplyDraftModel draft;

    setUp(() {
      repository = _MockDraftRepository();
      draft = _MockReplyDraftModel();
    });

    Widget createSubject() {
      return RepositoryProvider.value(
        value: repository,
        child: ReplyDraftMoreButton(draft),
      );
    }

    testWidgets('renders $IconButton', (tester) async {
      await tester.pumpApp(createSubject());
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('renders correct icon', (tester) async {
      await tester.pumpApp(createSubject());
      expect(find.byIcon(Symbols.more_vert_rounded), findsOneWidget);
    });

    testWidgets('shows $ReplyDraftOptionsSheet '
        'when $IconButton is pressed', (tester) async {
      final repositoryDraft = ReplyDraftPlaceholder();
      when(draft.toRepository).thenReturn(repositoryDraft);
      await tester.pumpApp(createSubject());
      await tester.tap(find.byType(IconButton));
      await tester.pump();
      expect(find.byType(ReplyDraftOptionsSheet), findsOneWidget);
    });
  });
}
