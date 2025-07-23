// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/post_options/post_options.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockPostOptionsBloc extends MockBloc<void, PostOptionsState>
    implements PostOptionsBloc {}

class _MockAppRouter extends Mock implements AppRouter {}

class _MockPostModel extends Mock implements PostModel {}

class _MockPostOptionsState extends Mock implements PostOptionsState {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  final webRedirect = WebRedirectPlaceholder();

  group(OpenOnWebOption, () {
    late PostOptionsBloc bloc;
    late PostOptionsState state;
    late PostModel post;
    late AppRouter router;

    setUp(() {
      bloc = _MockPostOptionsBloc();
      state = _MockPostOptionsState();
      post = _MockPostModel();
      router = _MockAppRouter();
      when(() => bloc.state).thenReturn(state);
      when(() => state.post).thenReturn(post);
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
      expect(find.byIcon(Icons.open_in_browser), findsOneWidget);
    });

    testWidgets('renders correct title', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.text(l10n.postOptions_openOnWeb),
        findsOneWidget,
      );
    });

    testWidgets('navigates to $WebRedirectRoute when $ListTile '
        'is tapped', (tester) async {
      final push = () => router.push(
        WebRedirectRoute(
          url: webRedirect.urlString,
        ),
      );
      when(push).thenAnswer((_) async => null);
      when(() => post.webRedirect).thenReturn(webRedirect);
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(ListTile));
      verify(push).called(1);
    });
  });
}
