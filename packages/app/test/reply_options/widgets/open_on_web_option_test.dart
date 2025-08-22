// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/app_router/app_router.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/reply_options/reply_options.dart';
import 'package:app/web_redirect/web_redirect.dart';
import 'package:app_ui/app_ui.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockReplyOptionsBloc
    extends MockBloc<ReplyOptionsEvent, ReplyOptionsState>
    implements ReplyOptionsBloc {}

class _MockAppRouter extends Mock implements AppRouter {}

class _MockReplyParentModel extends Mock implements ReplyParentModel {}

class _MockReplyOptionsState extends Mock implements ReplyOptionsState {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  final webRedirect = WebRedirectPlaceholder();

  group(OpenOnWebOption, () {
    late ReplyOptionsBloc bloc;
    late ReplyOptionsState state;
    late ReplyParentModel parent;
    late MockNavigator navigator;
    late AppRouter router;

    setUp(() {
      bloc = _MockReplyOptionsBloc();
      state = _MockReplyOptionsState();
      parent = _MockReplyParentModel();
      router = _MockAppRouter();
      navigator = MockNavigator();
      when(navigator.canPop).thenReturn(true);
      when(() => bloc.state).thenReturn(state);
      when(() => state.parent).thenReturn(parent);
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
      expect(
        find.byIcon(Symbols.open_in_browser_rounded),
        findsOneWidget,
      );
    });

    testWidgets('renders correct title', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.text(l10n.replyOptions_openOnWeb),
        findsOneWidget,
      );
    });

    testWidgets('pops and pushes $WebRedirectRoute when $ListTile '
        'is tapped', (tester) async {
      final push = () => router.push(
        WebRedirectRoute(url: webRedirect.urlString),
      );
      when(push).thenAnswer((_) async => null);
      when(() => parent.webRedirect).thenReturn(webRedirect);
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(ListTile));
      verify(navigator.pop).called(1);
      verify(push).called(1);
    });
  });
}
