// ignore_for_file: prefer_const_constructors

import 'package:app/app_web_view/app_web_view.dart';
import 'package:app/web_redirect/web_redirect.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';
import '../../app_web_view/mock_in_app_web_view_platform.dart';

class _MockAppWebViewBloc extends MockBloc<AppWebViewEvent, AppWebViewState>
    implements AppWebViewBloc {}

void main() {
  final initialState = AppWebViewState.from(
    WebRedirectWebViewConfiguration(
      url: 'url',
      html: 'html',
    ),
  );

  group(WebRedirectView, () {
    late AppWebViewBloc bloc;

    setUp(() {
      bloc = _MockAppWebViewBloc();
      when(() => bloc.state).thenReturn(initialState);
      InAppWebViewPlatform.instance = MockInAppWebViewPlatform();
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: WebRedirectView(),
      );
    }

    testWidgets('renders $AppWebViewPopScope', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppWebViewPopScope), findsOneWidget);
    });

    testWidgets('renders $AppWebViewAppBar', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppWebViewAppBar), findsOneWidget);
    });

    testWidgets('renders $AppWebViewActionBar', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppWebViewActionBar), findsOneWidget);
    });

    testWidgets('renders $AppLoadingBody when isLoading', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppLoadingBody), findsOneWidget);
    });

    testWidgets('renders $WebRedirectBody when !isLoading', (tester) async {
      when(() => bloc.state).thenReturn(
        initialState.copyWith(
          initialLoadStatus: InitialLoadStatus.success,
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(WebRedirectBody), findsOneWidget);
    });
  });
}
