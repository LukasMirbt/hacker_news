// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/thread_item_options/thread_item_options.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAppRouter extends Mock implements AppRouter {}

class _MockThreadItemOptionsBloc extends MockBloc<void, ThreadItemOptionsState>
    implements ThreadItemOptionsBloc {}

class _MockThreadItemOptionsState extends Mock
    implements ThreadItemOptionsState {}

class _MockThreadItemModel extends Mock implements ThreadItemModel {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  const postId = 'postId';
  const onTitle = 'onTitle';

  group(ViewPostOptionBody, () {
    late ThreadItemOptionsBloc bloc;
    late ThreadItemOptionsState state;
    late ThreadItemModel item;
    late AppRouter router;
    late MockNavigator navigator;

    setUp(() {
      bloc = _MockThreadItemOptionsBloc();
      state = _MockThreadItemOptionsState();
      item = _MockThreadItemModel();
      router = _MockAppRouter();
      navigator = MockNavigator();
      when(navigator.canPop).thenReturn(true);
      when(() => bloc.state).thenReturn(state);
      when(() => state.item).thenReturn(item);
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
          isA<Icon>().having(
            (icon) => icon.icon,
            'icon',
            Symbols.article_shortcut,
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
            l10n.threadItemOptions_viewPost,
          ),
        );
      });

      testWidgets('has correct subtitle when onTitle '
          'is non-null', (tester) async {
        when(() => item.onTitle).thenReturn(onTitle);
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
