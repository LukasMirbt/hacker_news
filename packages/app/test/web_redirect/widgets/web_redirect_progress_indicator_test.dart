// ignore_for_file: prefer_const_constructors

import 'package:app/web_redirect/web_redirect.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockWebRedirectBloc extends MockBloc<WebRedirectEvent, WebRedirectState>
    implements WebRedirectBloc {}

class _MockWebRedirectState extends Mock implements WebRedirectState {}

void main() {
  const progressValue = 0.5;

  group(WebRedirectProgressIndicator, () {
    late WebRedirectBloc bloc;
    late WebRedirectState state;

    setUp(() {
      bloc = _MockWebRedirectBloc();
      state = _MockWebRedirectState();
      when(() => bloc.state).thenReturn(state);
      when(() => state.progressValue).thenReturn(progressValue);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: WebRedirectProgressIndicator(),
      );
    }

    testWidgets('renders $LinearProgressIndicator with correct value', (
      tester,
    ) async {
      await tester.pumpApp(buildSubject());
      final widget = tester.widget<LinearProgressIndicator>(
        find.byType(LinearProgressIndicator),
      );
      expect(widget.value, progressValue);
    });
  });
}
