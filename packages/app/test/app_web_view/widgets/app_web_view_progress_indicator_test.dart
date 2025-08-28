// ignore_for_file: prefer_const_constructors

import 'package:app/app_web_view/app_web_view.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockAppWebViewBloc extends MockBloc<AppWebViewEvent, AppWebViewState>
    implements AppWebViewBloc {}

class _MockAppWebViewState extends Mock implements AppWebViewState {}

class _MockAppWebViewProgressModel extends Mock
    implements AppWebViewProgressModel {}

void main() {
  const opacity = 0.6;
  const value = 0.3;

  group(AppWebViewProgressIndicator, () {
    late AppWebViewBloc bloc;
    late AppWebViewState state;
    late AppWebViewProgressModel progress;

    setUp(() {
      bloc = _MockAppWebViewBloc();
      state = _MockAppWebViewState();
      progress = _MockAppWebViewProgressModel();
      when(() => bloc.state).thenReturn(state);
      when(() => state.progress).thenReturn(progress);
      when(() => progress.opacity).thenReturn(opacity);
      when(() => progress.value).thenReturn(value);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: AppWebViewProgressIndicator(),
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
