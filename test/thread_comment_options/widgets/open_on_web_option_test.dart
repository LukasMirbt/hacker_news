// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app_ui/app_ui.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/thread_comment_options/thread_comment_options.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockThreadCommentOptionsBloc
    extends MockBloc<ThreadCommentOptionsEvent, ThreadCommentOptionsState>
    implements ThreadCommentOptionsBloc {}

class _MockAppRouter extends Mock implements AppRouter {}

class _MockThreadCommentModel extends Mock implements ThreadCommentModel {}

class _MockThreadCommentOptionsState extends Mock
    implements ThreadCommentOptionsState {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  final webRedirect = WebRedirectPlaceholder();

  group(OpenOnWebOption, () {
    late ThreadCommentOptionsBloc bloc;
    late ThreadCommentOptionsState state;
    late ThreadCommentModel comment;
    late MockNavigator navigator;
    late AppRouter router;

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
      return MockNavigatorProvider(
        navigator: navigator,
        child: Provider.value(
          value: router,
          child: BlocProvider.value(
            value: bloc,
            child: OpenOnWebOption(),
          ),
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
        find.text(l10n.threadCommentOptions_openOnWeb),
        findsOneWidget,
      );
    });

    testWidgets('pops and pushes $WebRedirectRoute when $ListTile '
        'is tapped', (tester) async {
      final push = () => router.push(
        WebRedirectRoute(
          url: webRedirect.urlString,
        ),
      );
      when(push).thenAnswer((_) async => null);
      when(() => comment.webRedirect).thenReturn(webRedirect);
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(ListTile));
      verify(navigator.pop).called(1);
      verify(push).called(1);
    });
  });
}
