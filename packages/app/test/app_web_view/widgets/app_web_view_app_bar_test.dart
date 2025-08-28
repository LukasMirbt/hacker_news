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
  const title = 'title';

  group(AppWebViewAppBar, () {
    late AppWebViewBloc bloc;
    late AppWebViewState state;

    setUp(() {
      bloc = _MockAppWebViewBloc();
      state = _MockAppWebViewState();
      when(() => bloc.state).thenReturn(state);
      when(() => state.title).thenReturn(title);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: AppWebViewAppBar(),
      );
    }

    group(AppBar, () {
      AppBar findWidget(WidgetTester tester) {
        return tester.widget<AppBar>(
          find.byType(AppBar),
        );
      }

      testWidgets('has correct toolbarHeight', (tester) async {
        await tester.pumpApp(buildSubject());
        final appBar = findWidget(tester);
        expect(appBar.toolbarHeight, 48);
      });

      testWidgets('centerTitle is true', (tester) async {
        await tester.pumpApp(buildSubject());
        final appBar = findWidget(tester);
        expect(appBar.centerTitle, true);
      });

      testWidgets('title is correct', (tester) async {
        when(() => state.url).thenReturn(null);
        await tester.pumpApp(buildSubject());
        final appBar = findWidget(tester);
        expect(
          appBar.title,
          isA<Text>().having(
            (text) => text.data,
            'data',
            title,
          ),
        );
      });
    });
  });
}
