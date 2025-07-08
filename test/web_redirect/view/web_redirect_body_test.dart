// ignore_for_file: prefer_const_constructors

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';
import '../mock_in_app_web_view_platform.dart';

class _MockWebRedirectBloc extends MockBloc<WebRedirectEvent, WebRedirectState>
    implements WebRedirectBloc {}

void main() {
  group(WebRedirectBody, () {
    late WebRedirectBloc bloc;

    setUp(() {
      bloc = _MockWebRedirectBloc();
      when(() => bloc.state).thenReturn(
        WebRedirectState.from(
          WebRedirectPlaceholder(),
        ),
      );
      when(() => bloc.stream).thenAnswer((_) => Stream.value(bloc.state));
      InAppWebViewPlatform.instance = MockInAppWebViewPlatform();
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: WebRedirectBody(),
      );
    }

    testWidgets('renders $WebRedirectWebView', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(WebRedirectWebView), findsOneWidget);
    });

    testWidgets('renders $WebRedirectProgressIndicator', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(WebRedirectProgressIndicator), findsOneWidget);
    });
  });
}
