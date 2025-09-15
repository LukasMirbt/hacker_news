import 'package:app/drafts/drafts.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockDraftBloc extends MockBloc<DraftEvent, DraftState>
    implements DraftBloc {}

class _MockDraftState extends Mock implements DraftState {}

void main() {
  group(DraftItem, () {
    late DraftBloc bloc;
    late DraftState state;

    setUp(() {
      bloc = _MockDraftBloc();
      state = _MockDraftState();
      when(() => bloc.state).thenReturn(state);
      when(() => state.drafts).thenReturn([
        CommentDraftModel(
          draft: CommentDraftPlaceholder(),
        ),
        ReplyDraftModel(
          draft: ReplyDraftPlaceholder(),
        ),
      ]);
    });

    Widget buildSubject(int index) {
      return BlocProvider.value(
        value: bloc,
        child: DraftItem(index),
      );
    }

    testWidgets('renders $CommentDraftItem when draft '
        'is $CommentDraftModel', (tester) async {
      await tester.pumpApp(buildSubject(0));
      expect(find.byType(CommentDraftItem), findsOneWidget);
    });

    testWidgets('renders $ReplyDraftItem when draft '
        'is $ReplyDraftModel', (tester) async {
      await tester.pumpApp(buildSubject(1));
      expect(find.byType(ReplyDraftItem), findsOneWidget);
    });

    testWidgets('does not render $CommentDraftItem '
        'or $ReplyDraftItem when draft is null', (tester) async {
      await tester.pumpApp(buildSubject(2));
      expect(find.byType(CommentDraftItem), findsNothing);
      expect(find.byType(ReplyDraftItem), findsNothing);
    });
  });
}
