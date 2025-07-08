// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/feed_item_options/feed_item_options.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockFeedItemOptionsBloc extends MockBloc<void, FeedItemOptionsState>
    implements FeedItemOptionsBloc {}

class _MockGoRouter extends Mock implements GoRouter {}

class _MockCommentModel extends Mock implements FeedItemModel {}

class _MockFeedItemOptionsState extends Mock implements FeedItemOptionsState {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  final webRedirect = WebRedirectPlaceholder();

  group(OpenOnWebOption, () {
    late FeedItemOptionsBloc bloc;
    late FeedItemOptionsState state;
    late FeedItemModel item;
    late GoRouter router;

    setUp(() {
      bloc = _MockFeedItemOptionsBloc();
      state = _MockFeedItemOptionsState();
      item = _MockCommentModel();
      router = _MockGoRouter();
      when(() => bloc.state).thenReturn(state);
      when(() => state.item).thenReturn(item);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: OpenOnWebOption(),
      );
    }

    testWidgets('renders $ListTile', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('renders correct icon', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byIcon(Icons.open_in_browser), findsOneWidget);
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
      final route = WebRedirectRoute(url: webRedirect.urlString);
      final pushReplacement = () =>
          router.pushReplacement<Object?>(route.location);
      when(pushReplacement).thenAnswer((_) async => null);
      when(() => item.webRedirect).thenReturn(webRedirect);
      await tester.pumpApp(
        buildSubject(),
        router: router,
      );
      await tester.tap(find.byType(ListTile));
      verify(pushReplacement).called(1);
    });
  });
}
