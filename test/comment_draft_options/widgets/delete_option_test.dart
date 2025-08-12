// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_draft_options/comment_draft_options.dart';
import 'package:hacker_client/delete_draft/delete_draft.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../app/pump_app.dart';

class _MockDraftRepository extends Mock implements DraftRepository {}

class _MockCommentDraftOptionsBloc
    extends MockBloc<void, CommentDraftOptionsState>
    implements CommentDraftOptionsBloc {}

class _MockCommentDraftOptionsState extends Mock
    implements CommentDraftOptionsState {}

void main() async {
  final draft = CommentDraftPlaceholder();
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(DeleteOption, () {
    late DraftRepository repository;
    late CommentDraftOptionsBloc bloc;
    late CommentDraftOptionsState state;
    late MockNavigator navigator;

    setUp(() {
      repository = _MockDraftRepository();
      bloc = _MockCommentDraftOptionsBloc();
      state = _MockCommentDraftOptionsState();
      navigator = MockNavigator();
      when(navigator.canPop).thenReturn(true);
      when(() => bloc.state).thenReturn(state);
      when(() => state.draft).thenReturn(
        CommentDraftModel(draft: draft),
      );
    });

    Widget buildSubject() {
      return RepositoryProvider.value(
        value: repository,
        child: MockNavigatorProvider(
          navigator: navigator,
          child: BlocProvider.value(
            value: bloc,
            child: DeleteOption(),
          ),
        ),
      );
    }

    ListTile findWidget(WidgetTester tester) {
      return tester.widget<ListTile>(
        find.byType(ListTile),
      );
    }

    ColorScheme findColorScheme(WidgetTester tester) {
      final context = tester.element(
        find.byType(DeleteOption),
      );
      return ColorScheme.of(context);
    }

    group(ListTile, () {
      testWidgets('has correct textColor', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        final colorScheme = findColorScheme(tester);
        expect(widget.textColor, colorScheme.error);
      });

      testWidgets('has correct iconColor', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        final colorScheme = findColorScheme(tester);
        expect(widget.iconColor, colorScheme.error);
      });

      testWidgets('has correct leading', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.leading,
          isA<Icon>().having(
            (icon) => icon.icon,
            'icon',
            Symbols.delete,
          ),
        );
      });

      testWidgets('has correct title', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.title,
          isA<Text>().having(
            (text) => text.data,
            'data',
            l10n.commentDraftOptions_delete,
          ),
        );
      });

      testWidgets('pops and shows $DeleteDraftDialog onTap', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onTap?.call();
        verify(navigator.pop).called(1);
        await tester.pump();
        expect(find.byType(DeleteDraftDialog), findsOneWidget);
      });
    });
  });
}
