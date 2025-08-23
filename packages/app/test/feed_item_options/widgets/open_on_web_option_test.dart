// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/app_router/app_router.dart';
import 'package:app/feed_item_options/feed_item_options.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/web_redirect/web_redirect.dart';
import 'package:app_ui/app_ui.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockFeedItemOptionsBloc extends MockBloc<void, FeedItemOptionsState>
    implements FeedItemOptionsBloc {}

class _MockAppRouter extends Mock implements AppRouter {}

class _MockCommentModel extends Mock implements FeedItemModel {}

class _MockFeedItemOptionsState extends Mock implements FeedItemOptionsState {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  final webRedirect = WebRedirectPlaceholder();

  group(OpenOnWebOption, () {
    late FeedItemOptionsBloc bloc;
    late FeedItemOptionsState state;
    late FeedItemModel item;
    late AppRouter router;

    setUp(() {
      bloc = _MockFeedItemOptionsBloc();
      state = _MockFeedItemOptionsState();
      item = _MockCommentModel();
      router = _MockAppRouter();
      when(() => bloc.state).thenReturn(state);
      when(() => state.item).thenReturn(item);
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: BlocProvider.value(
          value: bloc,
          child: OpenOnWebOption(),
        ),
      );
    }

    testWidgets('renders $ListTile', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('renders correct icon', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.byIcon(Symbols.open_in_browser_rounded),
        findsOneWidget,
      );
    });

    testWidgets('renders correct title', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.text(l10n.feedItemOptions_openOnWeb),
        findsOneWidget,
      );
    });

    testWidgets('navigates to $WebRedirectRoute when $ListTile '
        'is tapped', (tester) async {
      final push = () => router.push<Object?>(
        WebRedirectRoute(
          url: webRedirect.urlString,
        ),
      );
      when(push).thenAnswer((_) async => null);
      when(() => item.webRedirect).thenReturn(webRedirect);
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(ListTile));
      verify(push).called(1);
    });
  });
}
