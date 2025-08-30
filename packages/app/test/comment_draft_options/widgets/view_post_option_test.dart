// ignore_for_file: prefer_const_constructors

import 'package:app/app_router/app_router.dart';
import 'package:app/comment_draft_options/comment_draft_options.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/post/post.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAppRouter extends Mock implements AppRouter {}

class _MockCommentDraftOptionsBloc
    extends MockBloc<void, CommentDraftOptionsState>
    implements CommentDraftOptionsBloc {}

class _MockCommentDraftOptionsState extends Mock
    implements CommentDraftOptionsState {}

class _MockCommentDraftModel extends Mock implements CommentDraftModel {}

void main() async {
  const postTitle = 'postTitle';
  const postId = 'postId';
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(ViewPostOption, () {
    late CommentDraftOptionsBloc bloc;
    late CommentDraftOptionsState state;
    late CommentDraftModel draft;
    late AppRouter router;
    late MockNavigator navigator;

    setUp(() {
      bloc = _MockCommentDraftOptionsBloc();
      state = _MockCommentDraftOptionsState();
      draft = _MockCommentDraftModel();
      router = _MockAppRouter();
      navigator = MockNavigator();
      when(navigator.canPop).thenReturn(true);
      when(() => bloc.state).thenReturn(state);
      when(() => state.draft).thenReturn(draft);
      when(() => draft.postId).thenReturn(postId);
      when(() => draft.postTitle).thenReturn(postTitle);
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: MockNavigatorProvider(
          navigator: navigator,
          child: BlocProvider.value(
            value: bloc,
            child: ViewPostOption(),
          ),
        ),
      );
    }

    ListTile findWidget(WidgetTester tester) {
      return tester.widget<ListTile>(
        find.byType(ListTile),
      );
    }

    group(ListTile, () {
      testWidgets('has correct leading', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.leading,
          isA<AppIcon>().having(
            (icon) => icon.icon,
            'icon',
            Symbols.article_shortcut_rounded,
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
            l10n.commentDraftOptions_viewPost,
          ),
        );
      });

      testWidgets('has correct subtitle', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.subtitle,
          isA<Text>()
              .having(
                (text) => text.data,
                'data',
                postTitle,
              )
              .having(
                (text) => text.maxLines,
                'maxLines',
                1,
              )
              .having(
                (text) => text.overflow,
                'overflow',
                TextOverflow.ellipsis,
              ),
        );
      });

      testWidgets('pops and navigates to $PostRoute onTap', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onTap?.call();
        verify(navigator.pop).called(1);
        verify(
          () => router.goRelative(
            PostRoute(postId: postId),
          ),
        ).called(1);
      });
    });
  });
}
