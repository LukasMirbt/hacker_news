// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';
import '../mock_in_app_web_view_platform.dart';

class _MockWebRedirectBloc extends MockBloc<WebRedirectEvent, WebRedirectState>
    implements WebRedirectBloc {}

class _MockWebRedirectState extends Mock implements WebRedirectState {}

void main() {
  final redirect = WebRedirectPlaceholder();
  final initialState = WebRedirectState.from(redirect);

  group(WebRedirectView, () {
    late WebRedirectBloc bloc;
    late WebRedirectState state;

    setUp(() {
      bloc = _MockWebRedirectBloc();
      state = _MockWebRedirectState();
      when(() => bloc.state).thenReturn(state);
      when(() => bloc.state).thenReturn(initialState);
      InAppWebViewPlatform.instance = MockInAppWebViewPlatform();
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: WebRedirectView(),
      );
    }

    testWidgets('renders $WebRedirectPopScope', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(WebRedirectPopScope), findsOneWidget);
    });

    testWidgets('renders $WebRedirectActionBar', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(WebRedirectActionBar), findsOneWidget);
    });

    testWidgets('renders $AppLoadingBody when isLoading', (tester) async {
      when(() => bloc.state).thenReturn(
        initialState.copyWith(
          initialLoadStatus: InitialLoadStatus.loading,
        ),
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppLoadingBody), findsOneWidget);
    });

    testWidgets('renders $WebRedirectView when !isLoading', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(WebRedirectView), findsOneWidget);
    });
  });
}
