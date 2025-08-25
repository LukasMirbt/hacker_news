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

class _MockWebRedirectProgressModel extends Mock
    implements WebRedirectProgressModel {}

void main() {
  const opacity = 0.6;
  const value = 0.3;

  group(WebRedirectProgressIndicator, () {
    late WebRedirectBloc bloc;
    late WebRedirectState state;
    late WebRedirectProgressModel progress;

    setUp(() {
      bloc = _MockWebRedirectBloc();
      state = _MockWebRedirectState();
      progress = _MockWebRedirectProgressModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.progress).thenReturn(progress);
      when(() => progress.opacity).thenReturn(opacity);
      when(() => progress.value).thenReturn(value);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: WebRedirectProgressIndicator(),
      );
    }

    testWidgets('renders $AnimatedOpacity '
        'with correct opacity', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = tester.widget<AnimatedOpacity>(
        find.byType(AnimatedOpacity),
      );
      expect(widget.opacity, opacity);
    });

    testWidgets('renders $LinearProgressIndicator '
        'with correct value', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = tester.widget<LinearProgressIndicator>(
        find.byType(LinearProgressIndicator),
      );
      expect(widget.value, value);
    });
  });
}
