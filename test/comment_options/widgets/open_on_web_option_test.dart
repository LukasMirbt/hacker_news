// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/comment_options/comment_options.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockCommentOptionsBloc extends MockBloc<void, CommentOptionsState>
    implements CommentOptionsBloc {}

class _MockAppRouter extends Mock implements AppRouter {}

class _MockCommentModel extends Mock implements CommentModel {}

class _MockCommentOptionsState extends Mock implements CommentOptionsState {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  final webRedirect = WebRedirectPlaceholder();

  group(OpenOnWebOption, () {
    late CommentOptionsBloc bloc;
    late CommentOptionsState state;
    late CommentModel comment;
    late MockNavigator navigator;
    late AppRouter router;

    setUp(() {
      bloc = _MockCommentOptionsBloc();
      state = _MockCommentOptionsState();
      comment = _MockCommentModel();
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
      expect(find.byIcon(Icons.open_in_browser), findsOneWidget);
    });

    testWidgets('renders correct title', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.text(l10n.commentOptions_openOnWeb),
        findsOneWidget,
      );
    });

    testWidgets('pops and pushes $WebRedirectRoute when $ListTile '
        'is tapped', (tester) async {
      final push = () => router.push(
        WebRedirectRoute(url: webRedirect.urlString),
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
