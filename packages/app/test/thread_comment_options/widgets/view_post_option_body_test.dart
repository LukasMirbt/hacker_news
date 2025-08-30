// ignore_for_file: prefer_const_constructors

import 'package:app/app_router/app_router.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/post/post.dart';
import 'package:app/thread_comment_options/thread_comment_options.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAppRouter extends Mock implements AppRouter {}

class _MockThreadCommentOptionsBloc
    extends MockBloc<ThreadCommentOptionsEvent, ThreadCommentOptionsState>
    implements ThreadCommentOptionsBloc {}

class _MockThreadCommentOptionsState extends Mock
    implements ThreadCommentOptionsState {}

class _MockThreadCommentModel extends Mock implements ThreadCommentModel {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  const postId = 'postId';
  const onTitle = 'onTitle';

  group(ViewPostOptionBody, () {
    late ThreadCommentOptionsBloc bloc;
    late ThreadCommentOptionsState state;
    late ThreadCommentModel comment;
    late AppRouter router;
    late MockNavigator navigator;

    setUp(() {
      bloc = _MockThreadCommentOptionsBloc();
      state = _MockThreadCommentOptionsState();
      comment = _MockThreadCommentModel();
      router = _MockAppRouter();
      navigator = MockNavigator();
      when(navigator.canPop).thenReturn(true);
      when(() => bloc.state).thenReturn(state);
      when(() => state.comment).thenReturn(comment);
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: MockNavigatorProvider(
          navigator: navigator,
          child: BlocProvider.value(
            value: bloc,
            child: ViewPostOptionBody(postId: postId),
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
            l10n.threadCommentOptions_viewPost,
          ),
        );
      });

      testWidgets('has correct subtitle when onTitle '
          'is non-null', (tester) async {
        when(() => comment.onTitle).thenReturn(onTitle);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.subtitle,
          isA<Text>()
              .having(
                (text) => text.data,
                'data',
                onTitle,
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

      testWidgets('has correct subtitle when onTitle '
          'is null', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.subtitle, null);
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
