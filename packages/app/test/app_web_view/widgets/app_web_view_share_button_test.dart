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

void main() {
  final url = Uri.parse('https://example.com');

  group(AppWebViewShareButton, () {
    late AppWebViewBloc bloc;
    late AppWebViewState state;

    setUp(() {
      bloc = _MockAppWebViewBloc();
      state = _MockAppWebViewState();
      when(() => bloc.state).thenReturn(state);
      when(() => state.isShareEnabled).thenReturn(false);
      registerFallbackValue(AppWebViewSharePressed(url));
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: AppWebViewShareButton(),
      );
    }

    testWidgets('renders $IconButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('adds $AppWebViewSharePressed '
        'when $IconButton is pressed and isShareEnabled', (tester) async {
      when(() => state.url).thenReturn(url);
      when(() => state.isShareEnabled).thenReturn(true);
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(IconButton));
      verify(
        () => bloc.add(
          AppWebViewSharePressed(url),
        ),
      ).called(1);
    });

    testWidgets('does not add $AppWebViewSharePressed '
        'when $IconButton is pressed and !isShareEnabled', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(IconButton));
      verifyNever(() => bloc.add(any()));
    });
  });
}
