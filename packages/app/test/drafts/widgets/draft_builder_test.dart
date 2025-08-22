// ignore_for_file: prefer_const_constructors

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
  final drafts = [
    CommentDraftModel(
      draft: CommentDraftPlaceholder(),
    ),
    ReplyDraftModel(
      draft: ReplyDraftPlaceholder(),
    ),
  ];

  group(DraftBuilder, () {
    late DraftBloc bloc;
    late DraftState state;

    setUp(() {
      bloc = _MockDraftBloc();
      state = _MockDraftState();
      when(() => bloc.state).thenReturn(state);
      when(() => state.drafts).thenReturn(drafts);
    });

    DraftBuilder createSubject() => DraftBuilder();

    Widget buildSubject(
      Widget Function(BuildContext) builder,
    ) {
      return BlocProvider.value(
        value: bloc,
        child: Builder(builder: builder),
      );
    }

    group('itemBuilder', () {
      testWidgets('renders $CommentDraftItem when draft '
          'is $CommentDraftModel', (tester) async {
        final builder = createSubject();
        await tester.pumpApp(
          buildSubject(
            (context) => builder.itemBuilder(context, 0),
          ),
        );
        expect(find.byType(CommentDraftItem), findsOneWidget);
      });

      testWidgets('renders $ReplyDraftItem when draft '
          'is $ReplyDraftModel', (tester) async {
        final builder = createSubject();
        await tester.pumpApp(
          buildSubject(
            (context) => builder.itemBuilder(context, 1),
          ),
        );
        expect(find.byType(ReplyDraftItem), findsOneWidget);
      });
    });
  });
}
