// ignore_for_file: prefer_const_constructors

import 'package:app/delete_draft/delete_draft.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/reply_draft_options/reply_draft_options.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../app/pump_app.dart';

class _MockDraftRepository extends Mock implements DraftRepository {}

class _MockReplyDraftOptionsBloc extends MockBloc<void, ReplyDraftOptionsState>
    implements ReplyDraftOptionsBloc {}

class _MockReplyDraftOptionsState extends Mock
    implements ReplyDraftOptionsState {}

void main() async {
  final draft = ReplyDraftPlaceholder();
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(DeleteOption, () {
    late DraftRepository repository;
    late ReplyDraftOptionsBloc bloc;
    late ReplyDraftOptionsState state;
    late MockNavigator navigator;

    setUp(() {
      repository = _MockDraftRepository();
      bloc = _MockReplyDraftOptionsBloc();
      state = _MockReplyDraftOptionsState();
      navigator = MockNavigator();
      when(navigator.canPop).thenReturn(true);
      when(() => bloc.state).thenReturn(state);
      when(() => state.draft).thenReturn(
        ReplyDraftModel(draft: draft),
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
          isA<AppIcon>().having(
            (icon) => icon.icon,
            'icon',
            Symbols.delete_rounded,
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
            l10n.replyDraftOptions_delete,
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
