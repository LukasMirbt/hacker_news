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
  group(WebRedirectForwardButton, () {
    late WebRedirectBloc bloc;
    late WebRedirectState state;

    setUp(() {
      bloc = _MockWebRedirectBloc();
      state = _MockWebRedirectState();
      when(() => bloc.state).thenReturn(state);
      when(() => state.canGoForward).thenReturn(false);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: WebRedirectForwardButton(),
      );
    }

    testWidgets('renders $IconButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('adds $WebRedirectForwardPressed when $IconButton '
        'is pressed and canGoForward', (tester) async {
      when(() => state.canGoForward).thenReturn(true);
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(IconButton));
      verify(() => bloc.add(WebRedirectForwardPressed())).called(1);
    });

    testWidgets('does not add $WebRedirectForwardPressed when $IconButton '
        'is pressed and !canGoForward', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(IconButton));
      verifyNever(() => bloc.add(WebRedirectForwardPressed()));
    });
  });
}
