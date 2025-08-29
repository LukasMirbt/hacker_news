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

void main() {
  group(AppWebViewShareButton, () {
    late AppWebViewBloc bloc;

    setUp(() {
      bloc = _MockAppWebViewBloc();
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
        'when $IconButton is pressed', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(IconButton));
      verify(
        () => bloc.add(AppWebViewSharePressed()),
      ).called(1);
    });
  });
}
