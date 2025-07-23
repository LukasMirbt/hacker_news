// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/thread_item_options/thread_item_options.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockThreadItemOptionsBloc extends MockBloc<void, ThreadItemOptionsState>
    implements ThreadItemOptionsBloc {}

class _MockAppRouter extends Mock implements AppRouter {}

class _MockThreadItemModel extends Mock implements ThreadItemModel {}

class _MockThreadItemOptionsState extends Mock
    implements ThreadItemOptionsState {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  final webRedirect = WebRedirectPlaceholder();

  group(OpenOnWebOption, () {
    late ThreadItemOptionsBloc bloc;
    late ThreadItemOptionsState state;
    late ThreadItemModel item;
    late MockNavigator navigator;
    late AppRouter router;

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
      expect(find.byIcon(Symbols.open_in_browser), findsOneWidget);
    });

    testWidgets('renders correct title', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.text(l10n.threadItemOptions_openOnWeb),
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
      when(() => item.webRedirect).thenReturn(webRedirect);
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(ListTile));
      verify(navigator.pop).called(1);
      verify(push).called(1);
    });
  });
}
