// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockWebRedirectBloc extends MockBloc<WebRedirectEvent, WebRedirectState>
    implements WebRedirectBloc {}

class _MockWebRedirectState extends Mock implements WebRedirectState {}

void main() {
  group(WebRedirectBackButton, () {
    late WebRedirectBloc bloc;
    late WebRedirectState state;

    setUp(() {
      bloc = _MockWebRedirectBloc();
      state = _MockWebRedirectState();
      when(() => bloc.state).thenReturn(state);
      when(() => state.canGoBack).thenReturn(false);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: WebRedirectBackButton(),
      );
    }

    testWidgets('renders $IconButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('adds $WebRedirectBackPressed when $IconButton '
        'is pressed and canGoBack', (tester) async {
      when(() => state.canGoBack).thenReturn(true);
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(IconButton));
      verify(() => bloc.add(WebRedirectBackPressed())).called(1);
    });

    testWidgets('does not add $WebRedirectBackPressed when $IconButton '
        'is pressed and !canGoBack', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(IconButton));
      verifyNever(() => bloc.add(WebRedirectBackPressed()));
    });
  });
}
