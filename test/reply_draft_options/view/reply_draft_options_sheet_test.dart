// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/reply_draft_options/reply_draft_options.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';
import '../../post/pump_post.dart';

class _MockDraftRepository extends Mock implements DraftRepository {}

class _MockReplyDraftOptionsBloc extends MockBloc<void, ReplyDraftOptionsState>
    implements ReplyDraftOptionsBloc {}

void main() {
  final draft = ReplyDraftPlaceholder();

  group(ReplyDraftOptionsSheet, () {
    late DraftRepository repository;
    late ReplyDraftOptionsBloc bloc;

    setUp(() {
      repository = _MockDraftRepository();
      bloc = _MockReplyDraftOptionsBloc();
      when(() => bloc.state).thenReturn(
        ReplyDraftOptionsState.from(draft),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ReplyDraftOptionsSheet(),
      );
    }

    group('show', () {
      testWidgets('renders $ReplyDraftOptionsSheet', (tester) async {
        await tester.pumpPostWithContext(
          (context) => ReplyDraftOptionsSheet.show(
            context: context,
            draft: draft,
            draftRepository: repository,
          ),
        );
        expect(
          find.byType(ReplyDraftOptionsSheet),
          findsOneWidget,
        );
      });

      testWidgets('provides $DraftRepository', (tester) async {
        await tester.pumpPostWithContext(
          (context) => ReplyDraftOptionsSheet.show(
            context: context,
            draft: draft,
            draftRepository: repository,
          ),
        );
        final context = tester.element(
          find.byType(ReplyDraftOptionsSheet),
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

    testWidgets('renders $DeleteOption', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(DeleteOption), findsOneWidget);
    });
  });
}
